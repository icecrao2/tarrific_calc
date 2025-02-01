import 'package:freezed_annotation/freezed_annotation.dart';

part 'tariff_info_entity.freezed.dart';

@freezed
class TariffInfoEntity with _$TariffInfoEntity {
  const factory TariffInfoEntity(
      {required String hsCode,
      required String tariffTypeCode,
      required String tariffTypeName,
      required double tariffRate,
      required double? unitTax,
      required double? basePrice,
      required String? startDate,
      required String? endDate}) = _TariffInfoEntity;
}
