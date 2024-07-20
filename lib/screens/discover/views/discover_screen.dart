import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/screens/home/views/components/categories.dart';
import 'package:e_commerce_project/screens/search/views/components/search_form.dart';
import 'package:flutter/material.dart';

import 'components/expansion_category.dart';

class DiscoverScreen extends StatelessWidget {
  static const routeName = 'DiscoverScreenView';

  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: SearchForm(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding / 2),
              child: Text(
                "Categories",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            // While loading use 👇
            // const Expanded(
            //   child: DiscoverCategoriesSkelton(),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: demoCategories.length,
                itemBuilder: (context, index) => ExpansionCategory(
                  svgSrc: demoCategories[index].svgSrc,
                  title: demoCategories[index].name,
                  subCategory: demoCategories,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
