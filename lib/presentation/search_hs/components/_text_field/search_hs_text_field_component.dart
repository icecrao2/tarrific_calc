import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../_design/input/default_text_field.dart';
import '../../config/di.dart';

class SearchHsTextFieldComponent extends ConsumerWidget {
  const SearchHsTextFieldComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(inputTextControllerStateProvider);

    return DefaultTextField(
        textEditingController: state, labelText: '품명 입력');
  }
}
