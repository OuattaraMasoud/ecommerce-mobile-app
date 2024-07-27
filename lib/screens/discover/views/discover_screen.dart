import 'package:e_commerce_project/common/commons.dart';
import 'package:e_commerce_project/components/product/product_card.dart';
import 'package:e_commerce_project/components/skleton/product/products_skelton.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/screens/admin/products/models/products_model.dart';
import 'package:e_commerce_project/screens/admin/repositories/product_repository.dart';
import 'package:e_commerce_project/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:e_commerce_project/screens/home/views/components/categories.dart';
import 'package:e_commerce_project/screens/product/views/product_details_screen.dart';
import 'package:e_commerce_project/screens/product_list/product_list_bloc/product_list_bloc.dart';
import 'package:e_commerce_project/screens/search/views/components/search_form.dart';
import 'package:e_commerce_project/theme/input_decoration_theme.dart';
import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'components/expansion_category.dart';

class DiscoverScreen extends StatefulWidget {
  static const routeName = 'DiscoverScreenView';

  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<ProductModel> _productItems = [];

  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: TextFormField(
                        onSaved: (input) {
                          // Password
                        },
                        enabled: true,
                        controller: _controller,
                        validator: inputForSearchValidator.call,
                        textInputAction: TextInputAction.search,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Rechercher...",
                          border: secodaryOutlineInputBorder(context),
                          enabledBorder: secodaryOutlineInputBorder(context),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: SvgPicture.asset(
                              "assets/icons/Search.svg",
                              height: 24,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color!
                                  .withOpacity(0.3),
                            ),
                          ),
                          suffixIcon: SizedBox(
                            width: 40,
                            child: Row(
                              children: [
                                const SizedBox(
                                  height: 24,
                                  child: VerticalDivider(width: 1),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        final productsData =
                                            await locator<ProductRepository>()
                                                .searchProductsByCategory(
                                                    _controller.text);
                                        setState(() {
                                          _productItems =
                                              List<ProductModel>.from(
                                            productsData.map((item) => ProductModel(
                                                categoryId: item['categoryId'],
                                                productName:
                                                    item['productName'],
                                                productBrand:
                                                    item['productBrand'],
                                                imagesUrl: item['imagesUrl'],
                                                productDescription:
                                                    item['productDescription'],
                                                productPrice:
                                                    item["productPrice"]
                                                        .toDouble(),
                                                subCategoryId:
                                                    item['subCategoryId'],
                                                productCreatedAt:
                                                    DateTime.parse(item[
                                                        'productCreatedAt']),
                                                productUpdatedAt:
                                                    DateTime.parse(item[
                                                        'productUpdatedAt']))),
                                          );
                                        });
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                      "assets/icons/Filter.svg",
                                      height: 24,
                                      color: Theme.of(context).iconTheme.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding),
                sliver: _productItems.isEmpty
                    ? ProductsSkelton()
                    : SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.0,
                          mainAxisSpacing: defaultPadding,
                          crossAxisSpacing: defaultPadding,
                          childAspectRatio: 0.66,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
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
                                        isProductAvailable: true,
                                        product: _productItems[index]));
                              },
                            );
                          },
                          childCount: _productItems.length,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
