import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/tariff_info/entity/tariff_info_entity.dart';

class TariffCalcEntity {
  final double declaredPrice;
  final double? generalTaxablePrice;
  final double? taxablePricePerUnit;
  final double totalTaxablePrice;

  const TariffCalcEntity({required this.declaredPrice,
    required this.generalTaxablePrice,
    required this.taxablePricePerUnit,
    required this.totalTaxablePrice});
}


class TariffCalcState extends StateNotifier<TariffCalcEntity?> {

  final TariffInfoEntity? _tariffInfoEntity;

  double? _unitCount;
  double? _unitPrice;

  set unitCount(double? value) => _unitCount = value;
  set unitPrice(double? value) => _unitPrice = value;

  TariffCalcState({
    required TariffInfoEntity? tariffInfoEntity
  })
      : _tariffInfoEntity = tariffInfoEntity,
        super(null);


  void calculate() {
    double? declaredPrice = _calculateDeclaredPrice();
    double? generalTaxablePrice = _calculateGeneralTax();
    double? taxablePricePerUnit = _calculateUnitTaxAmount();
    double? totalTaxablePrice = _calculateTotalTax();

    if (declaredPrice == null || totalTaxablePrice == null) {
      state = null;
      return;
    }

    state = TariffCalcEntity(
        declaredPrice: declaredPrice,
        generalTaxablePrice: generalTaxablePrice,
        taxablePricePerUnit: taxablePricePerUnit,
        totalTaxablePrice: totalTaxablePrice);
  }

  double? _calculateDeclaredPrice() {
    if (_unitCount == null || _unitPrice == null) {
      return null;
    }
    return _unitCount! * _unitPrice!;
  }

  double? _calculateGeneralTax() {
    if (_calculateDeclaredPrice() == null || _tariffInfoEntity?.tariffRate == null) {
      return null;
    }
    return _calculateDeclaredPrice()! * (_tariffInfoEntity!.tariffRate / 100);
  }

  double? _calculateUnitTaxAmount() {
    if (_unitCount == null || _tariffInfoEntity?.unitTax == null) {
      return null;
    }
    return _unitCount! * _tariffInfoEntity!.unitTax!;
  }

  double? _calculateTotalTax() {
    return (_calculateGeneralTax() ?? 0) + (_calculateUnitTaxAmount() ?? 0);
  }
}