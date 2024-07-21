import 'package:e_commerce_project/components/product/product_card.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/screens/product/views/product_details_screen.dart';
import 'package:e_commerce_project/services/services.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class BookmarkScreen extends StatelessWidget {
  static const routeName = 'BookmarkScreenView';
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // While loading use 👇
          //  BookMarksSlelton(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding,
                childAspectRatio: 0.66,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ProductCard(
                    imagesUrl: demoPopularProducts[index].image,
                    title: demoPopularProducts[index].title,
                    price: demoPopularProducts[index].price,
                    press: () {
                      locator<NavigationService>()
                          .navigateTo(ProductDetailsScreen.routeName);
                    },
                  );
                },
                childCount: demoPopularProducts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
