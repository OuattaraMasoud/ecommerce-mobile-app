import 'package:e_commerce_project/common/constant.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../network_image_with_loader.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.imagesUrl,
    this.description,
    required this.title,
    required this.price,
    required this.press,
  });
  final String title;
  final String? description;
  final double price;
  final String imagesUrl;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(140, 220),
          maximumSize: const Size(140, 220),
          padding: const EdgeInsets.all(8)),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.115,
            child: Stack(
              children: [
                NetworkImageWithLoader(imagesUrl, radius: defaultBorderRadious),
                // if (dicountpercent != null)
                //   Positioned(
                //     right: defaultPadding / 2,
                //     top: defaultPadding / 2,
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: defaultPadding / 2),
                //       height: 16,
                //       decoration: const BoxDecoration(
                //         color: errorColor,
                //         borderRadius: BorderRadius.all(
                //             Radius.circular(defaultBorderRadious)),
                //       ),
                //       child: Text(
                //         "$dicountpercent% off",
                //         style: const TextStyle(
                //             color: Colors.white,
                //             fontSize: 10,
                //             fontWeight: FontWeight.w500),
                //       ),
                //     ),
                //   )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   brandName.toUpperCase(),
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .bodyMedium!
                  //       .copyWith(fontSize: 10),
                  // ),
                  // const SizedBox(height: defaultPadding / 2),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 12),
                  ),
                  description != null
                      ? Text(
                          description!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 12),
                        )
                      : SizedBox(),
                  const Spacer(),
                  // priceAfetDiscount != null
                  //     ? Row(
                  //         children: [
                  //           Text(
                  //             "\$$priceAfetDiscount",
                  //             style: const TextStyle(
                  //               color: Color(0xFF31B0D8),
                  //               fontWeight: FontWeight.w500,
                  //               fontSize: 12,
                  //             ),
                  //           ),
                  //           const SizedBox(width: defaultPadding / 4),
                  //           Text(
                  //             "\$$price",
                  //             style: TextStyle(
                  //               color: Theme.of(context)
                  //                   .textTheme
                  //                   .bodyMedium!
                  //                   .color,
                  //               fontSize: 10,
                  //               decoration: TextDecoration.lineThrough,
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     :
                  Text(
                    "$price FCFA",
                    style: const TextStyle(
                      color: Color(0xFF7B61FF),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
