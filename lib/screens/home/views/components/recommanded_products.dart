import 'package:e_commerce_project/components/product/product_card.dart';
import 'package:e_commerce_project/components/skleton/product/product_card_skelton.dart';
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

class RecommandedProducts extends StatefulWidget {
  final List<products.ProductModel> productsList;

  const RecommandedProducts({super.key, required this.productsList});

  @override
  State<RecommandedProducts> createState() => _RecommandedProductsState();
}

class _RecommandedProductsState extends State<RecommandedProducts> {
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
            "Recommandations",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        widget.productsList.isEmpty
            ? const RecommandedOrRecentProductListSkeleton()
            : SizedBox(
                height: 0.275.sh,
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
                      imagesUrl: widget.productsList[index].imagesUrl,
                      title: widget.productsList[index].productName,
                      price: widget.productsList[index].productPrice,
                      description:
                          widget.productsList[index].productDescription,
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
