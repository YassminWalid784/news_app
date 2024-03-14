import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/network/api_manager.dart';

import '../../../core/widgets/custom_background_widget.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: FutureBuilder(
        future: ApiManager.fetchDataSources(categoryModel.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Somthing went wrong"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var sourcesList = snapshot.data ?? [];

          return ListView.builder(
            itemBuilder: (context, index) => Text(
              sourcesList[index].name,
              style: Constants.theme.textTheme.bodyLarge?.copyWith(
                color: Colors.black,
              ),
            ),
            itemCount: sourcesList.length,
          );
        },
      ),
    );
  }
}
