import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/item_details/item_details_model.dart';
import '../../../utils/varient_index_util.dart';
import '../../home/widgets/counter_widget.dart';

class FrequentlyBoughtItems extends StatelessWidget {
  final ProductDetailsModel productDetailsModel;

  const FrequentlyBoughtItems({super.key, required this.productDetailsModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kSizedBoxFrequent,
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: productDetailsModel.data.recommendedProducts.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: kContainerElevation,
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.all(tiniestSpacing),
                    child: Container(
                        width: kShopBox,
                        height: kCardHeightItem,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(kBorderRadiusSmall)),
                        child: Image.network(
                            productDetailsModel
                                .data.recommendedProducts[index].image[0]
                                .toString(),
                            fit: BoxFit.fill))),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: leftRightMargin, vertical: xxTiniestSpacing),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        productDetailsModel
                            .data.recommendedProducts[index].brandName,
                        style: Theme.of(context)
                            .textTheme
                            .xTinier
                            .copyWith(fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: xxxTiniestSpacing,
                      ),
                      Text(
                          "₹${productDetailsModel.data.recommendedProducts[index].discountedCost}",
                          style: Theme.of(context)
                              .textTheme
                              .tinier
                              .copyWith(fontWeight: FontWeight.w500)),
                      Row(
                        children: [
                          Text(
                              "₹${productDetailsModel.data.recommendedProducts[index].variantCost}",
                              style: Theme.of(context)
                                  .textTheme
                                  .xxxTinier
                                  .copyWith(
                                      color: AppColor.grey,
                                      decoration: TextDecoration.lineThrough)),
                          const SizedBox(
                            width: tiniestSpacing,
                          ),
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
                                      "${productDetailsModel.data.recommendedProducts[index].discount} % off",
                                      style: Theme.of(context)
                                          .textTheme
                                          .xxxTiniest
                                          .copyWith(
                                              color: AppColor.primary,
                                              fontWeight: FontWeight.w500))))
                        ],
                      ),
                      const SizedBox(height: tinierSpacing),
                      CounterScreen(
                        width: kGeneralWidth,
                        title: 'Add to Cart',
                        prodId: productDetailsModel.data.productData.productId,
                        variantId: VariantIndexUtil().getVariantIndex(
                            productDetailsModel.data.productData),
                        height: kAddButtonHeight,
                        counter: productDetailsModel.data.productData
                            .variants[index].cartItemQuantityCount,
                      ),
                    ],
                  ),
                )
              ]),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: tiniestSpacing,
            );
          },
        ));
  }
}
