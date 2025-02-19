import 'package:tariff_calc/data/client/env/env_client.dart';
import 'package:tariff_calc/data/client/http/custom_http_client.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_entity.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_request_form_entity.dart';
import 'package:tariff_calc/domain/hs_code/repository/hs_code_repository.dart';

class HsCodeRepositoryUniPass extends HsCodeRepository {

  final CustomHttpClient _httpClient;
  final EnvClient _envClient;

  HsCodeRepositoryUniPass({
    required CustomHttpClient httpClient,
    required EnvClient envClient
  })
    : _envClient = envClient,
      _httpClient = httpClient
        ..setBaseUrl(envClient.uniPassBaseUrl)
        ..setHeader(null);

  @override
  Future<List<HsCodeEntity>> getHsCodeList(HsCodeRequestFormEntity requestForm) async {

    Map<String, dynamic> queryParams = {'crkyCn': _envClient.uniPassHSCodeSearchApiKey,};

    switch(requestForm.method) {
      case HsCodeRequestMethodType.korean:
        queryParams.addAll({'koenTp': '1', 'prnm': requestForm.query});
      case HsCodeRequestMethodType.english:
        queryParams.addAll({'koenTp': '2', 'prnm': requestForm.query});
      case HsCodeRequestMethodType.hsCode:
        queryParams.addAll({'hsSgn': requestForm.query, 'koenTp': '1'});
    }

    final response = await _httpClient.get('hsSgnQry/searchHsSgn', queryParams: queryParams, isXmlResponse: true);
    List<dynamic> items = response["hsSgnSrchRtnVo"]['hsSgnSrchRsltVo'];

    print(items);

    return items.map((item) => HsCodeEntity(
        hsCode: item['hsSgn'] ?? "",
        koreanName: item['korePrnm'] ?? "",
        englishName: item['englPrnm'] ?? "",
        unit: item['wghtUt'] ?? "")).toList();
  }
}
