

import 'package:flutter/material.dart';

import '../../../_design/text/title_content_text.dart';

class DefaultTariffInfoCardComponent extends StatelessWidget {
  const DefaultTariffInfoCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: const Card(
          margin: EdgeInsets.only(bottom: 20),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleContentText(
                  title: "Hs Code",
                  content: "3133432u4i24u230",
                ),
                SizedBox(height: 10,),
                TitleContentText(
                  title: "품명",
                  content: "고등어",
                ),
                SizedBox(height: 10,),
                TitleContentText(
                  title: "단위",
                  content: "KG",
                ),
              ],
            ),
          )
      ),
    );
  }
}
