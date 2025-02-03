import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/hs_code/entity/hs_code_entity.dart';
import '../../../../domain/hs_code/usecase/get_hs_code_list_usecase.dart';

class SearchHsCodeListVm extends StateNotifier<List<HsCodeEntity>> {
  final GetHsCodeListUsecase _getHsCodeListUsecase;

  SearchHsCodeListVm({
    required GetHsCodeListUsecase getHsCodeListUsecase
  })
      : _getHsCodeListUsecase = getHsCodeListUsecase,
        super([]);

  Future<void> searchHsCode(String query) async {
    state = await _getHsCodeListUsecase(query);
  }
}

