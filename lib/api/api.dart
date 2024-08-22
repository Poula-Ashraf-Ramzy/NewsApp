import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constans.dart';
import 'package:news/model/NewsRespones.dart';
import 'package:news/model/SourceResponse.dart';
/*
  * https://newsapi.org/v2/top-headlines/sources?apiKey=0a7432886d4e40d0a340b7042d0b478b
  * */

class ApiManager {
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesApi,
        {"apiKey": "0a7432886d4e40d0a340b7042d0b478b", "category": categoryId});
    var response = await http.get(url);
    try {
      var responesBody = response.body;
      var json = jsonDecode(responesBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsRespones?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi,
        {"apiKey": "0a7432886d4e40d0a340b7042d0b478b", "sources": sourceId});
    var response = await http.get(url);
    try {
      return NewsRespones.fromJson(jsonDecode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=0a7432886d4e40d0a340b7042d0b478b
*/
