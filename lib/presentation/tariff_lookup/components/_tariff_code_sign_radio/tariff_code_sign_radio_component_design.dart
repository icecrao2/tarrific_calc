import 'package:flutter/material.dart';

import '../../../_design/radio/toggle_button_radio.dart';

class TariffCodeSignRadioComponentDesign extends StatelessWidget {
  final ToggleButtonRadioController controller;

  const TariffCodeSignRadioComponentDesign({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
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
