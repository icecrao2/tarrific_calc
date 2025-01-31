import 'package:freezed_annotation/freezed_annotation.dart';

part 'hs_code_request_form_entity.freezed.dart';

@freezed
class HsCodeRequestFormEntity with _$HsCodeRequestFormEntity {
  const factory HsCodeRequestFormEntity({
    required String query,
    required HsCodeRequestMethodType method,
  }) = _HsCodeRequestFormEntity;
}

enum HsCodeRequestMethodType {
  korean(code: 1),
  english(code: 2),
  hsCode(code: 3);

  final int code;

  const HsCodeRequestMethodType({required this.code});
}
