import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/home/home_model.dart';

class ProductTileWidgetBody extends StatelessWidget {
  const ProductTileWidgetBody({
    super.key,
    required this.screenwidth,
    required this.data,
    required this.index,
  });

  final double screenwidth;
  final List<Deal> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Text(
              '₹ ${data[index].discountedCost!.toString()}',
              style: Theme.of(context)
                  .textTheme
                  .textMediumx
                  .copyWith(fontWeight: FontWeight.w500, color: AppColor.black),
            ),
            const SizedBox(
              width: tiniestSpacing,
            ),
            Text(
              '₹ ${data[index].price!.toString()}',
              style: Theme.of(context).textTheme.xxGSmall.copyWith(
                  color: AppColor.grey, decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: tiniestSpacing,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primary,
                  ),
                  color: AppColor.primaryLight,
                  borderRadius: BorderRadius.circular(kBorderDiscount)),
              padding: const EdgeInsets.symmetric(
                  vertical: xxTiniestSpacing, horizontal: xxxTinierSpacing),
              child: Center(
                child: Text('${data[index].discount!} % off',
                    style: Theme.of(context).textTheme.xxxSmall.copyWith(
                        color: AppColor.primary, fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
        SizedBox(
          height: kAddButtonHeight,
          width: kAddButtonWidth,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(
                  horizontal: tinierSpacing, vertical: tiniestSpacing),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kAddRadius)),
              backgroundColor: AppColor.primary,
            ),
            child: Text('ADD',
                style: Theme.of(context)
                    .textTheme
                    .xxGSmall
                    .copyWith(color: AppColor.white)),
          ),
        )
      ],
    );
  }
}
