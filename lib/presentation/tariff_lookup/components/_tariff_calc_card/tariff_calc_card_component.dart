import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/_design/button/primary_button.dart';
import 'package:tariff_calc/presentation/tariff_lookup/config/di.dart';

import '../../../_design/input/default_text_field.dart';
import '../../../_design/text/title_content_text.dart';

class TariffCalcCardComponent extends ConsumerWidget {
  final _unitPriceTextEditingController = TextEditingController();
  final _unitAmountTextEditingController = TextEditingController();

  TariffCalcCardComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(tariffCalcStateProvider);

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Expanded(
                      child: DefaultTextField(
                          textEditingController: _unitPriceTextEditingController, labelText: '단위당 가격'),
                    ),

                    const SizedBox(width: 20,),

                    Expanded(
                      child: DefaultTextField(
                          textEditingController: _unitAmountTextEditingController, labelText: '단위당 갯수'),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),

                TitleContentText(
                  title: "신고가격",
                  content: state?.declaredPrice.toString() ?? "-",
                ),
                const SizedBox(height: 10,),
                TitleContentText(
                  title: "일반 관세",
                  content:state?.generalTaxablePrice?.toString() ?? "-",
                ),
                const SizedBox(height: 10,),
                TitleContentText(
                  title: "단위당 관세",
                  content: state?.taxablePricePerUnit?.toString() ?? "-",
                ),
                const SizedBox(height: 10,),
                TitleContentText(
                  title: "총 관세",
                  content: state?.totalTaxablePrice.toString() ?? "-",
                ),

                const SizedBox(height: 40,),

                PrimaryButton(onPressed: () {
                  ref.read(tariffCalcStateProvider.notifier).unitPrice = double.tryParse(_unitPriceTextEditingController.text);
                  ref.read(tariffCalcStateProvider.notifier).unitCount = double.tryParse(_unitAmountTextEditingController.text);
                  ref.read(tariffCalcStateProvider.notifier).calculate();
                }, text: "관세 계산하기"),

                const SizedBox(height: 10,),

              ],
            ),
          )
      ),
    );
  }
}
