import 'package:flutter/material.dart';
import 'package:tariff_calc/presentation/search_hs/components/_text_field/search_hs_text_field_component.dart';

import 'components/_list/hs_code_list_component.dart';
import 'components/_search_button/search_hs_code_button_component.dart';

class SearchHsScreen extends StatelessWidget {

  const SearchHsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HS 코드 찾기'
        ),
      ),
      body: Column(
        children: [
          SearchHsTextFieldComponent(),
          const SizedBox(height: 30,),
          const Flexible(child: HsCodeListComponent(),),
          const SizedBox(height: 30,),
          const SearchHsCodeButtonComponent(),
          const SizedBox(height: 30,),
        ],
      )
    );
  }
}
