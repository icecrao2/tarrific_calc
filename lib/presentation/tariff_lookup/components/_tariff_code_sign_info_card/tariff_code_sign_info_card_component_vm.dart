import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/domain/tariff_info/entity/tariff_info_entity.dart';
import 'package:tariff_calc/domain/tariff_info/entity/tariff_info_request_form_entity.dart';
import 'package:tariff_calc/domain/tariff_info/repository/tariff_info_repository.dart';

class TariffCodeSignInfoCardComponentVm extends StateNotifier<AsyncValue<TariffInfoEntity>> {
  final TariffInfoRepository _tariffInfoRepository;
  final String _hsCode;

  TariffCodeSignInfoCardComponentVm({
    required TariffInfoRepository tariffInfoRepository,
    required String hsCode,
  })
      : _tariffInfoRepository = tariffInfoRepository,
        _hsCode = hsCode,
        super(const AsyncValue.loading());

  Future<void> load({required String tariffTypeCode}) async {
    final info = await _tariffInfoRepository.getInfo(requestForm: TariffInfoRequestFormEntity(
        hsCode: _hsCode,
        tariffTypeCode: tariffTypeCode));
    state = AsyncValue.data(info);
  }
}

