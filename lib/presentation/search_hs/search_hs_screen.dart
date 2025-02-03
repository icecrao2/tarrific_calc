import 'package:flutter/material.dart';
import 'package:tariff_calc/presentation/_design/layout/ad_layout.dart';
import 'package:tariff_calc/presentation/_design/layout/app_scaffold.dart';
import 'package:tariff_calc/presentation/search_hs/components/_text_field/search_hs_text_field_component.dart';

import 'components/_list/search_hs_code_list_component.dart';
import 'components/_search_button/search_hs_code_button_component.dart';

class SearchHsScreen extends StatelessWidget {
  const SearchHsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'HS 코드 찾기',
      child: AdLayout(
        child: Column(
          children: [
            SearchHsTextFieldComponent(),
            SizedBox(height: 30,),
            Expanded(child: SearchHsCodeListComponent(),),
            SizedBox(height: 30,),
            SearchHsCodeButtonComponent(),
            SizedBox(height: 30,),
          ],
        )
      )
    );
  }
}
