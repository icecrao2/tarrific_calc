
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/data/client/env/env_client.dart';
import 'package:tariff_calc/data/client/http/custom_http_client.dart';
import 'package:tariff_calc/data/repository/hs_code/hs_code_repository_uni_pass.dart';
import 'package:tariff_calc/data/repository/tariff_info/tariff_info_repository_uni_pass.dart';
import 'package:tariff_calc/domain/hs_code/repository/hs_code_repository.dart';
import 'package:tariff_calc/domain/hs_code/usecase/get_hs_code_info_usecase.dart';
import 'package:tariff_calc/domain/hs_code/usecase/get_hs_code_list_usecase.dart';
import 'package:tariff_calc/domain/tariff_info/repository/tariff_info_repository.dart';


// client
final envClientProvider = Provider((ref) => EnvClient());
final customHttpClientProvider = Provider((ref) => CustomHttpClient());


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


// usecase
final getHsCodeListUsecaseProvider = Provider((ref) {
  final hsCodeListRepository = ref.watch(hsCodeRepositoryProvider);
  return GetHsCodeListUsecase(repository: hsCodeListRepository);
});

final getHsCodeInfoUsecaseProvider = Provider((ref) {
  final hsCodeListRepository = ref.watch(hsCodeRepositoryProvider);
  return GetHsCodeInfoUseCase(repository: hsCodeListRepository);
});