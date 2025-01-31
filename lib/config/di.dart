
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/data/client/env/env_client.dart';
import 'package:tariff_calc/data/client/http/custom_http_client.dart';
import 'package:tariff_calc/data/repository/hs_code/hs_code_list_repository_uni_pass.dart';
import 'package:tariff_calc/domain/hs_code/repository/hs_code_list_repository.dart';
import 'package:tariff_calc/domain/hs_code/usecase/get_hs_code_list_usecase.dart';


// client
final envClientProvider = Provider((ref) => EnvClient());
final customHttpClientProvider = Provider((ref) => CustomHttpClient());


// repository
final hsCodeListRepositoryProvider = Provider<HsCodeListRepository>((ref) {
  final envClient = ref.watch(envClientProvider);
  final httpClient = ref.watch(customHttpClientProvider);
  return HsCodeListRepositoryUniPass(httpClient: httpClient, envClient: envClient);
});


// usecase
final getHsCodeListUsecaseProvider = Provider((ref) {
  final hsCodeListRepository = ref.watch(hsCodeListRepositoryProvider);

  return GetHsCodeListUsecase(repository: hsCodeListRepository);
});