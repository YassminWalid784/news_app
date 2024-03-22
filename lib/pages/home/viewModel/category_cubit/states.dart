import '../../../../models/source_model.dart';

sealed class CategoryStates {}

//class InitialCategoryState extends CategoryStates {}

class LoadingCategoryState extends CategoryStates {}

class SuccessCategoryState extends CategoryStates {
  List<SourceModel> sourcesList;
  SuccessCategoryState(this.sourcesList);
}

class ErrorCategoryState extends CategoryStates {
  String? errorMessage;
  ErrorCategoryState({this.errorMessage});
}
