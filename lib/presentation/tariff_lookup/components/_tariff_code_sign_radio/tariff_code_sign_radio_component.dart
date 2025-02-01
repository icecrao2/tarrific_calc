import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/tariff_lookup/config/di.dart';

import '../../../_design/radio/toggle_button_radio.dart';

class TariffCodeSignRadioComponent extends ConsumerWidget {
  const TariffCodeSignRadioComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(toggleButtonRadioControllerProvider);
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.grey,
        child: ToggleButtonRadio(
          controller: controller,
        ),
      ),
    );
  }
}
