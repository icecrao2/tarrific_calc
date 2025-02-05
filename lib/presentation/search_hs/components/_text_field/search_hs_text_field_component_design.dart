import 'package:flutter/material.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_search_record_entity.dart';
import 'package:tariff_calc/presentation/_design/input/auto_complete_default_text_field.dart';

import '../../../_design/input/default_text_field.dart';

class SearchHsTextFieldComponentDesign extends StatelessWidget {
  final TextEditingController _textEditingController;
  final List<HsCodeSearchRecordEntity> _hsCodeSearchRecordGroup;

  const SearchHsTextFieldComponentDesign({super.key,
    required TextEditingController textEditingController,
    required List<HsCodeSearchRecordEntity> hsCodeSearchRecordGroup})
      : _textEditingController = textEditingController,
        _hsCodeSearchRecordGroup = hsCodeSearchRecordGroup;


  @override
  Widget build(BuildContext context) {
    return AutoCompleteDefaultTextField(
        textEditingController: _textEditingController, labelText: '품명 입력',
        suggestions: _hsCodeSearchRecordGroup.map((record) => record.searchText).toList());
  }
}
