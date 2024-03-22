import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/articles_sources_repository/articles_source_repository.dart';
import 'package:news_app/pages/articles_sources_repository/articles_sources_repository_imp.dart';
import 'package:news_app/pages/data/articles_data_source/article_data_source.dart';
import 'package:news_app/pages/data/articles_data_source/online_articles_data_source.dart';
import 'package:news_app/pages/home/viewModel/article_cubit/states.dart';
import '../../../data/network/api_manager.dart';

class ArticleCubit extends Cubit<ArticlesStates> {
  //ArticleCubit(super.initialState);
  ArticleCubit() : super(LoadingArticleStates());
  late ApiManager apiManager;
  late ArticlesDataSource articlesDataSource;
  late ArticlesRepository articlesRepository;
  getArticlesData(sourceId) async {
    apiManager = ApiManager();
    articlesDataSource = OnlineArticlesImp(apiManager);
    articlesRepository = ArticlesSourcesRepositoryImp(articlesDataSource);
    emit(LoadingArticleStates());
    try {
      var articles = await articlesRepository.getArticles(sourceId);
      // var articles = await ApiManager().fetchDataArticles(sourceId);
      emit(
        SuccessArticleStates(articles),
      );
    } catch (error) {
      emit(
        ErrorArticleStates(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
