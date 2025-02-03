import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/domain/tariff_info/repository/tariff_info_repository.dart';
import 'package:tariff_calc/presentation/_design/radio/toggle_button_radio.dart';

class TariffCodeSignRadioComponentVm extends StateNotifier<ToggleButtonRadioController> {
  final TariffInfoRepository _tariffInfoRepository;
  final StreamController _streamController;

  TariffCodeSignRadioComponentVm({
    required TariffInfoRepository tariffInfoRepository,
    required StreamController streamController
  })
      : _tariffInfoRepository = tariffInfoRepository,
        _streamController = streamController,
        super(ToggleButtonRadioController(controller: streamController, options: []));

  Future<void> load({required String hsCode}) async {
    final signs = await _tariffInfoRepository.getCodeSigns(hsCode: hsCode);
    state = ToggleButtonRadioController(controller: _streamController, options: signs);
  }
}