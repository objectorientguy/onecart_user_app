import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/checkout_model/checkout_model.dart';

class BillSection extends StatelessWidget {
  final CheckoutData checkoutData;

  const BillSection({super.key, required this.checkoutData});

  @override
  Widget build(BuildContext context) {
    var pointAfterArr = [];
    pointAfterArr = checkoutData.totalBill.toString().split(".");

    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: topBottomPadding),
        child: Column(
          children: [
            const SizedBox(height: tinySpacing),
            Row(
              children: [
                Text('Bill Details',
                    style: Theme.of(context)
                        .textTheme
                        .tiny
                        .copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(width: xxxTinierSpacing),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.grey,
                      ),
                      color: AppColor.primaryLight,
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.symmetric(
                      vertical: xxTiniestSpacing, horizontal: tinierSpacing),
                  child: Center(
                    child: Text(checkoutData.cartItemCount.toString(),
                        style: Theme.of(context).textTheme.tiniest.copyWith(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: smallestSpacing),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cart Total',
                  style: Theme.of(context)
                      .textTheme
                      .xxTiny
                      .copyWith(color: AppColor.grey),
                ),
                Text(
                  checkoutData.cartTotal.toString(),
                  style: Theme.of(context).textTheme.tiny.copyWith(
                      fontWeight: FontWeight.w700, color: AppColor.mediumBlack),
                )
              ],
            ),
            const Divider(height: smallerSpacing, thickness: 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount',
                  style: Theme.of(context)
                      .textTheme
                      .xxTiny
                      .copyWith(color: AppColor.grey),
                ),
                Text(
                  checkoutData.discountSum.toString(),
                  style: Theme.of(context).textTheme.tiny.copyWith(
                      color: AppColor.primary, fontWeight: FontWeight.w700),
                )
              ],
            ),
            const Divider(height: smallerSpacing, thickness: 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Coupon Applied',
                      style: Theme.of(context)
                          .textTheme
                          .xxTiny
                          .copyWith(color: AppColor.grey),
                    ),
                    const SizedBox(
                      width: xxxTinierSpacing,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.grey,
                          ),
                          color: AppColor.primaryLight,
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(
                          vertical: xxxTiniestSpacing,
                          horizontal: tinierSpacing),
                      child: Center(
                        child: Text('PAYTM TREATS',
                            style: Theme.of(context).textTheme.tiniest.copyWith(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w700)),
                      ),
                    )
                  ],
                ),
                Text(
                  '-₹300',
                  style: Theme.of(context).textTheme.tiny.copyWith(
                      color: AppColor.primary, fontWeight: FontWeight.w700),
                )
              ],
            ),
            const Divider(height: smallerSpacing, thickness: 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Charges',
                  style: Theme.of(context)
                      .textTheme
                      .xxTiny
                      .copyWith(color: AppColor.grey),
                ),
                Text(
                  checkoutData.deliveryCharges.toString(),
                  style: Theme.of(context).textTheme.tiny.copyWith(
                      fontWeight: FontWeight.w700, color: AppColor.mediumBlack),
                )
              ],
            ),
            const Divider(height: smallerSpacing, thickness: 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context)
                      .textTheme
                      .xxTiny
                      .copyWith(color: AppColor.grey),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('₹',
                        style: Theme.of(context)
                            .textTheme
                            .xxMedium
                            .copyWith(fontWeight: FontWeight.w100)),
                    Text(pointAfterArr[0],
                        style: Theme.of(context)
                            .textTheme
                            .xxMedium
                            .copyWith(fontWeight: FontWeight.w700)),
                    Text(".${pointAfterArr[1]}",
                        style: Theme.of(context)
                            .textTheme
                            .xxTiny
                            .copyWith(color: AppColor.mediumBlack)),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
