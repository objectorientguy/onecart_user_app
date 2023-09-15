import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/general_data_model/general_category_data.dart';
import '../../../utils/varient_index_util.dart';
import 'counter_widget.dart';

class ProductTileWidgetBody extends StatefulWidget {
  final bool ratingShow;

  const ProductTileWidgetBody({
    super.key,
    required this.data,
    this.ratingShow = true,
  });

  final Product data;

  @override
  State<ProductTileWidgetBody> createState() => _ProductTileWidgetBodyState();
}

class _ProductTileWidgetBodyState extends State<ProductTileWidgetBody> {

  @override
  Widget build(BuildContext context) {
    int variantIndex = VariantIndexUtil().getVariantIndex(widget.data);

    return SizedBox(
      height: kProductSizedBox,
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
                          widget.data.productName
                              .toString()
                              .replaceAll('\n', ""),
                          style: Theme.of(context).textTheme.xxTinier.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColor.black),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false)),

                  Visibility(
                      visible: widget.ratingShow == true,
                      child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('4.2'),
                            SizedBox(width: xxxTiniestSpacing),
                            Icon(Icons.star,
                                size: kStarIcon, color: Colors.amber)
                          ]))
                ]),
            Text(
                widget.data.variants[variantIndex].quantity
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
                              '₹${widget.data.variants[0].discountedCost.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .xxTinier
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.black)),
                          const SizedBox(width: tiniestSpacing),
                          Text(
                              '₹${widget.data.variants[0].variantCost.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .xxxTinier
                                  .copyWith(
                                      color: AppColor.grey,
                                      decoration: TextDecoration.lineThrough)),
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
                                    '${widget.data.variants[0].discount} % off',
                                    style: Theme.of(context)
                                        .textTheme
                                        .xxxTiniest
                                        .copyWith(
                                            color: AppColor.primary,
                                            fontWeight: FontWeight.w500))))
                      ]),
                  const CounterScreen()
                ])
          ]),
    );
  }
}
