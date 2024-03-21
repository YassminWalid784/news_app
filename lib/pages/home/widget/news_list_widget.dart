import 'package:flutter/material.dart';
import 'package:news_app/pages/home/widget/tab_item_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/source_model.dart';
import '../viewModel/articles_view_model.dart';
import 'article_list_widget.dart';

class NewsListWidget extends StatefulWidget {
  final List<SourceModel> sourcesList;
  const NewsListWidget({super.key, required this.sourcesList});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  int selectedIndex = 0;
  var viewModel = ArticlesViewModel();
  @override
  void initState() {
    viewModel.getNewsArticles(widget.sourcesList[selectedIndex].id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, vm, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DefaultTabController(
                length: widget.sourcesList.length,
                initialIndex: selectedIndex,
                child: TabBar(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  isScrollable: true,
                  indicator: const BoxDecoration(),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  dividerColor: Colors.transparent,
                  dividerHeight: 0,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                      vm.getNewsArticles(widget.sourcesList[index].id);
                    });
                  },
                  tabs: widget.sourcesList
                      .map(
                        (e) => TabItemWidget(
                      sourceModel: e,
                      isSelected: selectedIndex == widget.sourcesList.indexOf(e),
                    ),
                  )
                      .toList(),
                ),
              ),
              ArticleListWidget(
                sourceId: widget.sourcesList[selectedIndex].id,
              ),
            ],
          );
        },
      ),
    );



    // Column(
    //   children: [
    //     DefaultTabController(
    //       initialIndex: selectedIndex,
    //       length: widget.sourcesList.length,
    //       child: TabBar(
    //         onTap: (value) {
    //           selectedIndex = value;
    //           setState(() {});
    //         },
    //         padding: const EdgeInsets.symmetric(vertical: 8),
    //         indicator: const BoxDecoration(),
    //         dividerColor: Colors.transparent,
    //         labelPadding: const EdgeInsets.symmetric(horizontal: 10),
    //         isScrollable: true,
    //         tabs: widget.sourcesList
    //             .map((e) => TabItemWidget(
    //                   sourceModel: e,
    //                   isSelected:
    //                       selectedIndex == widget.sourcesList.indexOf(e),
    //                 ))
    //             .toList(),
    //       ),
    //     ),
    //     ArticleListWidget(
    //       sourceId: widget.sourcesList[selectedIndex].id,
    //     ),
    //   ],
    // );
  }
}
