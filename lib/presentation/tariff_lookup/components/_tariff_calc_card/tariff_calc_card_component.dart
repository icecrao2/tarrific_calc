import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/tariff_lookup/components/_tariff_calc_card/tariff_calc_card_component_design.dart';
import 'package:tariff_calc/presentation/tariff_lookup/config/di.dart';

class TariffCalcCardComponent extends ConsumerWidget {
  final _unitPriceTextEditingController = TextEditingController();
  final _unitAmountTextEditingController = TextEditingController();

  TariffCalcCardComponent({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tariffCalcCardComponentVmProvider);

    return TariffCalcCardComponentDesign(
      entity: state,
      voidCallback: () {
        ref.read(tariffCalcCardComponentVmProvider.notifier).unitPrice = double.tryParse(_unitPriceTextEditingController.text);
        ref.read(tariffCalcCardComponentVmProvider.notifier).unitCount = double.tryParse(_unitAmountTextEditingController.text);
        ref.read(tariffCalcCardComponentVmProvider.notifier).calculate();
      },
      unitAmountTextEditingController: _unitAmountTextEditingController,
      unitPriceTextEditingController: _unitPriceTextEditingController,
    );
  }
}