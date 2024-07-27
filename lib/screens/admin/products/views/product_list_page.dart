import 'package:e_commerce_project/common/commons.dart';
import 'package:e_commerce_project/components/product/product_card.dart';
import 'package:e_commerce_project/components/skleton/product/product_card_skelton.dart';
import 'package:e_commerce_project/components/skleton/product/products_skelton.dart';
import 'package:e_commerce_project/components/skleton/skelton.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/models/product_model.dart';
import 'package:e_commerce_project/screens/admin/products/models/products_model.dart'
    as products;
import 'package:e_commerce_project/screens/admin/products/views.dart';
import 'package:e_commerce_project/screens/admin/repositories/product_repository.dart';
import 'package:e_commerce_project/screens/product/views/product_details_screen.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductListPage extends StatefulWidget {
  static const routeName = "ProductListPageView";
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<products.ProductModel> _productItems = [];
  @override
  void initState() {
    _initOperationItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          _initOperationItems();
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                floating: true,
                title: Text(
                  'Liste des produits',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/Search.svg",
                        color: Theme.of(context).textTheme.bodyLarge!.color),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {
                    locator<NavigationService>()
                        .navigateTo(AddNewProductPage.routeName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0.w),
                        child: Icon(
                          Icons.add,
                          size: 36.w,
                          color: const Color(0xFF7B61FF),
                        ),
                      ),
                      Text(
                        "Ajouter un produit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _productItems.isEmpty
                  ? const SliverPadding(
                      padding: EdgeInsets.all(defaultPadding),
                      sliver: ProductsSkelton(),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.all(defaultPadding),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          mainAxisSpacing: defaultPadding,
                          crossAxisSpacing: defaultPadding,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return ProductCard(
                              imagesUrl: _productItems[index].imagesUrl,
                              title: _productItems[index].productName,
                              price: _productItems[index].productPrice,
                              description:
                                  _productItems[index].productDescription,
                              press: () {
                                locator<NavigationService>().navigateTo(
                                  ProductDetailsScreen.routeName,
                                  arguments: ProductDetailsScreenArgument(
                                      product: _productItems[index],
                                      isProductAvailable: true),
                                );
                              },
                            );
                          },
                          childCount: _productItems.length,
                        ),
                      )),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initOperationItems() async {
    try {
      final data =
          await locator<ProductRepository>().getAllAvaillableProducts();

      // Verify the structure of `data` by printing it
      print(data);

      setState(() {
        _productItems = List<products.ProductModel>.from(
          data.map((item) =>
              products.ProductModel.fromJson(item as Map<String, dynamic>)),
        );
      });
    } catch (e) {
      logger.e(e);
    }
  }
}
