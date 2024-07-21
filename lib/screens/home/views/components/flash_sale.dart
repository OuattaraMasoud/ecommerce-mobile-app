import 'package:e_commerce_project/screens/product/views/product_details_screen.dart';
import 'package:e_commerce_project/services/services.dart';
import 'package:flutter/material.dart';

import '/components/Banner/M/banner_m_with_counter.dart';
import '../../../../components/product/product_card.dart';
import '../../../../constants.dart';
import '../../../../models/product_model.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // While loading show 👇
        // const BannerMWithCounterSkelton(),
        BannerMWithCounter(
          duration: const Duration(hours: 8),
          text: "Vente Super Flash  \n50% Off",
          press: () {},
        ),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Vente Flash",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading show 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoFlashSaleProducts on models/ProductModel.dart
            itemCount: demoFlashSaleProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == demoFlashSaleProducts.length - 1
                    ? defaultPadding
                    : 0,
              ),
              child: ProductCard(
                imagesUrl: demoFlashSaleProducts[index].image,
                title: demoFlashSaleProducts[index].title,
                price: demoFlashSaleProducts[index].price,
                press: () {
                  locator<NavigationService>().navigateTo(
                      ProductDetailsScreen.routeName,
                      arguments: ProductDetailsScreenArgument(
                          isProductAvailable: true));
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
