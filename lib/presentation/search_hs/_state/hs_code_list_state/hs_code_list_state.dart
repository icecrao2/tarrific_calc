import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/hs_code/entity/hs_code_entity.dart';
import '../../../../domain/hs_code/usecase/get_hs_code_list_usecase.dart';

class HsCodeListState extends StateNotifier<List<HsCodeEntity>> {
  final GetHsCodeListUsecase _getHsCodeListUsecase;

  HsCodeListState({
    required GetHsCodeListUsecase getHsCodeListUsecase
  })
    : _getHsCodeListUsecase = getHsCodeListUsecase,
      super([]);

  Future<void> searchHsCode(String query) async {
    final hsCodeGroup = await _getHsCodeListUsecase(query);
    Set<String> hsCode = {};
    state = hsCodeGroup.where((code) => hsCode.add(code.hsCode)).toList();
  }
}

