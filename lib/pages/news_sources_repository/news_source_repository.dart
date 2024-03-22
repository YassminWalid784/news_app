import '../../models/source_model.dart';

abstract class NewsSourceRepository
{
Future<List<SourceModel>> getNewsSources(String categoryId);
}