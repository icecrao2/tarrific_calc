import 'package:flutter/material.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_entity.dart';

import '../../../_design/text/title_content_text.dart';

class DefaultTariffInfoCardComponentDesign extends StatelessWidget {

  final HsCodeEntity data;

  const DefaultTariffInfoCardComponentDesign({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Card(
          color: Colors.white,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleContentText(
                  title: "Hs Code",
                  content: data.hsCode,
                ),
                const SizedBox(
                  height: 10,
                ),
                TitleContentText(
                  title: "품명",
                  content: data.koreanName.isNotEmpty
                      ? data.koreanName
                      : data.englishName,
                ),
                const SizedBox(
                  height: 10,
                ),
                TitleContentText(
                  title: "단위",
                  content: data.unit,
                ),
              ],
            ),
          )),
    );
  }
}
