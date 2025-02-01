import 'package:flutter/material.dart';

import '../../../_design/input/default_text_field.dart';
import '../../../_design/text/title_content_text.dart';

class TariffCalcCardComponent extends StatelessWidget {
  const TariffCalcCardComponent({super.key});

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
                          textEditingController: TextEditingController(text: ""), labelText: '단위당 가격'),
                    ),

                    const SizedBox(width: 20,),

                    Expanded(
                      child: DefaultTextField(
                          textEditingController: TextEditingController(text: ""), labelText: '단위당 갯수'),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),

                const TitleContentText(
                  title: "신고가격",
                  content: "-",
                ),
                const SizedBox(height: 10,),
                TitleContentText(
                  title: "일반 과세",
                  content: "-",
                ),
                const SizedBox(height: 10,),
                TitleContentText(
                  title: "단위당 과세",
                  content: "-",
                ),
                const SizedBox(height: 10,),
                TitleContentText(
                  title: "총 과세",
                  content: "-",
                ),
              ],
            ),
          )
      ),
    );
  }
}
