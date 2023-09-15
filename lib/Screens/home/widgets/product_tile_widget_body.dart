import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'package:onecart_user_app/data/models/general_data_model/general_category_data.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'counter_widget.dart';

class ProductTileWidgetBody extends StatefulWidget {
  final bool ratingShow;

  const ProductTileWidgetBody({
    super.key,
    required this.data,
    this.ratingShow = true, required this.index,
  });

  final List<Product> data;
  final int index;

  @override
  State<ProductTileWidgetBody> createState() => _ProductTileWidgetBodyState();
}

class _ProductTileWidgetBodyState extends State<ProductTileWidgetBody> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kProductSizedBox,
        width: MediaQuery.sizeOf(context).width * 0.6,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: Text(
                            widget.data[widget.index].productName
                                .toString()
                                .replaceAll('\n', ""),
                            style: Theme.of(context)
                                .textTheme
                                .xxTinier
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false)),
                    const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('4.2'),
                          SizedBox(width: xxxTiniestSpacing),
                          Icon(Icons.star, size: kStarIcon, color: Colors.amber)
                        ])
                  ]),
              Text(
                  widget.data[widget.index].variants[widget.index].quantity
                      .toString()
                      .replaceAll("\n", " "),
                  style: Theme.of(context)
                      .textTheme
                      .tiniest
                      .copyWith(color: AppColor.primary)),
              const SizedBox(height: xxxTiniestSpacing),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Text(
                                '₹${widget.data[widget.index].variants[widget.index].discountedCost}',
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTinier
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.black)),
                            const SizedBox(width: tiniestSpacing),
                            Text(
                                '₹${widget.data[widget.index].variants[widget.index].variantCost}',
                                style: Theme.of(context)
                                    .textTheme
                                    .xxxTinier
                                    .copyWith(
                                        color: AppColor.grey,
                                        decoration:
                                            TextDecoration.lineThrough)),
                            const SizedBox(width: tiniestSpacing)
                          ]),
                          const SizedBox(height: xxxTiniestSpacing),
                          Container(
                              width: kContainerWidth,
                              decoration: BoxDecoration(
                                  color: AppColor.primaryLight,
                                  borderRadius:
                                      BorderRadius.circular(kBorderDiscount)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: xxxTiniestSpacing,
                                  horizontal: xxxTiniestSpacing),
                              child: Center(
                                  child: Text(
                                      '${widget.data[widget.index].variants[widget.index].discount} % off',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxxTiniest
                                          .copyWith(
                                              color: AppColor.primary,
                                              fontWeight: FontWeight.w500))))
                        ]),
                    const CounterScreen()
                  ])
            ]));
  }
}
