import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/search_hs/components/_search_button/search_hs_code_button_component_design.dart';
import 'package:tariff_calc/presentation/search_hs/config/di.dart';

class SearchHsCodeButtonComponent extends ConsumerWidget {

  const SearchHsCodeButtonComponent({super.key,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actionStreamController = ref.watch(actionStreamControllerProvider);
    final textEditingController = ref.watch(textEditingControllerProvider);

    return SearchHsCodeButtonComponentDesign(
        actionStreamController: actionStreamController,
        textEditingController: textEditingController
    );
  }
}