import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/general_data_model/general_category_data.dart';
import '../../../utils/varient_index_util.dart';
import 'counter_widget.dart';

class ProductTileWidgetBody extends StatelessWidget {
  final bool ratingShow;

  const ProductTileWidgetBody({
    super.key,
    required this.data,
    this.ratingShow = true,
  });

  final Product data;

  @override
  Widget build(BuildContext context) {
    int variantIndex = VariantIndexUtil().getVariantIndex(data);

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
                            data.productName.toString().replaceAll('\n', ""),
                            style: Theme.of(context)
                                .textTheme
                                .xxTinier
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false)),
                    Visibility(
                        visible: ratingShow == true,
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
                  data.variants[variantIndex].quantity
                      .toString()
                      .replaceAll("\n", " "),
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
                                '₹${data.variants[variantIndex].discountedCost.toString()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .xxTinier
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.black)),
                            const SizedBox(width: tiniestSpacing),
                            Text(
                                '₹${data.variants[variantIndex].variantCost.toString()}',
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
                                      '${data.variants[variantIndex].discount} % off',
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxxTiniest
                                          .copyWith(
                                              color: AppColor.primary,
                                              fontWeight: FontWeight.w500))))
                        ]),
                    CounterScreen(
                      prodId: data.productId,
                      variantId: data.variants[variantIndex].variantId,
                      height: kAddButtonHeight,
                      width: kTileAddButtonWidth,
                      title: 'Add to Cart',
                      counter:
                          data.variants[variantIndex].cartItemQuantityCount,
                    )
                  ])
            ]));
  }
}
