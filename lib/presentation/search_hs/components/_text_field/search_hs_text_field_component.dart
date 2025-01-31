import 'package:flutter/cupertino.dart';

import '../../../_design/input/default_text_field.dart';

class SearchHsTextFieldComponent extends StatelessWidget {

  final _textEditingController = TextEditingController();

  SearchHsTextFieldComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
        textEditingController: _textEditingController, labelText: '품명 입력');
  }
}
