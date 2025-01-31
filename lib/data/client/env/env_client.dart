import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvClient {
  String get uniPassBaseUrl => dotenv.env['UNIPASS_BASE_URL']!;
  String get uniPassHSCodeSearchApiKey => dotenv.env['UNIPASS_HS_CODE_SEARCH_KEY']!;
  String get uniPassTariffCalcKey => dotenv.env['UNIPASS_TARIFF_CALC_KEY']!;
}