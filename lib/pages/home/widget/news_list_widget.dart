import 'package:flutter/material.dart';
import 'package:news_app/pages/home/widget/tab_item_widget.dart';
import '../../../models/source_model.dart';
import '../viewModel/article_cubit/cubit.dart';
import 'article_list_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsListWidget extends StatefulWidget {
  final List<SourceModel> sourcesList;
  const NewsListWidget({super.key, required this.sourcesList});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  int selectedIndex = 0;
  var cubitViewModel = ArticleCubit();
  @override
  void initState() {
    cubitViewModel.getArticlesData(widget.sourcesList[selectedIndex].id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return BlocProvider(
       create: (context) => cubitViewModel,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           DefaultTabController(
             length: widget.sourcesList.length,
             initialIndex: selectedIndex,
             child: TabBar(
               padding: const EdgeInsets.symmetric(vertical: 15),
               isScrollable: true,
               indicator: const BoxDecoration(),
               labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
               dividerColor: Colors.transparent,
               dividerHeight: 0,
               onTap: (index) {
                 setState(() {
                   selectedIndex = index;
                   cubitViewModel
                       .getArticlesData(widget.sourcesList[selectedIndex].id);
                 });
               },
               tabs: widget.sourcesList
                   .map(
                     (e) => TabItemWidget(
                   sourceModel: e,
                   isSelected:
                   selectedIndex == widget.sourcesList.indexOf(e),
                 ),
               )
                   .toList(),
             ),
           ),
           ArticleListWidget(
             sourceId: widget.sourcesList[selectedIndex].id,
           ),
         ],
       ),
     );


    // ChangeNotifierProvider(
    //   create: (context) => cubitViewModel,
    //   child: Consumer<ArticleDataModel>(
    //     builder: (context, vm, child) {
    //       return Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           DefaultTabController(
    //             length: widget.sourcesList.length,
    //             initialIndex: selectedIndex,
    //             child: TabBar(
    //               padding: const EdgeInsets.symmetric(vertical: 15),
    //               isScrollable: true,
    //               indicator: const BoxDecoration(),
    //               labelPadding: const EdgeInsets.symmetric(horizontal: 8.0),
    //               dividerColor: Colors.transparent,
    //               dividerHeight: 0,
    //               onTap: (index) {
    //                 setState(() {
    //                   selectedIndex = index;
    //                   vm.getArticlesData(widget.sourcesList[index].id);
    //                 });
    //               },
    //               tabs: widget.sourcesList
    //                   .map(
    //                     (e) => TabItemWidget(
    //                   sourceModel: e,
    //                   isSelected: selectedIndex == widget.sourcesList.indexOf(e),
    //                 ),
    //               )
    //                   .toList(),
    //             ),
    //           ),
    //           ArticleListWidget(
    //             sourceId: widget.sourcesList[selectedIndex].id,
    //           ),
    //         ],
    //       );
    //     },
    //   ),
    // );



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
