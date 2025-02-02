





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

