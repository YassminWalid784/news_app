import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/data/news_source_data_source/news_data_source.dart';
import 'package:news_app/pages/data/news_source_data_source/online_news_sources_imp.dart';
import 'package:news_app/pages/home/viewModel/category_cubit/states.dart';
import 'package:news_app/pages/news_sources_repository/news_source_repository.dart';
import 'package:news_app/pages/news_sources_repository/news_sources_repository_imp.dart';

import '../../../data/network/api_manager.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  //CategoryCubit(super.initialState);
  CategoryCubit() : super(LoadingCategoryState());


  late ApiManager apiManager;
  late NewsSourcesDataSource newsSourcesDataSource;
  late NewsSourceRepository newsSourceRepository;
  getDataSources(String categoryId) async {


    //DI --> creation class pattern (singleton ,builder,factory)
    apiManager = ApiManager();
    newsSourcesDataSource = OnlineNewsSources(apiManager);
    newsSourceRepository = NewsSourcesRepositoryImp(newsSourcesDataSource);
    emit(LoadingCategoryState());
    try {
      // variable scope sourceList
      // var sourcesList = await ApiManager().fetchDataSources(categoryId);

      var sourcesList = await newsSourceRepository.getNewsSources(categoryId);
      emit(SuccessCategoryState(sourcesList));
    } catch (error) {
      emit(
        ErrorCategoryState(errorMessage: error.toString()),
      );
    }
  }
}
