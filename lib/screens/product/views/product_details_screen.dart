import 'package:e_commerce_project/components/components.dart';
import 'package:e_commerce_project/components/product/product_card.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/screens/admin/products/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/notify_me_card.dart';
import '../components/product_images.dart';
import '../components/product_info.dart';
import '../components/product_list_tile.dart';
import 'product_buy_now_screen.dart';

class ProductDetailsScreenArgument {
  final bool isProductAvailable;
  final ProductModel product;
  ProductDetailsScreenArgument(
      {required this.isProductAvailable, required this.product});
}

class ProductDetailsScreen extends StatefulWidget {
  final ProductDetailsScreenArgument productDetailsScreenArgument;
  static const routeName = 'ProductDetailsScreenView';

  const ProductDetailsScreen(
      {super.key, required this.productDetailsScreenArgument});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget
              .productDetailsScreenArgument.isProductAvailable
          ? CartButton(
              product: widget.productDetailsScreenArgument.product,
              price: widget.productDetailsScreenArgument.product.productPrice,
            )
          :

          /// If profuct is not available then show [NotifyMeCard]
          NotifyMeCard(
              isNotify: false,
              onChanged: (value) {},
            ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/Bookmark.svg",
                      color: Theme.of(context).textTheme.bodyLarge!.color),
                ),
              ],
            ),
            ProductImages(
              images: [
                widget.productDetailsScreenArgument.product.imagesUrl,
                widget.productDetailsScreenArgument.product.imagesUrl,
                widget.productDetailsScreenArgument.product.imagesUrl
              ],
            ),
            ProductInfo(
              brand: widget.productDetailsScreenArgument.product.productBrand,
              title: widget.productDetailsScreenArgument.product.productName,
              isAvailable: true,
              description: widget
                  .productDetailsScreenArgument.product.productDescription,
              rating: 4.4,
              numOfReviews: 3,
            ),

            ProductListTile(
              svgSrc: "assets/icons/Delivery.svg",
              title: "Informations sur votre achat",
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: Container(),
                );
              },
            ),
            // ProductListTile(
            //   svgSrc: "assets/icons/Return.svg",
            //   title: "Returns",
            //   isShowBottomBorder: true,
            //   press: () {
            //     customModalBottomSheet(
            //       context,
            //       height: MediaQuery.of(context).size.height * 0.92,
            //       child: const ProductReturnsScreen(),
            //     );
            //   },
            // ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: ReviewCard(
                  rating: 4.3,
                  numOfReviews: 3,
                  numOfFiveStar: 2,
                  numOfFourStar: 1,
                  numOfThreeStar: 0,
                  numOfTwoStar: 0,
                  numOfOneStar: 0,
                ),
              ),
            ),
            ProductListTile(
              svgSrc: "assets/icons/Chat.svg",
              title: "Revues",
              isShowBottomBorder: true,
              press: () {
                // locator<NavigationService>()
                //     .navigateTo(ProductReviewsScreen.routeName);
              },
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: defaultPadding),
            )
          ],
        ),
      ),
    );
  }
}
