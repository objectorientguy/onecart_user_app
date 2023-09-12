import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/home/widgets/counter_widget.dart';
import 'package:onecart_user_app/Screens/item_details/widgets/star_widget.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/item_details/item_details_model.dart';

class ItemDetailsBody extends StatelessWidget {
  final ItemDetailsData itemData;

  const ItemDetailsBody({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kZero, vertical: xxxSmallestSpacing),
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
                          fontWeight: FontWeight.w500,
                          color: AppColor.primary)),
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
        const SizedBox(height: xxxTiniestSpacing),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  '₹${itemData.discountedCost.toString()}',
                  style: Theme.of(context)
                      .textTheme
                      .xxxTiny
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: xxxTinierSpacing),
                Text(
                  '₹${itemData.price.toString()}',
                  style: Theme.of(context).textTheme.tinier.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: AppColor.grey),
                ),
                const SizedBox(width: xxxTinierSpacing),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.lightestGrey,
                      ),
                      color: AppColor.primaryLight,
                      borderRadius: BorderRadius.circular(kDiscountRadius)),
                  padding: const EdgeInsets.symmetric(
                      vertical: xxTiniestSpacing, horizontal: xxTinierSpacing),
                  child: Center(
                    child: Text('${itemData.discount.toString()}%OFF',
                        style: Theme.of(context).textTheme.xTiniest.copyWith(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
            const CounterScreen(
              height: kCartButtonHeight,
              width: kCartButtonWidth,
              title: 'ADD TO CART',
            ),
          ],
        ),
        const SizedBox(height: xxxTinySpacing),
        Text('Product Details',
            style: Theme.of(context)
                .textTheme
                .tinier
                .copyWith(fontWeight: FontWeight.w500)),
        SizedBox(child: Text(itemData.details.toString())),
        const SizedBox(height: xxxTinySpacing),
        Text('Description',
            style: Theme.of(context)
                .textTheme
                .tinier
                .copyWith(fontWeight: FontWeight.w500)),
        SizedBox(child: Text(itemData.description.toString())),
        const SizedBox(height: xxxTinySpacing),
      ],
    );
  }
}
