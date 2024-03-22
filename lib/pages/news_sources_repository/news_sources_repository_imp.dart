import 'package:news_app/models/source_model.dart';
import 'package:news_app/pages/data/news_source_data_source/news_data_source.dart';
import 'package:news_app/pages/news_sources_repository/news_source_repository.dart';

class NewsSourcesRepositoryImp implements NewsSourceRepository {
  final NewsSourcesDataSource newsSourcesDataSource;
  NewsSourcesRepositoryImp(this.newsSourcesDataSource);
  @override
  Future<List<SourceModel>> getNewsSources(String categoryId) async {
    return await newsSourcesDataSource.getNewsSources(categoryId);
  }
}
