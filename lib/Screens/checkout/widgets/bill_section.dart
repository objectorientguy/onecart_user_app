import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
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
                    style: Theme.of(context).textTheme.headingSmall),
                const SizedBox(width: xxxTinierSpacing),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColor.grey,
                      ),
                      color: AppColor.primaryLight,
                      borderRadius:
                          BorderRadius.circular(kGeneralBorderRadiusMedium)),
                  padding: const EdgeInsets.symmetric(
                      vertical: xxTiniestSpacing, horizontal: tinierSpacing),
                  child: Center(
                    child: Text(checkoutData.cartItemCount.toString(),
                        style: Theme.of(context).textTheme.textSmall.copyWith(
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
                  style: Theme.of(context).textTheme.subHeadingLarger,
                ),
                Text(
                  checkoutData.cartTotal.toString(),
                  style: Theme.of(context).textTheme.textLarger,
                )
              ],
            ),
            const Divider(height: smallerSpacing, thickness: 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Discount',
                  style: Theme.of(context).textTheme.subHeadingLarger,
                ),
                Text(
                  checkoutData.discountSum.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .textLarger
                      .copyWith(color: AppColor.primary),
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
                      style: Theme.of(context).textTheme.subHeadingLarger,
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
                          borderRadius: BorderRadius.circular(
                              kGeneralBorderRadiusMedium)),
                      padding: const EdgeInsets.symmetric(
                          vertical: xxxTiniestSpacing,
                          horizontal: tinierSpacing),
                      child: Center(
                        child: Text('PAYTM TREATS',
                            style: Theme.of(context)
                                .textTheme
                                .textSmall
                                .copyWith(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.w700)),
                      ),
                    )
                  ],
                ),
                Text(
                  '-₹300',
                  style: Theme.of(context)
                      .textTheme
                      .textLarger
                      .copyWith(color: AppColor.primary),
                )
              ],
            ),
            const Divider(height: smallerSpacing, thickness: 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Charges',
                  style: Theme.of(context).textTheme.subHeadingLarger,
                ),
                Text(
                  checkoutData.deliveryCharges.toString(),
                  style: Theme.of(context).textTheme.textLarger,
                )
              ],
            ),
            const Divider(height: smallerSpacing, thickness: 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.subHeadingLarger,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('₹',
                        style: Theme.of(context)
                            .textTheme
                            .headingLarge
                            .copyWith(fontWeight: FontWeight.w100)),
                    Text(pointAfterArr[0],
                        style: Theme.of(context).textTheme.headingLarge),
                    Text(".${pointAfterArr[1]}",
                        style: Theme.of(context).textTheme.textLarge),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
