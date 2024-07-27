import 'package:e_commerce_project/components/product/product_card.dart';
import 'package:e_commerce_project/components/skleton/product/products_skelton.dart';
import 'package:e_commerce_project/components/skleton/product/recommanded_or_recent_product_list_skeleton.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/screens/admin/repositories/product_repository.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_project/screens/admin/products/models/products_model.dart'
    as products;

import '../../../../constants.dart';
import '../../../../services/services.dart';
import '../../../product/views/view.dart';

class RecentProducts extends StatefulWidget {
  final List<products.ProductModel> productsList;
  const RecentProducts({super.key, required this.productsList});

  @override
  State<RecentProducts> createState() => _RecentProductsState();
}

class _RecentProductsState extends State<RecentProducts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Récenment Ajoutés",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        widget.productsList.isEmpty
            ? const RecommandedOrRecentProductListSkeleton()
            : SizedBox(
                height: 0.255.sh,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // Find demoPopularProducts on models/ProductModel.dart
                  itemCount: widget.productsList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: defaultPadding,
                      right: index == widget.productsList.length - 1
                          ? defaultPadding
                          : 0,
                    ),
                    child: ProductCard(
                      description:
                          widget.productsList[index].productDescription,
                      imagesUrl: widget.productsList[index].imagesUrl,
                      title: widget.productsList[index].productName,
                      price: widget.productsList[index].productPrice,
                      press: () {
                        locator<NavigationService>().navigateTo(
                            ProductDetailsScreen.routeName,
                            arguments: ProductDetailsScreenArgument(
                                isProductAvailable: true,
                                product: widget.productsList[index]));
                      },
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
