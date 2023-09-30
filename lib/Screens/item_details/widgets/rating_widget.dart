import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/star_widget.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../ratings/widgets/peoples_ratings.dart';

class RatingWidget extends StatelessWidget {
  final int itemData;
  final int variantIndex;
  final int productId;

  const RatingWidget(
      {super.key,
      required this.itemData,
      required this.variantIndex,
      required this.productId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: kZero, vertical: tinySpacing),
      child: InkWell(
        onTap: () {
          PeoplesReviews(productId: productId);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                StarDisplayWidget(
                    filledStar: const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: kStarIconSize,
                    ),
                    unfilledStar: const Icon(
                      Icons.star_border,
                      color: Colors.amber,
                      size: kStarIconSize,
                    ),
                    halfFilledStar: const Icon(
                      Icons.star_half,
                      color: Colors.amber,
                      size: kStarIconSize,
                    ),
                    value: itemData.toDouble()),
                const SizedBox(width: xxxTinierSpacing),
                Text('${itemData.toString()} Ratings',
                    style: Theme.of(context).textTheme.xxTinier.copyWith(
                        fontWeight: FontWeight.w500, color: AppColor.primary)),
                const SizedBox(width: xxxTinierSpacing),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.primary,
                  size: kForwardIconSizeSmall,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
