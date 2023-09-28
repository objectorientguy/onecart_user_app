import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/view_cart/view_cart_model.dart';

class CartTileWidgetBody extends StatefulWidget {
  final bool ratingShow;

  const CartTileWidgetBody({
    super.key,
    required this.data,
    this.ratingShow = true,
  });

  final CartItem data;

  @override
  State<CartTileWidgetBody> createState() => _ProductTileWidgetBodyState();
}

class _ProductTileWidgetBodyState extends State<CartTileWidgetBody> {
  @override
  Widget build(BuildContext context) {
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
                      width: kProductTileTitleWidth,
                      child: Text(
                          widget.data.product.productName
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
            SizedBox(
              width: kProductTileTitleWidth,
              child: Text(
                widget.data.variant.quantity.toString().replaceAll("\n", " "),
                style: Theme.of(context)
                    .textTheme
                    .tiniest
                    .copyWith(color: AppColor.primary),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
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
                              '₹${widget.data.variant.discountedCost.toString()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .xxTinier
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.black)),
                          const SizedBox(width: tiniestSpacing),
                          Text('₹${widget.data.variant.variantCost.toString()}',
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
                                    '${widget.data.variant.discount} % off',
                                    style: Theme.of(context)
                                        .textTheme
                                        .xxxTiniest
                                        .copyWith(
                                            color: AppColor.primary,
                                            fontWeight: FontWeight.w500))))
                      ]),
                ])
          ]),
    );
  }
}
