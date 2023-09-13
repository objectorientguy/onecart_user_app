import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/item_details/item_details_model.dart';
import '../../home/widgets/counter_widget.dart';

class ItemDetailsPrice extends StatelessWidget {
  final ItemDetailsData itemData;

  const ItemDetailsPrice({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  decoration: TextDecoration.lineThrough, color: AppColor.grey),
            ),
            const SizedBox(width: xxxTinierSpacing),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.primaryLight,
                  borderRadius: BorderRadius.circular(kBorderDiscount)),
              padding: const EdgeInsets.symmetric(
                  vertical: xxTiniestSpacing, horizontal: xxTinierSpacing),
              child: Center(
                child: Text('${itemData.discount.toString()}%OFF',
                    style: Theme.of(context).textTheme.xTiniest.copyWith(
                        color: AppColor.primary, fontWeight: FontWeight.w600)),
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
    );
  }
}
