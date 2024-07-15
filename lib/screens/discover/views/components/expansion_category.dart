import 'package:e_commerce_project/screens/on_sale/views/on_sale_screen.dart';
import 'package:e_commerce_project/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class ExpansionCategory extends StatelessWidget {
  const ExpansionCategory({
    super.key,
    required this.title,
    required this.subCategory,
    this.svgSrc,
  });

  final String title;
  final String? svgSrc;
  final List subCategory;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: Theme.of(context).textTheme.bodyLarge!.color,
      collapsedIconColor: Theme.of(context).textTheme.bodyMedium!.color,
      leading: svgSrc != null
          ? SvgPicture.asset(
              svgSrc!,
              height: 24,
              width: 24,
            )
          : SizedBox(),
      title: Text(
        title,
        style: const TextStyle(fontSize: 14),
      ),
      textColor: Theme.of(context).textTheme.bodyLarge!.color,
      childrenPadding: const EdgeInsets.only(left: defaultPadding * 3.5),
      children: List.generate(
        subCategory.length,
        (index) => Column(
          children: [
            ListTile(
              onTap: () {
                locator<NavigationService>().navigateTo(OnSaleScreen.routeName);
              },
              title: Text(
                subCategory[index].name,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            if (index < subCategory.length - 1) const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}
