import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/home/viewModel/category_view_model.dart';
import 'package:provider/provider.dart';
import '../../../core/widgets/custom_background_widget.dart';
import '../widget/news_list_widget.dart';


class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  var viewModel = CategoryViewModel();

  @override
  void initState() {
    viewModel.getDataSources(widget.categoryModel.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryViewModel>(
        builder: (context, vm, _) {
          if (vm.sourcesList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomBackgroundWidget(
            child: NewsListWidget(sourcesList: vm.sourcesList),
          );
        },
      ),
    );
  }
}
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
