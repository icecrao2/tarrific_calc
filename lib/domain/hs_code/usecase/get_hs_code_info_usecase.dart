import 'package:tariff_calc/domain/hs_code/entity/hs_code_entity.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_request_form_entity.dart';

import '../repository/hs_code_repository.dart';

class GetHsCodeInfoUseCase {
  final HsCodeRepository _repository;

  GetHsCodeInfoUseCase({required HsCodeRepository repository})
      : _repository = repository;

  Future<HsCodeEntity> call(String query) async {
    final list = await _repository.getHsCodeList(
        HsCodeRequestFormEntity(query: query, method: HsCodeRequestMethodType.hsCode));
    if(list.isNotEmpty) {
      return list[0];
    }

    throw Exception();
  }
}
