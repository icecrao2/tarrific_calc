import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/domain/hs_code/usecase/get_hs_code_info_usecase.dart';

import '../../../../domain/hs_code/entity/hs_code_entity.dart';

class DefaultTariffInfoCardComponentVm extends StateNotifier<AsyncValue<HsCodeEntity>> {
  final GetHsCodeInfoUseCase _getHsCodeInfoUsecase;

  DefaultTariffInfoCardComponentVm({
    required GetHsCodeInfoUseCase getHsCodeInfoUsecase
  })
      : _getHsCodeInfoUsecase = getHsCodeInfoUsecase,
        super(const AsyncValue.loading());

  Future<void> load(String hsCode) async {
    final hsCodeInfo = await _getHsCodeInfoUsecase(hsCode);
    state = AsyncValue.data(hsCodeInfo);
  }
}

