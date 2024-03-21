import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import '../../../models/category_model.dart';

typedef OnCategoryClicked = void Function(CategoryModel)?;

class CustomItemWidget extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  final OnCategoryClicked onCategoryClicked;


  const CustomItemWidget({
    super.key,
    required this.index,
    required this.categoryModel,
    this.onCategoryClicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onCategoryClicked == null) return;
        onCategoryClicked!(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
            bottomRight: index % 2 == 0
                ? const Radius.circular(0.0)
                : const Radius.circular(25.0),
            bottomLeft: index % 2 == 0
                ? const Radius.circular(25.0)
                : const Radius.circular(0.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              categoryModel.image,
              fit: BoxFit.cover,
            ),
            Text(
              categoryModel.title,
              style: Constants.theme.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
