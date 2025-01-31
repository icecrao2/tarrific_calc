import 'package:tariff_calc/domain/hs_code/entity/hs_code_entity.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_request_form_entity.dart';
import 'package:tariff_calc/domain/hs_code/repository/hs_code_list_repository.dart';

class HsCodeListRepositoryUniPass extends HsCodeListRepository {
  @override
  Future<List<HsCodeEntity>> getHsCodeListByKorean(HsCodeRequestFormEntity requestForm) async {
    return [
      HsCodeEntity(hsCode: "15616515615", koreanName: "고등어", englishName: 'fewfewwf', defaultTax: 5.5, weightUnit: "KG"),
      HsCodeEntity(hsCode: "15616515615", koreanName: "고등어", englishName: 'fewfewwf', defaultTax: 5.5, weightUnit: "KG"),
      HsCodeEntity(hsCode: "15616515615", koreanName: "고등어", englishName: 'fewfewwf', defaultTax: 5.5, weightUnit: "KG"),
      HsCodeEntity(hsCode: "15616515615", koreanName: "고등어", englishName: 'fewfewwf', defaultTax: 5.5, weightUnit: "KG"),
      HsCodeEntity(hsCode: "15616515615", koreanName: "고등어", englishName: 'fewfewwf', defaultTax: 5.5, weightUnit: "KG"),
      HsCodeEntity(hsCode: "15616515615", koreanName: "고등어", englishName: 'fewfewwf', defaultTax: 5.5, weightUnit: "KG"),
    ];
  }
}
