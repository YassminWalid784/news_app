import 'package:news_app/models/source_model.dart';
import '../network/api_manager.dart';
import 'news_data_source.dart';

class OnlineNewsSources implements NewsSourcesDataSource {
  final ApiManager apiManager;
  OnlineNewsSources(this.apiManager); // constructor
  @override
  Future<List<SourceModel>> getNewsSources(String categoryId) async {
    var sourcesList = await apiManager.fetchDataSources(categoryId);
    return sourcesList;
  }
}
