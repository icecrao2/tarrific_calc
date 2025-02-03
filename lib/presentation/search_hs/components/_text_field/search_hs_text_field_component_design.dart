import 'package:flutter/material.dart';

import '../../../_design/input/default_text_field.dart';

class SearchHsTextFieldComponentDesign extends StatelessWidget {
  final TextEditingController _textEditingController;

  const SearchHsTextFieldComponentDesign({super.key,
    required TextEditingController textEditingController})
      : _textEditingController = textEditingController;


  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
        textEditingController: _textEditingController, labelText: '품명 입력');
  }
}
