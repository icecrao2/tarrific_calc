

import '../entity/tariff_calc_entity.dart';
import '../entity/tariff_info_entity.dart';

class CalculateTariffUseCase {

  TariffCalcEntity call({
    required TariffInfoEntity tariffInfo,
    required double unitCount,
    required  double unitPrice
  }) {
    double declaredPrice = _calculateDeclaredPrice(unitCount: unitCount, unitPrice: unitPrice);
    double? generalTaxablePrice = _calculateGeneralTax(unitPrice: unitPrice, unitCount: unitCount, tariffInfo: tariffInfo);
    double? taxablePricePerUnit = _calculateUnitTaxAmount(unitCount: unitCount, tariffInfo: tariffInfo);
    double totalTaxablePrice = _calculateTotalTax(unitCount: unitCount, unitPrice: unitPrice, tariffInfo: tariffInfo);

    return TariffCalcEntity(
        declaredPrice: declaredPrice,
        generalTaxablePrice: generalTaxablePrice,
        taxablePricePerUnit: taxablePricePerUnit,
        totalTaxablePrice: totalTaxablePrice);
  }

  double _calculateDeclaredPrice({required double unitCount, required double unitPrice}) {
    return unitCount * unitPrice;
  }

  double? _calculateGeneralTax({required double unitCount, required double unitPrice, required TariffInfoEntity tariffInfo,}) {
    return _calculateDeclaredPrice(unitCount: unitCount, unitPrice: unitPrice) * (tariffInfo.tariffRate / 100);
  }

  double? _calculateUnitTaxAmount({required TariffInfoEntity tariffInfo, required double unitCount}) {
    if (tariffInfo.unitTax == null) {
      return null;
    }
    return unitCount * tariffInfo.unitTax!;
  }

  double _calculateTotalTax({required double unitCount, required double unitPrice, required TariffInfoEntity tariffInfo,}) {
    return (_calculateGeneralTax(unitPrice: unitPrice, unitCount: unitCount, tariffInfo: tariffInfo) ?? 0) + (_calculateUnitTaxAmount(unitCount: unitCount, tariffInfo: tariffInfo) ?? 0);
  }
}