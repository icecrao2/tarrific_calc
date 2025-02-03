import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/search_hs/components/_text_field/search_hs_text_field_component_design.dart';
import 'package:tariff_calc/presentation/search_hs/config/di.dart';

class SearchHsTextFieldComponent extends ConsumerWidget {
  const SearchHsTextFieldComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = ref.watch(textEditingControllerProvider);
    return SearchHsTextFieldComponentDesign(textEditingController: textEditingController);
  }
}
