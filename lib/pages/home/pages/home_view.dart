import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/custom_background_widget.dart';
import 'package:news_app/main.dart';
import 'package:news_app/pages/home/pages/category_view.dart';
import 'package:news_app/pages/home/widget/custom_drawer.dart';
import '../../../core/config/constants.dart';
import '../../../models/category_model.dart';
import '../widget/custom_item_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryModel> categoriesList = [
    const CategoryModel(
        id: 'sports',
        title: 'Sports',
        image: 'assets/images/sports_icn.png',
        backgroundColor: Color(0xFFC91C22)),
    const CategoryModel(
        id: 'general',
        title: 'Politics',
        image: 'assets/images/politics_icn.png',
        backgroundColor: Color(0xFF003E90)),
    const CategoryModel(
        id: 'health',
        title: 'Health',
        image: 'assets/images/health_icn.png',
        backgroundColor: Color(0xFFED1E79)),
    const CategoryModel(
        id: 'business',
        title: 'Business',
        image: 'assets/images/business_icn.png',
        backgroundColor: Color(0xFFCF7E48)),
    const CategoryModel(
        id: 'environment',
        title: 'Environment',
        image: 'assets/images/environment_icn.png',
        backgroundColor: Color(0xFF4882CF)),
    const CategoryModel(
        id: 'science',
        title: 'Science',
        image: 'assets/images/science_icn.png',
        backgroundColor: Color(0xFF2E83FA)),

    const CategoryModel(
        id: 'technology',
        title: 'Technology',
        image: 'assets/images/tech.jpeg',
        backgroundColor: Color(0xFF2576FE)),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 80,
          title: Text(
            selectCategory == null ? "News App" : selectCategory!.title,
            style: Constants.theme.textTheme.titleLarge,
          ),
        ),
        drawer: CustomDrawer(
          onCategoryDrawerTap: onDrawerCategoryClicked,
        ),
        body: selectCategory == null
            ? Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Pick your Categories \nof interest",
                      textAlign: TextAlign.start,
                      style: Constants.theme.textTheme.bodyLarge?.copyWith(
                        color: const Color(0xFF4F5A69),
                        height: 1.2,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          childAspectRatio: 4 / 5,
                        ),
                        itemBuilder: (context, index) => CustomItemWidget(
                          index: index,
                          categoryModel: categoriesList[index],
                          onCategoryClicked: onCategoryClicked,
                        ),
                        itemCount: 6,
                      ),
                    ),
                  ],
                ),
              )
            : CategoryView(
                categoryModel: selectCategory!,
              ),
      ),
    );
  }

  CategoryModel? selectCategory;

  void onCategoryClicked(CategoryModel categoryModel) {
    selectCategory = categoryModel;
    print(categoryModel.id);
    setState(() {});
  }

  void onDrawerCategoryClicked() {
    setState(() {
      selectCategory = null;
    });
    navigatorKey.currentState!.pop();
  }
}
