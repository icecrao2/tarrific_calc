import 'package:flutter/material.dart';
import 'package:tariff_calc/presentation/_design/layout/ad_layout.dart';
import 'package:tariff_calc/presentation/_design/layout/app_scaffold.dart';
import 'package:tariff_calc/presentation/tariff_lookup/components/_default_tariff_info_card/default_tariff_info_card_component.dart';

import 'components/_tariff_calc_card/tariff_calc_card_component.dart';
import 'components/_tariff_code_sign_info_card/tariff_code_sign_info_card_component.dart';
import 'components/_tariff_code_sign_radio/tariff_code_sign_radio_component.dart';

class TariffLookupScreen extends StatelessWidget {
  final String hsCode;

  const TariffLookupScreen({super.key, required this.hsCode});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: '관세 조회',
        child: AdLayout(
          child: SingleChildScrollView(
            child: Column(
              children: [
                DefaultTariffInfoCardComponent(hsCode: hsCode,),
                const SizedBox(
                  height: 10,
                ),
                const TariffCodeSignRadioComponent(),
                const TariffCodeSignInfoCardComponent(),
                TariffCalcCardComponent(),
                const SizedBox(height: 100,),
              ],
            ),
          )
        ));
  }
}
