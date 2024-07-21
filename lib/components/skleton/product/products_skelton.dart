import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'product_card_skelton.dart';

class ProductsSkelton extends StatelessWidget {
  const ProductsSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: defaultPadding,
        crossAxisSpacing: defaultPadding,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ProductCardSkelton();
        },
        childCount: 6,
      ),
    );
  }
}
