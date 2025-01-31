import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/search_hs/_state/input_text_controller_state/input_text_controller_state.dart';

import '../../../_design/button/primary_button.dart';

class SearchHsCodeButtonComponent extends ConsumerWidget {
  const SearchHsCodeButtonComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PrimaryButton(
      text: "HS 코드 찾기",
      onPressed: () {
        print(ref.read(inputTextControllerStateProvider).text);
      },
    );
  }
}
