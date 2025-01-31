import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/search_hs/components/_search_button/search_hs_code_button_component_actor.dart';

import '../../../config/di.dart';
import '../../../domain/hs_code/entity/hs_code_entity.dart';
import '../_state/hs_code_list_state/hs_code_list_state.dart';

// state
final hsCodeListStateProvider = AutoDisposeStateNotifierProvider<
    HsCodeListState,
    List<HsCodeEntity>>((ref) {
  final getHsCodeListUsecase = ref.watch(getHsCodeListUsecaseProvider);
  return HsCodeListState(getHsCodeListUsecase: getHsCodeListUsecase);
});
final inputTextControllerStateProvider = AutoDisposeProvider((ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
});


// actor
final searchHsCodeButtonComponentActorProvider = AutoDisposeProvider((ref) =>
    SearchHsCodeButtonComponentActor(
        inputTextControllerState: ref.watch(inputTextControllerStateProvider),
        codeListState: ref.watch(hsCodeListStateProvider.notifier)));