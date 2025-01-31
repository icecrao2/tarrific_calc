import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_request_form_entity.dart';
import 'package:tariff_calc/domain/hs_code/repository/hs_code_list_repository.dart';
import '../../../../domain/hs_code/entity/hs_code_entity.dart';

class HsCodeListState extends StateNotifier<List<HsCodeEntity>> {

  final HsCodeListRepository _hsCodeListRepository;

  HsCodeListState({
    required HsCodeListRepository hsCodeListRepository
  })
    : _hsCodeListRepository = hsCodeListRepository,
      super([]);

  Future<void> searchHsCode(String query) async {

    state = await _hsCodeListRepository.getHsCodeListByKorean(HsCodeRequestFormEntity(
      query: query,
      method: HsCodeRequestMethodType.korean
    ));
  }
}

