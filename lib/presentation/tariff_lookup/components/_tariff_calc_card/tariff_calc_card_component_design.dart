import 'package:flutter/material.dart';
import 'package:tariff_calc/domain/tariff_info/entity/tariff_calc_entity.dart';

import '../../../_design/button/primary_button.dart';
import '../../../_design/input/default_text_field.dart';
import '../../../_design/text/title_content_text.dart';

class TariffCalcCardComponentDesign extends StatelessWidget {
  final TextEditingController unitPriceTextEditingController;
  final TextEditingController unitAmountTextEditingController;
  final VoidCallback voidCallback;
  final TariffCalcEntity? entity;

  const TariffCalcCardComponentDesign({super.key,
    required this.voidCallback,
    required this.entity,
    required this.unitAmountTextEditingController,
    required this.unitPriceTextEditingController
  });

  @override
  Widget build(BuildContext context) {
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
                          textEditingController: unitPriceTextEditingController, labelText: '단위당 가격'),
                    ),

                    const SizedBox(width: 20,),

                    Expanded(
                      child: DefaultTextField(
                          textEditingController: unitAmountTextEditingController, labelText: '단위당 갯수'),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),

                TitleContentText(
                  title: "신고가격",
                  content: entity?.declaredPrice.toString() ?? "-",
                ),
                const SizedBox(height: 10,),
                TitleContentText(
                  title: "일반 관세",
                  content: entity?.generalTaxablePrice?.toString() ?? "-",
                ),
                const SizedBox(height: 10,),
                TitleContentText(
                  title: "단위당 관세",
                  content: entity?.taxablePricePerUnit?.toString() ?? "-",
                ),
                const SizedBox(height: 10,),
                TitleContentText(
                  title: "총 관세",
                  content: entity?.totalTaxablePrice.toString() ?? "-",
                ),

                const SizedBox(height: 40,),

                PrimaryButton(onPressed: () {
                  voidCallback();
                }, text: "관세 계산하기"),

                const SizedBox(height: 10,),
              ],
            ),
          )
      ),
    );
  }
}
