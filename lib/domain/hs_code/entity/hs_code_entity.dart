import 'package:freezed_annotation/freezed_annotation.dart';

part 'hs_code_entity.freezed.dart';

@freezed
class HsCodeEntity with _$HsCodeEntity {
  const factory HsCodeEntity(
      {required String hsCode,
      required String koreanName,
      required String englishName}) = _HsCodeEntity;
}
