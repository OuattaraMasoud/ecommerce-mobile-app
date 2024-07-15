import 'package:e_commerce_project/components/product/product_card.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../services/services.dart';
import '../../../product/views/view.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
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
            "Produits populaires",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 0.275.sh,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoPopularProducts on models/ProductModel.dart
            itemCount: demoPopularProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == demoPopularProducts.length - 1
                    ? defaultPadding
                    : 0,
              ),
              child: ProductCard(
                image: demoPopularProducts[index].image,
                brandName: demoPopularProducts[index].brandName,
                title: demoPopularProducts[index].title,
                price: demoPopularProducts[index].price,
                priceAfetDiscount: demoPopularProducts[index].priceAfetDiscount,
                dicountpercent: demoPopularProducts[index].dicountpercent,
                press: () {
                  locator<NavigationService>().navigateTo(
                      ProductDetailsScreen.routeName,
                      arguments: ProductDetailsScreenArgument(
                          isProductAvailable: true));
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
