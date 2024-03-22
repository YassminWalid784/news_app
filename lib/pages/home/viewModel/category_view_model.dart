// import 'package:flutter/material.dart';
// import 'package:news_app/network/api_manager.dart';
// import '../../../models/source_model.dart';
//
// class CategoryViewModel extends ChangeNotifier
// {
//   List<SourceModel> _sourcesList = [] ;
//   List<SourceModel> get sourcesList => _sourcesList;
//
//   getDataSources(String categoryId)async{
//     try{
//       _sourcesList = await ApiManager.fetchDataSources(categoryId);
//       notifyListeners();
//     }
//     catch(e)
//     {
//       print(e.toString());
//     }
//   }
//
//
// }
