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
                border: Border.all(color: AppColor.lightGrey),
                borderRadius: BorderRadius.circular(kSearchBarBorderRadius)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: xxxTinierSpacing),
                        child: SizedBox(
                            height: kTextboxHeightSmallest,
                            width: kTextboxHeightSmallest,
                            child: Image.asset(orderData[idx]['image']))),
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
                                          color: AppColor.black),
                                )
                              : Text(
                                  orderData[idx]['title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTinier
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColor.darkGrey),
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
                            color: AppColor.grey, size: kCounterIcon),
                      ]))
                ])));
  }
}
