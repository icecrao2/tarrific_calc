import 'package:tariff_calc/domain/hs_code/entity/hs_code_entity.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_request_form_entity.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_search_record_entity.dart';
import 'package:tariff_calc/domain/hs_code/repository/hs_code_search_record_repository.dart';

import '../repository/hs_code_repository.dart';

class GetHsCodeListUsecase {
  final HsCodeRepository _hsCodeRepository;
  final HsCodeSearchRecordRepository _hsCodeSearchRecordRepository;

  GetHsCodeListUsecase({
    required HsCodeRepository hsCodeRepository,
    required  HsCodeSearchRecordRepository hsCodeSearchRecordRepository})
      : _hsCodeRepository = hsCodeRepository,
        _hsCodeSearchRecordRepository = hsCodeSearchRecordRepository;

  Future<List<HsCodeEntity>> call(String query) async {
    final methodType = _getQueryType(query);
    if (methodType == null) {
      throw Exception();
    }
    final list = await _hsCodeRepository.getHsCodeList(
        HsCodeRequestFormEntity(query: query, method: methodType));
    await _addHsSearchRecord(query);
    Set<String> hsCode = {};
    return list.where((code) => hsCode.add(code.hsCode)).toList();
  }

  HsCodeRequestMethodType? _getQueryType(String query) {
    if (_isEnglish(query)) {
      return HsCodeRequestMethodType.english;
    } else if (_isKorean(query)) {
      return HsCodeRequestMethodType.korean;
    } else if (_isNumeric(query)) {
      return HsCodeRequestMethodType.hsCode;
    }
  }

  bool _isEnglish(String input) => RegExp(r'^[a-zA-Z]+$').hasMatch(input);
  bool _isNumeric(String input) => RegExp(r'^[0-9]+$').hasMatch(input);
  bool _isKorean(String input) => RegExp(r'^[가-힣]+$').hasMatch(input);

  Future<void> _addHsSearchRecord(String searchText) async {
    final record = HsCodeSearchRecordEntity(
        searchText: searchText,
        lastSearchDate: DateTime.now(),
        searchCount: null
    );

    await _hsCodeSearchRecordRepository.addRecord(record);
  }
}
