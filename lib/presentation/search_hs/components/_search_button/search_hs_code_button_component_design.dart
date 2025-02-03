import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tariff_calc/presentation/search_hs/action_event.dart';

import '../../../_design/button/primary_button.dart';

class SearchHsCodeButtonComponentDesign extends StatelessWidget {

  final TextEditingController _textEditingController;
  final StreamController<ActionEvent> _actionStreamController;

  const SearchHsCodeButtonComponentDesign({super.key,
    required StreamController<ActionEvent> actionStreamController,
    required TextEditingController textEditingController})
      : _actionStreamController = actionStreamController,
        _textEditingController = textEditingController;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: "HS 코드 찾기",
      onPressed: () {
        _actionStreamController.add(SearchClicked(_textEditingController.text));
      },
    );
  }
}
