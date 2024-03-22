import 'package:news_app/models/ArticleDataModel.dart';

abstract class ArticlesDataSource {
  Future<List<ArticleDataModel>> getArticles(String sourceId);
}
