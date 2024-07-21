import 'package:e_commerce_project/components/components.dart';
import 'package:e_commerce_project/components/product/product_card.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/notify_me_card.dart';
import '../components/product_images.dart';
import '../components/product_info.dart';
import '../components/product_list_tile.dart';
import 'product_buy_now_screen.dart';

class ProductDetailsScreenArgument {
  final bool isProductAvailable;
  ProductDetailsScreenArgument({required this.isProductAvailable});
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
      bottomNavigationBar:
          widget.productDetailsScreenArgument.isProductAvailable
              ? CartButton(
                  price: 140,
                  press: () {
                    customModalBottomSheet(
                      context,
                      height: MediaQuery.of(context).size.height * 0.92,
                      child: const ProductBuyNowScreen(),
                    );
                  },
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
            const ProductImages(
              images: [productDemoImg1, productDemoImg2, productDemoImg3],
            ),
            const ProductInfo(
              brand: "LIPSY LONDON",
              title: "Sleeveless Ruffle",
              isAvailable: true,
              description:
                  "Un pull-over gris cool en velours côtelé doux. Regarde moi.' En achetant des produits en coton chez Lindex, vous soutenez de manière plus responsable...",
              rating: 4.4,
              numOfReviews: 126,
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
                  numOfReviews: 128,
                  numOfFiveStar: 80,
                  numOfFourStar: 30,
                  numOfThreeStar: 5,
                  numOfTwoStar: 4,
                  numOfOneStar: 1,
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
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "Recommandations",
                  style: Theme.of(context).textTheme.titleSmall!,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                        left: defaultPadding,
                        right: index == 4 ? defaultPadding : 0),
                    child: ProductCard(
                      imagesUrl: productDemoImg2,
                      title: "Sleeveless Tiered Dobby Swing Dress",
                      price: 24.65,
                      press: () {},
                    ),
                  ),
                ),
              ),
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
