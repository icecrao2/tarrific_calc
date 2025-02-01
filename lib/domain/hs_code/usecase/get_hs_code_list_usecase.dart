import 'package:tariff_calc/domain/hs_code/entity/hs_code_entity.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_request_form_entity.dart';

import '../repository/hs_code_repository.dart';

class GetHsCodeListUsecase {
  final HsCodeRepository _repository;

  GetHsCodeListUsecase({required HsCodeRepository repository})
      : _repository = repository;

  Future<List<HsCodeEntity>> call(String query) async {
    final methodType = _getQueryType(query);
    if (methodType == null) {
      throw Exception();
    }
    final list = await _repository.getHsCodeList(
        HsCodeRequestFormEntity(query: query, method: methodType));

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
}
