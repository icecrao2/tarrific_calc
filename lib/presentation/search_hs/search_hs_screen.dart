import 'package:flutter/material.dart';
import 'package:tariff_calc/presentation/search_hs/components/_text_field/search_hs_text_field_component.dart';

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
          SearchHsTextFieldComponent()
        ],
      ),
    );
  }
}
