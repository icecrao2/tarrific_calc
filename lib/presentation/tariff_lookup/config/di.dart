import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/domain/tariff_info/entity/tariff_info_entity.dart';
import 'package:tariff_calc/presentation/_design/radio/toggle_button_radio.dart';
import 'package:tariff_calc/presentation/tariff_lookup/_state/default_info_state/default_info_state.dart';
import 'package:tariff_calc/presentation/tariff_lookup/_state/tariff_calc_state/tariff_calc_state.dart';
import 'package:tariff_calc/presentation/tariff_lookup/_state/tariff_code_signs_state/tariff_code_sign_state.dart';
import 'package:tariff_calc/presentation/tariff_lookup/_state/tariff_info_state/tariff_info_state.dart';

import '../../../config/di.dart';
import '../../../domain/hs_code/entity/hs_code_entity.dart';


// state
final defaultInfoStateProvider = AutoDisposeStateNotifierProvider<DefaultInfoState, AsyncValue<HsCodeEntity>>((ref) {
  final getHsCodeInfoUsecase = ref.watch(getHsCodeInfoUsecaseProvider);
  return DefaultInfoState(getHsCodeInfoUsecase: getHsCodeInfoUsecase);
});

final tariffCodeSignsStateProvider = AutoDisposeStateNotifierProvider<TariffCodeSignsState, List<String>>((ref) {
  final tariffInfoRepository = ref.watch(tariffInfoRepositoryProvider);
  final defaultInfoState = ref.watch(defaultInfoStateProvider);
  final hsCode = defaultInfoState.value?.hsCode ?? "";
  return TariffCodeSignsState(
    tariffInfoRepository: tariffInfoRepository,
    hsCode: hsCode
  );
});

final toggleButtonRadioControllerProvider = AutoDisposeProvider((ref) {
  final codeSigns = ref.watch(tariffCodeSignsStateProvider);
  final controller = StreamController();
  ref.onDispose(() {
    controller.close();
  });
  return ToggleButtonRadioController(controller: controller, options: codeSigns);
});

final tariffInfoStateProvider = AutoDisposeStateNotifierProvider<TariffInfoState, AsyncValue<TariffInfoEntity>>((ref) {
  final defaultInfoState = ref.watch(defaultInfoStateProvider);
  final toggleButtonStreamController = ref.watch(toggleButtonRadioControllerProvider);
  final tariffInfoRepository = ref.watch(tariffInfoRepositoryProvider);
  final hsCode = defaultInfoState.value?.hsCode ?? "";

  return TariffInfoState(
      tariffInfoRepository: tariffInfoRepository,
      hsCode: hsCode,
      stream: toggleButtonStreamController.controller.stream
  );
});

final tariffCalcStateProvider = AutoDisposeStateNotifierProvider<TariffCalcState, TariffCalcEntity?>((ref) {
  final tariffInfoEntity = ref.watch(tariffInfoStateProvider);
  return TariffCalcState(tariffInfoEntity: tariffInfoEntity.value);
});

// actor