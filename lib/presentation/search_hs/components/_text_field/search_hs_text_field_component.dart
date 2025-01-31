import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../_design/input/default_text_field.dart';
import '../../_state/input_text_controller_state/input_text_controller_state.dart';

class SearchHsTextFieldComponent extends ConsumerWidget {
  const SearchHsTextFieldComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final controller = ref.watch(inputTextControllerStateProvider);
    
    return DefaultTextField(
        textEditingController: controller, labelText: '품명 입력');
  }
}
