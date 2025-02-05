
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/data/client/env/env_client.dart';
import 'package:tariff_calc/data/client/hive/hive_client.dart';
import 'package:tariff_calc/data/client/http/custom_http_client.dart';
import 'package:tariff_calc/data/repository/hs_code/hs_code_repository_uni_pass.dart';
import 'package:tariff_calc/data/repository/hs_code_search_record/hs_code_search_record_repository_hive.dart';
import 'package:tariff_calc/data/repository/tariff_info/tariff_info_repository_uni_pass.dart';
import 'package:tariff_calc/domain/hs_code/repository/hs_code_repository.dart';
import 'package:tariff_calc/domain/hs_code/repository/hs_code_search_record_repository.dart';
import 'package:tariff_calc/domain/hs_code/usecase/get_hs_code_info_usecase.dart';
import 'package:tariff_calc/domain/hs_code/usecase/get_hs_code_list_usecase.dart';
import 'package:tariff_calc/domain/tariff_info/repository/tariff_info_repository.dart';
import 'package:tariff_calc/domain/tariff_info/usecase/calculate_tariff_usecase.dart';


// client
final envClientProvider = Provider((ref) => EnvClient());
final customHttpClientProvider = Provider((ref) => CustomHttpClient());
final hiveClientProvider = Provider((ref) => HiveClient());


// repository
final hsCodeRepositoryProvider = Provider<HsCodeRepository>((ref) {
  final envClient = ref.watch(envClientProvider);
  final httpClient = ref.watch(customHttpClientProvider);
  return HsCodeRepositoryUniPass(httpClient: httpClient, envClient: envClient);
});

final tariffInfoRepositoryProvider = Provider<TariffInfoRepository>((ref) {
  final envClient = ref.watch(envClientProvider);
  final httpClient = ref.watch(customHttpClientProvider);
  return TariffInfoRepositoryUniPass(httpClient: httpClient, envClient: envClient);
});

final hsCodeSearchRecordRepositoryProvider = Provider<HsCodeSearchRecordRepository>((ref) {
  final hiveClient = ref.watch(hiveClientProvider);
  return HsCodeSearchRecordRepositoryHive(hiveClient: hiveClient);
});


// usecase
final getHsCodeListUsecaseProvider = Provider((ref) {
  final hsCodeListRepository = ref.watch(hsCodeRepositoryProvider);
  final hsCodeSearchRecordRepository = ref.watch(hsCodeSearchRecordRepositoryProvider);
  return GetHsCodeListUsecase(hsCodeRepository: hsCodeListRepository, hsCodeSearchRecordRepository: hsCodeSearchRecordRepository);
});

final getHsCodeInfoUsecaseProvider = Provider((ref) {
  final hsCodeListRepository = ref.watch(hsCodeRepositoryProvider);
  return GetHsCodeInfoUseCase(repository: hsCodeListRepository);
});

final calculateTariffUsecaseProvider = Provider((ref) {
  return CalculateTariffUseCase();
});