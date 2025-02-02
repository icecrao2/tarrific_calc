import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/tariff_info/entity/tariff_calc_entity.dart';
import '../../../../domain/tariff_info/entity/tariff_info_entity.dart';
import '../../../../domain/tariff_info/usecase/calculate_tariff_usecase.dart';

class TariffCalcState extends StateNotifier<TariffCalcEntity?> {

  final TariffInfoEntity? tariffInfo;
  final CalculateTariffUseCase _calculateTariffUseCase;

  double? _unitCount;
  double? _unitPrice;

  set unitCount(double? value) => _unitCount = value;
  set unitPrice(double? value) => _unitPrice = value;

  TariffCalcState({
    required CalculateTariffUseCase calculateTariffUseCase,
    required this.tariffInfo,
  })
      : _calculateTariffUseCase = calculateTariffUseCase,
        super(null);


  void calculate() {
    if (_unitCount == null || _unitPrice == null || tariffInfo == null) {
      state = null;
    }
    state = _calculateTariffUseCase(unitCount: _unitCount!, unitPrice: _unitPrice!, tariffInfo: tariffInfo!);
  }
}