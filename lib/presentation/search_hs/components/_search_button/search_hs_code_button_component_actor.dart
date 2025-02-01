
import 'package:flutter/cupertino.dart';

import '../../_state/hs_code_list_state/hs_code_list_state.dart';

class SearchHsCodeButtonComponentActor {
  final TextEditingController _inputTextControllerState;
  final HsCodeListState _codeListState;

  const SearchHsCodeButtonComponentActor({
    required TextEditingController inputTextControllerState,
    required HsCodeListState codeListState
  })
    : _inputTextControllerState = inputTextControllerState,
      _codeListState = codeListState;

  void search() {
    _codeListState.searchHsCode(_inputTextControllerState.text);
  }
}