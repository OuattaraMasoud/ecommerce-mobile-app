import 'package:e_commerce_project/components/network_image_with_loader.dart';
import 'package:e_commerce_project/screens/admin/products/models/products_model.dart';
import 'package:e_commerce_project/screens/auth/auth_bloc/auth_bloc.dart';
import 'package:e_commerce_project/screens/product_list/product_list_bloc/product_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductCartPage extends StatefulWidget {
  static const routeName = 'ProductCartPage';
  const ProductCartPage({super.key});

  @override
  State<ProductCartPage> createState() => _ProductCartPageState();
}

class _ProductCartPageState extends State<ProductCartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  floating: true,
                  title: Text(
                    'Panier',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/icons/Bookmark.svg",
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                  ],
                ),
                if (state.products != null && state.products!.isNotEmpty)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        ProductModel product = state.products![index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  child:
                                      NetworkImageWithLoader(product.imagesUrl),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Marque : ${product.productBrand}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Nom: ${product.productName}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Prix : ${product.productPrice} FCFA",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      // Add more details about the product as needed
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: state.products!.length,
                    ),
                  ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        double totalPrice = 0;
                        for (var product in state.products!) {
                          totalPrice += product.productPrice;
                        }
                        List<String> productIds = state.products!
                            .map((product) => product.productId!)
                            .toList();
                        Map<String, dynamic> data = {
                          "userId": context.read<AuthBloc>().state.user!.id,
                          "totalPrice": totalPrice,
                          "products": productIds
                        };
                        context
                            .read<ProductListBloc>()
                            .add(CreatePurchaseEvent(purchase: data));
                      },
                      child: Text(
                        'Payer',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
