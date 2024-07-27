import 'package:e_commerce_project/utils.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../skelton.dart';

class RecommandedOrRecentProductListSkeleton extends StatelessWidget {
  const RecommandedOrRecentProductListSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.255.sh,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // Find demoPopularProducts on models/ProductModel.dart
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
              left: defaultPadding, right: defaultPadding / 4),
          child: SizedBox(
            height: 0.25.sh,
            width: 140,
            child: const Padding(
              padding: EdgeInsets.all(defaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1.15,
                    child: Skeleton(),
                  ),
                  Spacer(flex: 2),
                  Skeleton(height: 12, width: 64),
                  Spacer(flex: 2),
                  Skeleton(),
                  Spacer(),
                  Skeleton(),
                  Spacer(flex: 2),
                  Skeleton(height: 12, width: 80),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
