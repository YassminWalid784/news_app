import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/category_model.dart';
import '../../../core/config/constants.dart';
import '../../../core/widgets/custom_background_widget.dart';
import '../viewModel/category_cubit/cubit.dart';
import '../viewModel/category_cubit/states.dart';
import '../widget/news_list_widget.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  var cubitViewModel = CategoryCubit();

  @override
  void initState() {
    cubitViewModel.getDataSources(widget.categoryModel.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      bloc: cubitViewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingCategoryState():
             {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorCategoryState():
             {
              return Text(state.errorMessage ?? "",
                style: Constants.theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
              );
            }
          case SuccessCategoryState():
            {
              var sourcesList = state.sourcesList;
              return CustomBackgroundWidget(
                  child: NewsListWidget(sourcesList: sourcesList),);
            }
        }
      },
    );
  }
}

    // ChangeNotifierProvider(
    //   create: (context) => viewModel,
    //   child: Consumer<CategoryViewModel>(
    //     builder: (context, vm, _) {
    //       if (vm.sourcesList.isEmpty) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //
    //       return CustomBackgroundWidget(
    //         child: NewsListWidget(sourcesList: vm.sourcesList),
    //       );
    //     },
    //   ),
    // );

// CustomBackgroundWidget(
//   child: FutureBuilder(
//     future: ApiManager.fetchDataSources(widget.categoryModel.id),
//     builder: (context, snapshot) {
//       if (snapshot.hasError) {
//         return const Center(
//           child: Text("Something went wrong"),
//         );
//       }
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return const Center(
//           child: CircularProgressIndicator(),
//         );
//       }
//
//       var sourcesList = snapshot.data ?? [];
//
//       return NewsListWidget(sourcesList: sourcesList);
//
// ListView.builder(
//   itemBuilder: (context, index) => Text(
//     sourcesList[index].name,
//     style: Constants.theme.textTheme.bodyLarge?.copyWith(
//       color: Colors.black,
//     ),
//   ),
//   itemCount: sourcesList.length,
// );
//           },
//         ),
//       ),
//     );
//   }
// }
