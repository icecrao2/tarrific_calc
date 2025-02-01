import 'package:tariff_calc/domain/hs_code/entity/hs_code_entity.dart';

import '../entity/hs_code_request_form_entity.dart';

abstract class HsCodeRepository {
  Future<List<HsCodeEntity>> getHsCodeList(
      HsCodeRequestFormEntity requestForm);
}
