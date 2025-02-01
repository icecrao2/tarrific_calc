import 'package:tariff_calc/domain/tariff_info/entity/tariff_info_entity.dart';

import '../entity/tariff_info_request_form_entity.dart';

abstract class TariffInfoRepository {
  Future<TariffInfoEntity> getInfo(
      {required TariffInfoRequestFormEntity requestForm});

  Future<List<String>> getCodeSigns({required String hsCode});
}
