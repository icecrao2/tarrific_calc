import 'package:freezed_annotation/freezed_annotation.dart';

part 'tariff_info_request_form_entity.freezed.dart';

@freezed
class TariffInfoRequestFormEntity with _$TariffInfoRequestFormEntity {
  const factory TariffInfoRequestFormEntity(
      {required String hsCode,
        required String tariffTypeCode}) = _TariffInfoRequestFormEntity;
}
