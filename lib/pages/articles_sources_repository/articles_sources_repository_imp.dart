import 'package:news_app/models/ArticleDataModel.dart';
import 'package:news_app/pages/data/articles_data_source/article_data_source.dart';

import 'articles_source_repository.dart';

class ArticlesSourcesRepositoryImp implements ArticlesRepository {
  final ArticlesDataSource articlesDataSource;
  ArticlesSourcesRepositoryImp(this.articlesDataSource);
  @override
  Future<List<ArticleDataModel>> getArticles(String sourceId) async {
    return await articlesDataSource.getArticles(sourceId);
  }
}
