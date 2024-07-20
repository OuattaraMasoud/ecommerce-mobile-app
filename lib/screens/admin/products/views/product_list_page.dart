import 'package:e_commerce_project/common/commons.dart';
import 'package:e_commerce_project/common/constant.dart';
import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/screens/admin/products/views.dart';
import 'package:e_commerce_project/screens/widgets/items_widgets.dart';
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
                        color: Color(0xFF7B61FF),
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
            const ItemsListWidget(),
          ],
        ),
      ),
    );
  }
}
