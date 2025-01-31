
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_hs_code_list_element_ui_model.freezed.dart';


@freezed
class SearchHsCodListElementUiModel with _$SearchHsCodListElementUiModel {
  const factory SearchHsCodListElementUiModel({
    required String koreanName,
    required String englishName,
    required String hsCode,
  }) = _SearchHsCodListElementUiModel;
}