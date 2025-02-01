import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/domain/tariff_info/entity/tariff_info_entity.dart';
import 'package:tariff_calc/domain/tariff_info/entity/tariff_info_request_form_entity.dart';
import 'package:tariff_calc/domain/tariff_info/repository/tariff_info_repository.dart';

class TariffInfoState extends StateNotifier<AsyncValue<TariffInfoEntity>> {
  final TariffInfoRepository _tariffInfoRepository;
  final String _hsCode;
  late final StreamSubscription _subscription;

  TariffInfoState({
    required TariffInfoRepository tariffInfoRepository,
    required String hsCode,
    required Stream stream
  })
      : _tariffInfoRepository = tariffInfoRepository,
        _hsCode = hsCode,
        super(const AsyncValue.loading()) {

    _subscription = stream.listen((data) {
      _load(tariffTypeCode: data);
    });
  }

  Future<void> _load({required String tariffTypeCode}) async {
    final info = await _tariffInfoRepository.getInfo(requestForm: TariffInfoRequestFormEntity(
        hsCode: _hsCode,
        tariffTypeCode: tariffTypeCode));
    state = AsyncValue.data(info);
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

