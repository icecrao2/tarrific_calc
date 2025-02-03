import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/tariff_lookup/components/_tariff_code_sign_radio/tariff_code_sign_radio_component_design.dart';
import 'package:tariff_calc/presentation/tariff_lookup/config/di.dart';

class TariffCodeSignRadioComponent extends ConsumerWidget {
  const TariffCodeSignRadioComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(tariffCodeSignRadioComponentVmProvider);
    return TariffCodeSignRadioComponentDesign(controller: vm);
  }
}
