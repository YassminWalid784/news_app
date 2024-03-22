
import 'package:news_app/models/ArticleDataModel.dart';
import 'package:news_app/pages/data/network/api_manager.dart';

import 'article_data_source.dart';

class OnlineArticlesImp implements ArticlesDataSource
{

  final ApiManager apiManager;
  OnlineArticlesImp(this.apiManager);
  @override
  Future<List<ArticleDataModel>> getArticles(String sourceId) async{


    return await apiManager.fetchDataArticles(sourceId);
  }
}