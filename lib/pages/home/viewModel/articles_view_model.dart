
// import 'package:flutter/material.dart';
//
//
// import '../../../models/ArticleDataModel.dart';
// import '../../../network/api_manager.dart';
//
//
// class ArticlesViewModel extends ChangeNotifier {
//   List<ArticleDataModel> _articlesList = [];
//
//   List<ArticleDataModel> get articlesList => _articlesList;
//
//   getArticlesData(String sourceId) async {
//     try {
//       _articlesList = await ApiManager.fetchDataArticles(sourceId);
//       notifyListeners();
//     } catch (error) {
//       print(error.toString());
//     }
//   }
// }