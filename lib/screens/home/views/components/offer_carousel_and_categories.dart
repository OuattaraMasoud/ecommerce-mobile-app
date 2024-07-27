import 'package:e_commerce_project/common/commons.dart';
import 'package:e_commerce_project/components/skleton/others/categories_skelton.dart';
import 'package:e_commerce_project/screens/admin/categories/model/category_model.dart'
    as categoris;
import 'package:e_commerce_project/screens/admin/subcategories/model/subcategory_model.dart'
    as sb_categories;
import 'package:e_commerce_project/screens/home/views/components/categories.dart';
import 'package:e_commerce_project/screens/kids/views/views.dart';
import 'package:e_commerce_project/screens/product_list/views/product_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'offers_carousel.dart';

class OffersCarouselAndCategories extends StatelessWidget {
  final List<categoris.CategoryModel> categories;
  final List<sb_categories.SubCategoryModel> subCategories;
  const OffersCarouselAndCategories({
    required this.categories,
    required this.subCategories,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // While loading use 👇
        // const OffersSkelton(),
        const OffersCarousel(),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Categories",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        categories.isEmpty
            ? const CategoriesSkelton()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: defaultPadding, right: 0),
                      child: InkWell(
                        onTap: () {},
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Container(
                          height: 36,
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            border: Border.all(color: Colors.transparent),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                          ),
                          child: const Row(
                            children: [
                              Text(
                                "Tout",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ...List.generate(
                      categories.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                            left: index == 0
                                ? defaultPadding
                                : defaultPadding / 2,
                            right: index == demoCategories.length - 1
                                ? defaultPadding
                                : 0),
                        child: InkWell(
                          onTap: () {
                            locator<NavigationService>().navigateTo(
                                SaledProductListPage.routeName,
                                arguments: SaledProductListPageArguments(
                                    categories[index].categoryName,
                                    categories[index]
                                        .categoryId!
                                        .replaceAll("category_", "")));
                          },
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: Container(
                            height: 36,
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                  color: index == 0
                                      ? Colors.transparent
                                      : Theme.of(context).dividerColor),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  categories[index].categoryName,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        //const Categories(),
      ],
    );
  }
}
