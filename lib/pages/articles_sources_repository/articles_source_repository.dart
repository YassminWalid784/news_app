

import 'package:news_app/models/ArticleDataModel.dart';

abstract class ArticlesRepository
{
  Future<List<ArticleDataModel>> getArticles(String sourceId);
}