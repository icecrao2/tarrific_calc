import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_search_record_entity.dart';
import 'package:tariff_calc/domain/hs_code/repository/hs_code_search_record_repository.dart';

class SearchHsTextFieldComponentVm extends StateNotifier<List<HsCodeSearchRecordEntity>> {
  final HsCodeSearchRecordRepository _hsCodeSearchRecordRepository;

  SearchHsTextFieldComponentVm({
    required HsCodeSearchRecordRepository hsCodeSearchRecordRepository
  })
      : _hsCodeSearchRecordRepository = hsCodeSearchRecordRepository,
        super([]);
  Future<void> load() async {
    state = await _hsCodeSearchRecordRepository.getAllRecords();
  }
}

