import 'package:e_commerce_project/components/product/product_card.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/screens/product/views/product_details_screen.dart';
import 'package:e_commerce_project/services/services.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Les mieux vendus",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoBestSellersProducts on models/ProductModel.dart
            itemCount: demoBestSellersProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == demoBestSellersProducts.length - 1
                    ? defaultPadding
                    : 0,
              ),
              child: ProductCard(
                imagesUrl: demoBestSellersProducts[index].image,
                title: demoBestSellersProducts[index].title,
                price: demoBestSellersProducts[index].price,
                press: () {
                  // locator<NavigationService>().navigateTo(
                  //     ProductDetailsScreen.routeName,
                  //     arguments: ProductDetailsScreenArgument(
                  //         isProductAvailable: true));
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
