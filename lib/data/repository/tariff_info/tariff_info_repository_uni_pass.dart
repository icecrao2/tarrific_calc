import 'package:tariff_calc/data/client/env/env_client.dart';
import 'package:tariff_calc/data/client/http/custom_http_client.dart';
import 'package:tariff_calc/domain/tariff_info/entity/tariff_info_entity.dart';
import 'package:tariff_calc/domain/tariff_info/entity/tariff_info_request_form_entity.dart';
import 'package:tariff_calc/domain/tariff_info/repository/tariff_info_repository.dart';

class TariffInfoRepositoryUniPass extends TariffInfoRepository {

  final CustomHttpClient _httpClient;
  final EnvClient _envClient;

  TariffInfoRepositoryUniPass({
    required CustomHttpClient httpClient,
    required EnvClient envClient
  })
      : _envClient = envClient,
        _httpClient = httpClient
          ..setBaseUrl(envClient.uniPassBaseUrl)
          ..setHeader(null);

  @override
  Future<TariffInfoEntity> getInfo({required TariffInfoRequestFormEntity requestForm}) async {

    Map<String, dynamic> queryParams = {
      'crkyCn': _envClient.uniPassTariffCalcKey,
      'hsSgn': requestForm.hsCode,
      'trrtTpcd': requestForm.tariffTypeCode
    };

    final response = await _httpClient.get('trrtQry/retrieveTrrt', queryParams: queryParams, isXmlResponse: true);

    dynamic item = response["trrtQryRtnVo"]['trrtQryRsltVo'];
    return TariffInfoEntity(
        hsCode: item['hsSgn'] ?? "",
        tariffTypeCode: item['trrtTpcd'] ?? "",
        tariffTypeName: item['trrtTpNm'] ?? "",
        tariffRate: double.tryParse(item['trrt']) ?? 0,
        unitTax: item['prutXamt'] == null ? null : double.tryParse(item['prutXamt']),
        basePrice: item['basePrc'] == null ? null :  double.tryParse(item['basePrc']),
        startDate: item['aplyStrtDt'],
        endDate: item['aplyEndDt']);
  }

  @override
  Future<List<String>> getCodeSigns({required String hsCode}) async {
    Map<String, dynamic> queryParams = {
      'crkyCn': _envClient.uniPassHSCodeSearchApiKey,
      'hsSgn': hsCode,
      'koenTp': '1'
    };
    final response = await _httpClient.get('hsSgnQry/searchHsSgn', queryParams: queryParams, isXmlResponse: true);
    List<dynamic> items = response["hsSgnSrchRtnVo"]['hsSgnSrchRsltVo'];
    final result = items.map<String>((item) => item['txtpSgn'] ?? "").toList();
    return result;
  }
}
