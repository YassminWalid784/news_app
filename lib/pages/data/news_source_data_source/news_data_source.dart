 import '../../../models/source_model.dart';

abstract class NewsSourcesDataSource{
  // class interface

  Future<List<SourceModel>>getNewsSources(String categoryId);

}