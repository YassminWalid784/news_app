

import 'package:news_app/models/ArticleDataModel.dart';

sealed class ArticlesStates{

}
class LoadingArticleStates extends ArticlesStates{}
class SuccessArticleStates extends ArticlesStates{

  List<ArticleDataModel> articlesList;
  SuccessArticleStates(this.articlesList);

}
class ErrorArticleStates extends ArticlesStates{
  String? errorMessage;
  ErrorArticleStates({this.errorMessage});

}