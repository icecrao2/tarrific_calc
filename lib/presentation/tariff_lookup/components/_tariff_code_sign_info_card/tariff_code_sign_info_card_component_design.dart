import 'package:flutter/material.dart';
import 'package:tariff_calc/domain/tariff_info/entity/tariff_info_entity.dart';

import '../../../_design/text/big_title_small_content_text.dart';

class TariffCodeSignInfoCardComponentDesign extends StatelessWidget {

  final TariffInfoEntity data;

  const TariffCodeSignInfoCardComponentDesign({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .sizeOf(context)
          .width,
      child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                BigTitleSmallContentText(
                  title: "${data.tariffTypeName} 세율",
                  content: "${data.tariffRate}%",
                ),
                const SizedBox(height: 10,),
                BigTitleSmallContentText(
                  title: "기준가격",
                  content: "${data.basePrice ?? '-'}",
                ),
                const SizedBox(height: 10,),
                BigTitleSmallContentText(
                  title: "단위당 세액",
                  content: "${data.unitTax ?? '-'}",
                ),
              ],
            ),
          )
      ),
    );
  }
}
