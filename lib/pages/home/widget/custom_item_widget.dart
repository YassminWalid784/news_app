import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';

import '../../../models/category_model.dart';

class CustomItemWidget extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  const CustomItemWidget({
    super.key,
    required this.index,
    required this.categoryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: categoryModel.backgroundColor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(25),
          topRight: const Radius.circular(25),
          bottomRight: index % 2 == 0
              ? const Radius.circular(0.0)
              : const Radius.circular(25.0),
          bottomLeft: index % 2 == 0
              ? const Radius.circular(25.0)
              : const Radius.circular(0.0),
        ),
        color: const Color(0xFFC91C22),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(categoryModel.image, fit: BoxFit.cover),
          Text(
            categoryModel.title,
            style: Constants.theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}