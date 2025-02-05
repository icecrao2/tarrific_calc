import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/search_hs/components/_text_field/search_hs_text_field_component_design.dart';
import 'package:tariff_calc/presentation/search_hs/config/di.dart';

import '../../action_event.dart';

class SearchHsTextFieldComponent extends ConsumerStatefulWidget {
  const SearchHsTextFieldComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchHsTextFieldComponentState();
}

class _SearchHsTextFieldComponentState extends ConsumerState<SearchHsTextFieldComponent> {

  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 1));
      _load();

      final actionStream = ref.watch(actionStreamControllerProvider);
      _subscription = actionStream.stream.listen((state) {
        switch(state) {
          case OnLoadedList():
            _load();
          default:
            break;
        }
      });
    });
  }

  void _load() {
    final vm = ref.read(searchHsCodeTextFieldComponentVmProvider.notifier);
    vm.load();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textEditingController = ref.watch(textEditingControllerProvider);
    final vm = ref.watch(searchHsCodeTextFieldComponentVmProvider);

    return SearchHsTextFieldComponentDesign(
      textEditingController: textEditingController,
      hsCodeSearchRecordGroup: vm,
    );
  }
}
