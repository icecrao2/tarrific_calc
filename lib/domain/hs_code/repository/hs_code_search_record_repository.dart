
import '../entity/hs_code_search_record_entity.dart';

abstract class HsCodeSearchRecordRepository {
  Future<List<HsCodeSearchRecordEntity>> getAllRecords();
  Future<void> addRecord(HsCodeSearchRecordEntity record);
}
