import 'package:e_commerce_project/components/product/product_card.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/screens/product/views/view.dart';
import 'package:flutter/material.dart';

import '../../services/services.dart';

class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: const EdgeInsets.all(defaultPadding),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: defaultPadding,
            crossAxisSpacing: defaultPadding,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ProductCard(
                imagesUrl: demoPopularProducts[index].image,
                title: demoPopularProducts[index].title,
                price: demoPopularProducts[index].price,
                press: () {
                  locator<NavigationService>().navigateTo(
                    ProductDetailsScreen.routeName,
                    arguments:
                        ProductDetailsScreenArgument(isProductAvailable: true),
                  );
                },
              );
            },
            childCount: demoPopularProducts.length,
          ),
        ));
  }
}
