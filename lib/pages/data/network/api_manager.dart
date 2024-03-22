import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/source_model.dart';

import '../../../models/ArticleDataModel.dart';


class ApiManager {
   Future<List<SourceModel>> fetchDataSources(String categoryId) async {
    Map<String, dynamic> queryParameter = {
      "apiKey": Constants.apiKey,
      "category": categoryId
    };
    Uri url = Uri.https(
      Constants.baseUrl,
      "/v2/top-headlines/sources",
      queryParameter,
    );
    final response = await http.get(url);

    List<SourceModel> sourcesDataList = [];
    if (response.statusCode == 200) {
      // handling data
      //print(response.body);
      //json decode  => 3uz a pass string w yrg3 object
      //json encode  => by5od object w y return string

      var data = jsonDecode(response.body);

      List sourcesList = data["sources"];

      // object json 3uza a7wlo l dart object 3ashn a3rf at3ml m3h

      for (var element in sourcesList) {
        sourcesDataList.add(SourceModel.formJson(element));
      }
      return sourcesDataList;
    } else {
      throw Exception("failed to load sources");
    }
  }

   Future<List<ArticleDataModel>> fetchDataArticles(
      String sourceId) async {
    Map<String, dynamic> queryParameter = {
      "apiKey": Constants.apiKey,
      "sources": sourceId,
    };
    var url = Uri.https(Constants.baseUrl, "/v2/everything", queryParameter);
    // http.get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=$sourceId&apiKey=${Constants.apiKey}"));

    final response = await http.get(url);
    List<ArticleDataModel> articlesList = [];
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List articles = data["articles"];
      // List<Articles> articles = [];
      for (var element in articles) {
        articlesList.add(
          ArticleDataModel.fromJson(element),
        );
      }
      // ArticleDataModel articlesDataModel = ArticleDataModel.fromJson(data);
      return articlesList;
    } else {
      throw Exception("Error fetching data articles");
    }
  }
}
