import 'package:hive/hive.dart';

part 'hs_code_search_record_data_model.g.dart';

@HiveType(typeId: 0)
class HsCodeSearchRecordDataModel {
  @HiveField(0)
  String searchText;

  @HiveField(1)
  DateTime lastSearchDate;

  @HiveField(2)
  int searchCount;

  HsCodeSearchRecordDataModel(this.searchText, this.lastSearchDate, this.searchCount);
}