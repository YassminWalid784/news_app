import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/source_model.dart';

class ApiManager {
  static Future<List<SourceModel>> fetchDataSources(String categoryId) async {
    var url = Uri.https(
        Constants.baseUrl,
        "/v2/top-headlines/sources",
        {
          "apiKey": Constants.apiKey,
          "category": categoryId
        },
    );
    final response = await http.get(url);

    List<SourceModel> sourcesDataList = [];
    if (response.statusCode == 200) {
      // handling data
      print(response.body);
      //json decode  => 3uz a pass string w yrg3 object
      //json encode  => by5od object w y return string

      var data = jsonDecode(response.body);

      var sourcesList = data["sources"] as List;

      // object json 3uza a7wlo l dart object 3ashn a3rf at3ml m3h

      for (var element in sourcesList) {
        sourcesDataList.add(SourceModel.fromJson(element));
      }
      return sourcesDataList;
    } else {
      throw Exception("failed to load");
    }
  }
}
