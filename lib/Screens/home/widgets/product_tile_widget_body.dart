import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/home/home_model.dart';
import 'counter_widget.dart';

class ProductTileWidgetBody extends StatefulWidget {
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
  State<ProductTileWidgetBody> createState() => _ProductTileWidgetBodyState();
}

class _ProductTileWidgetBodyState extends State<ProductTileWidgetBody> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Text(
              '₹ ${widget.data[widget.index].discountedCost!.toString()}',
              style: Theme.of(context)
                  .textTheme
                  .textMediumx
                  .copyWith(fontWeight: FontWeight.w500, color: AppColor.black),
            ),
            const SizedBox(
              width: tiniestSpacing,
            ),
            Text(
              '₹ ${widget.data[widget.index].price!.toString()}',
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
                child: Text('${widget.data[widget.index].discount!} % off',
                    style: Theme.of(context).textTheme.xxxSmall.copyWith(
                        color: AppColor.primary, fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
        const CounterScreen(),
      ],
    );
  }
}
