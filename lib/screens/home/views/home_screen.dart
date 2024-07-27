import 'package:e_commerce_project/components/Banner/S/banner_s_style_1.dart';
import 'package:e_commerce_project/components/Banner/S/banner_s_style_5.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/screens/admin/categories/model/category_model.dart';
import 'package:e_commerce_project/screens/admin/products/models/products_model.dart'
    as products;
import 'package:e_commerce_project/screens/admin/products/models/products_model.dart';
import 'package:e_commerce_project/screens/admin/repositories/product_repository.dart';
import 'package:e_commerce_project/screens/admin/subcategories/model/subcategory_model.dart';
import 'package:e_commerce_project/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:e_commerce_project/screens/home/views/components/recommanded_products.dart';
import 'package:e_commerce_project/screens/on_sale/views/on_sale_screen.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/services.dart';
import 'components/best_sellers.dart';
import 'components/flash_sale.dart';
import 'components/most_popular.dart';
import 'components/offer_carousel_and_categories.dart';
import 'components/recent_products.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'HomeScreenView';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> _categories = [];
  List<ProductModel> _recentProductItems = [];
  List<ProductModel> _recommandedProductItems = [];
  List<SubCategoryModel> _subCategories = [];
  @override
  void initState() {
    _initOperationItems();
    _initRecommandationItems();
    _initRecentItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await _initOperationItems();
          _initRecommandationItems();
          _initRecentItems();
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: OffersCarouselAndCategories(
                subCategories: _subCategories,
                categories: _categories,
              )),
              SliverToBoxAdapter(
                  child: RecentProducts(
                productsList: _recentProductItems,
              )),
              SliverToBoxAdapter(
                  child: RecommandedProducts(
                      productsList: _recommandedProductItems)),

              // SliverToBoxAdapter(
              //   child: Column(
              //     children: [
              //       // While loading use 👇
              //       // const BannerMSkelton(),‚
              //       BannerSStyle1(
              //         title: "New \narrival",
              //         subtitle: "SPECIAL OFFER",
              //         discountParcent: 50,
              //         press: () {
              //           locator<NavigationService>()
              //               .navigateTo(OnSaleScreen.routeName);
              //         },
              //       ),
              //       const SizedBox(height: defaultPadding / 4),
              //       // We have 4 banner styles, all in the pro version
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _initOperationItems() async {
    try {
      final categoriesData =
          await locator<ProductRepository>().getAllCategories();
      final subCategoriesData =
          await locator<ProductRepository>().getAllSubCategories();
      // final productsData =
      //     await locator<ProductRepository>().getAllSubCategories();

      setState(() {
        _categories =
            List<Map<String, dynamic>>.from(categoriesData).map((category) {
          return CategoryModel.fromJson(category);
        }).toList();

        _subCategories = List<Map<String, dynamic>>.from(subCategoriesData)
            .map((subCategory) {
          return SubCategoryModel.fromJson(subCategory);
        }).toList();

        // _productItems = List<ProductModel>.from(
        //   productsData.map(
        //       (item) => ProductModel.fromJson(item as Map<String, dynamic>)),
        // );
      });
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> _initRecommandationItems() async {
    try {
      final productsData = await locator<ProductRepository>()
          .getRecommandedProducts(context.read<AuthBloc>().state.user!.id!);

      setState(() {
        _recommandedProductItems = List<products.ProductModel>.from(
          productsData.map((item) => products.ProductModel(
              categoryId: item['categoryId'],
              productName: item['name'],
              productBrand: item['brand'],
              imagesUrl: item['imagesUrl'][0],
              productDescription: item['description'],
              productPrice: item["price"].toDouble(),
              subCategoryId: item['subCategoryId'],
              productCreatedAt: DateTime.parse(item['createdAt']),
              productUpdatedAt: DateTime.parse(item['updatedAt']))),
        );
      });
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> _initRecentItems() async {
    try {
      final productsData =
          await locator<ProductRepository>().getRecentProducts();

      setState(() {
        _recentProductItems = List<products.ProductModel>.from(
          productsData.map((item) =>
              products.ProductModel.fromJson(item as Map<String, dynamic>)),
        );
      });
    } catch (e) {
      logger.e(e);
    }
  }
}
