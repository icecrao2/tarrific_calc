import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/search_hs/components/_list/search_hs_code_list_component_design.dart';

import '../../action_event.dart';
import '../../config/di.dart';

class SearchHsCodeListComponent extends ConsumerStatefulWidget {
  const SearchHsCodeListComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchHsCodeListComponentState();
}


class _SearchHsCodeListComponentState extends ConsumerState<SearchHsCodeListComponent> {

  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final hsCodeListVm = ref.read(hsCodeListVmProvider.notifier);
      final actionStream = ref.watch(actionStreamControllerProvider);

      _subscription = actionStream.stream.listen((state) {
        switch(state) {
          case SearchClicked(: final query):
            hsCodeListVm.searchHsCode(query);
          default:
            break;
        }
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(hsCodeListVmProvider);

    return SearchHsCodeListComponentDesign(hsCodeList: state);
  }
}