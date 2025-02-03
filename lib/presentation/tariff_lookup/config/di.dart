import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/domain/tariff_info/entity/tariff_info_entity.dart';
import 'package:tariff_calc/presentation/_design/radio/toggle_button_radio.dart';
import 'package:tariff_calc/presentation/tariff_lookup/components/_default_tariff_info_card/default_tariff_info_card_component_vm.dart';
import 'package:tariff_calc/presentation/tariff_lookup/components/_tariff_calc_card/tariff_calc_card_component_vm.dart';
import 'package:tariff_calc/presentation/tariff_lookup/components/_tariff_code_sign_info_card/tariff_code_sign_info_card_component_vm.dart';

import '../../../config/di.dart';
import '../../../domain/hs_code/entity/hs_code_entity.dart';
import '../../../domain/tariff_info/entity/tariff_calc_entity.dart';
import '../components/_tariff_code_sign_radio/tariff_code_sign_radio_component_vm.dart';


final actionStreamControllerProvider = AutoDisposeProvider((ref) {
  final controller = StreamController();
  ref.onDispose(() => controller.close());
  return controller;
});


// vm
final defaultTariffInfoCardComponentVmProvider = AutoDisposeStateNotifierProvider<DefaultTariffInfoCardComponentVm, AsyncValue<HsCodeEntity>>((ref) {
  final getHsCodeInfoUsecase = ref.watch(getHsCodeInfoUsecaseProvider);
  return DefaultTariffInfoCardComponentVm(getHsCodeInfoUsecase: getHsCodeInfoUsecase);
});

final tariffCodeSignRadioComponentVmProvider = AutoDisposeStateNotifierProvider<TariffCodeSignRadioComponentVm, ToggleButtonRadioController>((ref){
  final tariffInfoRepository = ref.watch(tariffInfoRepositoryProvider);
  final actionStreamController = ref.watch(actionStreamControllerProvider);
  final defaultInfoVm = ref.watch(defaultTariffInfoCardComponentVmProvider);
  final vm = TariffCodeSignRadioComponentVm(
    tariffInfoRepository: tariffInfoRepository,
    streamController: actionStreamController
  );
  vm.load(hsCode: defaultInfoVm.value?.hsCode ?? "");
  return vm;
});

final tariffCodeSignInfoCardComponentVmProvider = AutoDisposeStateNotifierProvider<TariffCodeSignInfoCardComponentVm, AsyncValue<TariffInfoEntity>>((ref) {
  final tariffInfoRepository = ref.watch(tariffInfoRepositoryProvider);
  final defaultTariffInfoCardComponentVm = ref.watch(defaultTariffInfoCardComponentVmProvider);
  final hsCode = defaultTariffInfoCardComponentVm.value?.hsCode ?? "";

  return TariffCodeSignInfoCardComponentVm(
    tariffInfoRepository: tariffInfoRepository,
    hsCode: hsCode
  );
});

final tariffCalcCardComponentVmProvider = AutoDisposeStateNotifierProvider<TariffCalcCardComponentVm, TariffCalcEntity?>((ref) {
  final tariffInfoEntity = ref.watch(tariffCodeSignInfoCardComponentVmProvider);
  final calculateTariffUseCase = ref.watch(calculateTariffUsecaseProvider);
  return TariffCalcCardComponentVm(
      tariffInfo: tariffInfoEntity.value,
      calculateTariffUseCase: calculateTariffUseCase
  );
});