import 'package:flutter/material.dart';
import 'package:tariff_calc/presentation/_design/button/primary_button.dart';
import 'package:tariff_calc/presentation/_design/input/default_text_field.dart';

import '../_design/radio/toggle_button_radio.dart';
import '../_design/text/title_content_text.dart';

class TariffLookupScreen extends StatelessWidget {
  const TariffLookupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
              '관세 조회'
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Card(
                  margin: EdgeInsets.only(bottom: 20),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleContentText(
                          title: "Hs Code",
                          content: "3133432u4i24u230",
                        ),
                        const SizedBox(height: 10,),
                        const TitleContentText(
                          title: "품명",
                          content: "고등어",
                        ),
                        const SizedBox(height: 10,),
                        const TitleContentText(
                          title: "단위",
                          content: "KG",
                        ),
                      ],
                    ),
                  )
              ),
            ),

           SizedBox(
             width: double.infinity,
             child:  Card(
               margin: EdgeInsets.only(bottom: 20),
               color: Colors.grey,
               child: ToggleButtonRadio(
                 options: [
                   "A", "FEU1"
                 ],
                 onTap: (str) {
                   print(str);
                 },
               ),
             ),
           ),

            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Card(
                margin: EdgeInsets.only(bottom: 20),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleContentText(
                        title: "일반세율",
                        content: "5.5%",
                      ),
                      const SizedBox(height: 10,),
                      TitleContentText(
                        title: "A 세율",
                        content: "5.5%",
                      ),
                      const SizedBox(height: 10,),
                      TitleContentText(
                        title: "기준가격",
                        content: "-",
                      ),
                      const SizedBox(height: 10,),
                      TitleContentText(
                        title: "단위당 세액",
                        content: "-",
                      ),
                    ],
                  ),
                )
              ),
            ),




            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Card(
                margin: EdgeInsets.only(bottom: 20),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            ),
          ],
        )
    );
  }
}
