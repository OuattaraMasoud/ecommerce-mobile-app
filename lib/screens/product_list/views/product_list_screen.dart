import 'package:e_commerce_project/common/constant.dart';
import 'package:e_commerce_project/components/product/product_card.dart';
import 'package:e_commerce_project/components/skleton/others/categories_skelton.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/screens/admin/products/models/products_model.dart';
import 'package:e_commerce_project/screens/admin/repositories/product_repository.dart';
import 'package:e_commerce_project/screens/admin/subcategories/model/subcategory_model.dart';
import 'package:e_commerce_project/screens/home/views/components/categories.dart';
import 'package:e_commerce_project/screens/product/views/product_details_screen.dart';
import 'package:e_commerce_project/screens/widgets/widgets.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:e_commerce_project/screens/admin/categories/model/category_model.dart'
    as categoris;
import 'package:e_commerce_project/screens/admin/subcategories/model/subcategory_model.dart'
    as sb_categories;
import '../../../components/Banner/S/banner_s_style_1.dart';
import '../../../services/services.dart';

import '../../on_sale/views/views.dart';

class SaledProductListPageArguments {
  final String categoryName;
  final String categoryId;
  const SaledProductListPageArguments(this.categoryName, this.categoryId);
}

class SaledProductListPage extends StatefulWidget {
  final SaledProductListPageArguments saledProductListPageArguments;
  static const routeName = 'SaledProductListPageView';
  const SaledProductListPage(
      {super.key, required this.saledProductListPageArguments});

  @override
  State<SaledProductListPage> createState() => _SaledProductListPageState();
}

class PriceFilterDialog extends StatefulWidget {
  final double initialMinPrice;
  final double initialMaxPrice;
  final Function(double, double) onApplyFilter;

  PriceFilterDialog({
    required this.initialMinPrice,
    required this.initialMaxPrice,
    required this.onApplyFilter,
  });

  @override
  _PriceFilterDialogState createState() => _PriceFilterDialogState();
}

class _PriceFilterDialogState extends State<PriceFilterDialog> {
  late TextEditingController _minPriceController;
  late TextEditingController _maxPriceController;

  @override
  void initState() {
    super.initState();
    _minPriceController =
        TextEditingController(text: widget.initialMinPrice.toString());
    _maxPriceController = TextEditingController(
        text: widget.initialMaxPrice.isFinite
            ? widget.initialMaxPrice.toString()
            : '');
  }

  @override
  void dispose() {
    _minPriceController.dispose();
    _maxPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Filtre par prix"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _minPriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Prix minimum"),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _maxPriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Prix maximum"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context)
                .pop(); // Fermer le dialogue sans appliquer le filtre
          },
          child: Text("Annuler"),
        ),
        ElevatedButton(
          onPressed: () {
            // Récupérer les valeurs saisies et appliquer le filtre
            double minPrice = double.parse(_minPriceController.text);
            double maxPrice = _maxPriceController.text.isNotEmpty
                ? double.parse(_maxPriceController.text)
                : double.infinity;
            widget.onApplyFilter(minPrice, maxPrice);
            Navigator.of(context)
                .pop(); // Fermer le dialogue après application du filtre
          },
          child: Text("Appliquer"),
        ),
      ],
    );
  }
}

class _SaledProductListPageState extends State<SaledProductListPage> {
  double _minPrice = 0.0;
  double _maxPrice = double.infinity;

  // Méthode pour appliquer le filtre par prix
  void _applyPriceFilter(double minPrice, double maxPrice) {
    setState(() {
      _minPrice = minPrice;
      _maxPrice = maxPrice;
    });
  }

  List<ProductModel> _productItems = [];
  List<sb_categories.SubCategoryModel> _subCategories = [];
  int _selectedSubCategoryIndex = 0; // Track selected sub-category index

  @override
  void initState() {
    _initOperationItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              title: Text(
                widget.saledProductListPageArguments.categoryName,
                style: TextStyle(
                  fontSize: 18.sp,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/Bookmark.svg",
                      color: Theme.of(context).textTheme.bodyLarge!.color),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  BannerSStyle1(
                    title: "Nouvel \nArrivage",
                    subtitle: "Offre spécial",
                    discountParcent: 50,
                    press: () {
                      // locator<NavigationService>()
                      //     .navigateTo(OnSaleScreen.routeName);
                    },
                  ),
                  const SizedBox(height: defaultPadding / 4),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: Row(
                  children: [
                    Text(
                      "Filtrer par prix : ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => PriceFilterDialog(
                            onApplyFilter: _applyPriceFilter,
                            initialMinPrice: _minPrice,
                            initialMaxPrice: _maxPrice,
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/Filter.svg",
                              height: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Configurer",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Sous-Catégories",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  _subCategories.isEmpty
                      ? const CategoriesSkelton() // Placeholder for skeleton UI
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              // "Tout" (All) button
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: defaultPadding, right: 0),
                                child: InkWell(
                                  onTap: () {
                                    _onSubCategorySelected(0); // Select "Tout"
                                  },
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30)),
                                  child: Container(
                                    height: 36,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: defaultPadding),
                                    decoration: BoxDecoration(
                                      color: _selectedSubCategoryIndex == 0
                                          ? primaryColor
                                          : Colors.transparent,
                                      border:
                                          Border.all(color: Colors.transparent),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Tout",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: _selectedSubCategoryIndex == 0
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Other sub-categories
                              ...List.generate(
                                _subCategories.length,
                                (index) => Padding(
                                  padding: EdgeInsets.only(
                                    left: index == 0
                                        ? defaultPadding
                                        : defaultPadding / 2,
                                    right: index == _subCategories.length - 1
                                        ? defaultPadding
                                        : 0,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      _onSubCategorySelected(index +
                                          1); // Select other sub-categories
                                    },
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30)),
                                    child: Container(
                                      height: 36,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: defaultPadding),
                                      decoration: BoxDecoration(
                                        color: _selectedSubCategoryIndex ==
                                                index + 1
                                            ? primaryColor
                                            : Colors.transparent,
                                        border: Border.all(
                                            color:
                                                Theme.of(context).dividerColor),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          _subCategories[index].subCategoryName,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: _selectedSubCategoryIndex ==
                                                    index + 1
                                                ? Colors.white
                                                : Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .color,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            SliverPadding(
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
                    return _productItems[index].productPrice >= _minPrice &&
                            _productItems[index].productPrice <= _maxPrice
                        ? ProductCard(
                            imagesUrl: _productItems[index].imagesUrl,
                            title: _productItems[index].productName,
                            description:
                                _productItems[index].productDescription,
                            price: _productItems[index].productPrice,
                            press: () {
                              locator<NavigationService>().navigateTo(
                                ProductDetailsScreen.routeName,
                                arguments: ProductDetailsScreenArgument(
                                  product: _productItems[index],
                                  isProductAvailable: true,
                                ),
                              );
                            },
                          )
                        : Container(); // Filtrer les produits selon le prix
                  },
                  childCount: _productItems.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _initOperationItems() async {
    try {
      final subCategoriesData =
          await locator<ProductRepository>().getAllSubCategories();

      setState(() {
        _subCategories = List<Map<String, dynamic>>.from(subCategoriesData)
            .map((subCategory) {
          return sb_categories.SubCategoryModel.fromJson(subCategory);
        }).toList();
      });
    } catch (e) {
      logger.e(e);
    }

    // Ensure "Tout" is selected by default
    _initProductsItems(widget.saledProductListPageArguments.categoryId);
  }

  Future<void> _initProductsItems(String categoryId) async {
    try {
      final productsData =
          await locator<ProductRepository>().getAllProductsByCategory(
        categoryId,
      );

      setState(() {
        _productItems = List<ProductModel>.from(
          productsData.map((item) => ProductModel(
              categoryId: item['categoryId'],
              productId: item['productId'].replaceAll("product_", ""),
              productName: item['productName'],
              productBrand: item['productBrand'],
              imagesUrl: item['imagesUrl'],
              productDescription: item['productDescription'],
              productPrice: item["productPrice"].toDouble(),
              subCategoryId: item['subCategoryId'],
              productCreatedAt: DateTime.parse(item['productCreatedAt']),
              productUpdatedAt: DateTime.parse(item['productUpdatedAt']))),
        );
      });
    } catch (e) {
      logger.e(e);
    }
  }

  void _refreshProductsItems(String categoryId, String subCategoryId) async {
    try {
      final productsData = await locator<ProductRepository>()
          .getAllProductsByCriteria(categoryId, subCategoryId);

      setState(() {
        _productItems = List<ProductModel>.from(
          productsData.map(
              (item) => ProductModel.fromJson(item as Map<String, dynamic>)),
        );
      });
    } catch (e) {
      logger.e(e);
    }
  }

  void _onSubCategorySelected(int selectedIndex) {
    setState(() {
      _selectedSubCategoryIndex = selectedIndex;

      if (_selectedSubCategoryIndex == 0) {
        // "Tout" selected, refresh products with category ID
        _initProductsItems(widget.saledProductListPageArguments.categoryId);
      } else {
        // Other sub-category selected, refresh products with sub-category ID
        _refreshProductsItems(
            widget.saledProductListPageArguments.categoryId,
            _subCategories[_selectedSubCategoryIndex - 1]
                .subCategoryId!
                .replaceAll("subCategory_",
                    "")); // Adjust index for sub-categories list
      }
    });
  }
}
