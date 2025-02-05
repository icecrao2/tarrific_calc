import 'package:tariff_calc/data/client/hive/hive_client.dart';
import 'package:tariff_calc/data/repository/hs_code_search_record/data_model/hs_code_search_record_data_model.dart';

import '../../../domain/hs_code/entity/hs_code_search_record_entity.dart';
import '../../../domain/hs_code/repository/hs_code_search_record_repository.dart';

const _HS_CODE_SEARCH_RECORD_HIVE_KEY = "hs_code_search_record";

class HsCodeSearchRecordRepositoryHive implements HsCodeSearchRecordRepository{
  final HiveClient _hiveClient;

  HsCodeSearchRecordRepositoryHive({required HiveClient hiveClient})
    : _hiveClient = hiveClient..setBoxName(_HS_CODE_SEARCH_RECORD_HIVE_KEY);

  @override
  Future<List<HsCodeSearchRecordEntity>> getAllRecords() async {
    final dataModelGroup = _hiveClient.readAll() as List<HsCodeSearchRecordDataModel>;
    return dataModelGroup.map((model) => HsCodeSearchRecordEntity(
        searchText: model.searchText,
        lastSearchDate: model.lastSearchDate,
        searchCount: model.searchCount
    )).toList();
  }

  @override
  Future<void> addRecord(HsCodeSearchRecordEntity record) async {
    final origin = _hiveClient.read(key: record.searchText) as HsCodeSearchRecordDataModel;
    final searchText = record.searchText;
    final searchCount = origin.searchCount + 1;
    final lastSearchDate = record.lastSearchDate;
    final value = HsCodeSearchRecordDataModel(searchText, lastSearchDate, searchCount);
    await _hiveClient.put(key: searchText, value: value);
  }
}

