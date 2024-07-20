import 'package:e_commerce_project/constants.dart';
import 'package:e_commerce_project/screens/home/views/components/categories.dart';
import 'package:e_commerce_project/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/Banner/S/banner_s_style_1.dart';
import '../../../services/services.dart';

import '../../on_sale/views/views.dart';

class MensScreen extends StatefulWidget {
  static const routeName = 'MensScreenView';
  const MensScreen({super.key});

  @override
  State<MensScreen> createState() => _MensScreenState();
}

class _MensScreenState extends State<MensScreen> {
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
                'Hommes',
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
                      locator<NavigationService>()
                          .navigateTo(OnSaleScreen.routeName);
                    },
                  ),
                  const SizedBox(height: defaultPadding / 4),
                  BannerSStyle1(
                    image:
                        "https://cdn.dribbble.com/userupload/12140367/file/original-45e7b8c89834cc3e3a20e76a536d96bd.jpg?resize=752x",
                    title: "Black \nFriday",
                    subtitle: "SPECIAL OFFER",
                    discountParcent: 50,
                    press: () {
                      locator<NavigationService>()
                          .navigateTo(OnSaleScreen.routeName);
                    },
                  ),
                  const SizedBox(height: defaultPadding / 4),
                ],
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
                          "Categories",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  // While loading use 👇
                  // const CategoriesSkelton(),
                  const Categories(),
                ],
              ),
            ),
            const ItemsListWidget(),
          ],
        ),
      ),
    );
  }
}
