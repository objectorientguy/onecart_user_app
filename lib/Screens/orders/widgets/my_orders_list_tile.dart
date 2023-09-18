import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class OrderTile extends StatelessWidget {
  final int idx;

  const OrderTile({
    super.key,
    required this.orderData,
    required this.idx,
  });

  final List orderData;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: xxxTinierSpacing,
            right: xxxTinierSpacing,
            top: xxxTinySpacing),
        child: Container(
            width: kSizedBoxInfinite,
            height: kSizedBoxHeightLarge,
            decoration: BoxDecoration(
                color: AppColor.paleFaintGrey,
                borderRadius: BorderRadius.circular(kSearchBarBorderRadius)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: tinierSpacing),
                        child: SizedBox(
                            height: kImageHeight,
                            width: kImageWidth,
                            child: Image.asset(orderData[idx]['image']))),
                    const SizedBox(
                      width: xxxTinierSpacing,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (orderData[idx]['title'] == "Returned" ||
                                  orderData[idx]['title'] ==
                                      "Cancelled by Operations")
                              ? Text(
                                  orderData[idx]['title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTinier
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                )
                              : Text(
                                  orderData[idx]['title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTinier
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                          (orderData[idx]['title'] == "Delivered")
                              ? Text(orderData[idx]['deliveryDate'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .tiniest
                                      .copyWith(
                                          color: AppColor.lightGrey,
                                          fontWeight: FontWeight.w500))
                              : const SizedBox(),
                          Text(
                              "${orderData[idx]['category']} (${orderData[idx]['quantity']} items)",
                              style: Theme.of(context)
                                  .textTheme
                                  .xxxTinier
                                  .copyWith(
                                      color: AppColor.darkGrey,
                                      fontWeight: FontWeight.w500)),
                        ])
                  ]),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: tinierSpacing),
                      child: Row(children: [
                        Icon(Icons.arrow_forward_ios_rounded,
                            color: AppColor.primary, size: kCounterIcon),
                      ]))
                ])));
  }
}
