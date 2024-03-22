import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/pages/home/viewModel/article_cubit/cubit.dart';
import 'package:news_app/pages/home/viewModel/article_cubit/states.dart';
import 'package:news_app/pages/home/widget/article_item_widget.dart';
import '../../../core/config/constants.dart';


class ArticleListWidget extends StatelessWidget {
  final String sourceId;

  const ArticleListWidget({
    super.key,
    required this.sourceId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleCubit, ArticlesStates>(
      builder: (context, state) {
        switch (state) {
          case LoadingArticleStates():
            {
              return Center(
                child: CircularProgressIndicator(
                  color: Constants.theme.primaryColor,
                ),
              );
            }
          case ErrorArticleStates():
            {
              return Center(
                child: Text(
                  state.errorMessage ?? "",
                  style: Constants.theme.textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
                ),
              );
            }
          case SuccessArticleStates():
            {
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ArticleItemWidget(
                      articleModel: state.articlesList[index]),
                  itemCount: state.articlesList.length,
                ),
              );
            }
        }
      },
    );

    //   Consumer<ArticlesViewModel>(
    //   builder: (context, vm, _) {
    //     if (vm.articlesList.isEmpty) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Constants.theme.primaryColor,
    //         ),
    //       );
    //     }
    //     return Expanded(
    //       child: ListView.builder(
    //         itemBuilder: (context, index) =>
    //             ArticleItemWidget(articleModel: vm.articlesList[index]),
    //         itemCount: vm.articlesList.length,
    //       ),
    //     );
    //   },
    // );
    // return FutureBuilder(
    //   future: ApiManager.fetchDataArticles(sourceId),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return Center(
    //         child: Text(
    //           "Error fetching articles",
    //           style: Constants.theme.textTheme.bodyLarge?.copyWith(
    //             color: Colors.black,
    //           ),
    //         ),
    //       );
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(
    //         child: CircularProgressIndicator(
    //           color: Constants.theme.primaryColor,
    //         ),
    //       );
    //     }
    //
    //     List<ArticleModel> articlesList = snapshot.data ?? [];
    //
    //     return Expanded(
    //       child: ListView.builder(
    //         itemBuilder: (context, index) =>
    //             ArticleItemWidget(articleModel: articlesList[index]),
    //         itemCount: articlesList.length,
    //       ),
    //     );
    //   },
    // );
  }
}
