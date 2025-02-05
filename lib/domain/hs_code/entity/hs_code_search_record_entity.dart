import 'package:freezed_annotation/freezed_annotation.dart';

part 'hs_code_search_record_entity.freezed.dart';

@freezed
class HsCodeSearchRecordEntity with _$HsCodeSearchRecordEntity {
  const factory HsCodeSearchRecordEntity(
      {required String searchText,
        required DateTime lastSearchDate,
        required int? searchCount,}) = _HsCodeSearchRecordEntity;
}