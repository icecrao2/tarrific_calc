import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_search_record_entity.dart';
import 'package:tariff_calc/presentation/search_hs/action_event.dart';
import 'package:tariff_calc/presentation/search_hs/components/_list/search_hs_code_list_vm.dart';
import 'package:tariff_calc/presentation/search_hs/components/_text_field/search_hs_text_field_component_vm.dart';

import '../../../config/di.dart';
import '../../../domain/hs_code/entity/hs_code_entity.dart';


final actionStreamControllerProvider = AutoDisposeProvider((ref) {
  final actionStreamController = StreamController<ActionEvent>();
  ref.onDispose(() => actionStreamController.close());
  return actionStreamController;
});

final textEditingControllerProvider = AutoDisposeProvider((ref) {
  final textEditingController = TextEditingController();
  ref.onDispose(() => textEditingController.dispose());
  return textEditingController;
});

// vm
final hsCodeListVmProvider = AutoDisposeStateNotifierProvider<SearchHsCodeListVm, List<HsCodeEntity>>((ref) {
  final getHsCodeListUsecase = ref.watch(getHsCodeListUsecaseProvider);
  return SearchHsCodeListVm(getHsCodeListUsecase: getHsCodeListUsecase);
});

final searchHsCodeTextFieldComponentVmProvider = AutoDisposeStateNotifierProvider<SearchHsTextFieldComponentVm, List<HsCodeSearchRecordEntity>>((ref) {
  final hsCodeSearchRecordRepository = ref.watch(hsCodeSearchRecordRepositoryProvider);
  return SearchHsTextFieldComponentVm(hsCodeSearchRecordRepository: hsCodeSearchRecordRepository);
});
