import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/orders/get_all_orders_model.dart';

class OrderTile extends StatelessWidget {
  final List<Order> orderList;

  const OrderTile({
    super.key,
     required this.orderList
  });


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
                            child: Image.network(orderList[0].image))),
                    const SizedBox(
                      width: xxxTinierSpacing,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (orderList[0].orderStatus  == "Returned" ||
                              orderList[0].orderStatus  ==
                                      "Cancelled by Operations")
                              ? Text(
                            orderList[0].orderStatus,
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTinier
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                )
                              : Text(
                            orderList[0].orderStatus ,
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxTinier
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                          (orderList[0].orderStatus == "Delivered")
                              ? Text(('Aug 1 2023'),
                                  style: Theme.of(context)
                                      .textTheme
                                      .tiniest
                                      .copyWith(
                                          color: AppColor.lightGrey,
                                          fontWeight: FontWeight.w500))
                              : const SizedBox(),
                          Text(
                              "${orderList[0].category} (${orderList[0].itemCount} items)",
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
