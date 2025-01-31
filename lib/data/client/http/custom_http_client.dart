import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class CustomHttpClient {
  late String _baseUrl;
  late Map<String, String> _headers;

  CustomHttpClient({Map<String, String>? headers});

  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParams, bool isXmlResponse = false}) async {
    final uri = Uri.parse('$_baseUrl/$endpoint').replace(queryParameters: queryParams);
    final response = await http.get(uri, headers: _headers);
    _handleResponse(response);
    final utf8Body = utf8.decode(response.bodyBytes);
    if(isXmlResponse) {
      return _xmlToJson(utf8Body);
    }
    return jsonDecode(utf8Body);
  }

  void _handleResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception('HTTP Error: ${response.statusCode}, Body: ${response.body}');
    }
  }

  void setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }

  void setHeader(Map<String, String>? headers) {
    _headers = headers ?? {'Content-Type': 'application/json; charset=utf-8'};
  }

  dynamic _xmlToJson(String xmlBody) {
    final Xml2Json xml2json = Xml2Json();
    xml2json.parse(xmlBody);
    String jsonString = xml2json.toParker();
    return jsonDecode(jsonString);
  }
}
