import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/star_widget.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: kZero, vertical: tinySpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const StarDisplayWidget(
                  filledStar: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: kStarIconSize,
                  ),
                  unfilledStar: Icon(
                    Icons.star_border,
                    color: Colors.amber,
                    size: kStarIconSize,
                  ),
                  halfFilledStar: Icon(
                    Icons.star_half,
                    color: Colors.amber,
                    size: kStarIconSize,
                  ),
                  value: 2.5),
              const SizedBox(width: xxxTinierSpacing),
              Text('5 Ratings',
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
    );
  }
}
