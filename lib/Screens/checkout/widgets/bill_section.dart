import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/checkout_model/checkout_model.dart';

class BillSection extends StatelessWidget {
  final List<CheckoutData> data;
  const BillSection(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    // log(data.toString());
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
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.symmetric(
                      vertical: xxTiniestSpacing, horizontal: tinierSpacing),
                  child: Center(
                    child: Text(data.toString(),
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
                  "data![index].cartItemCount!.toString()",
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
                          borderRadius: BorderRadius.circular(15)),
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
                  '₹30.87',
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
                    Text('2,199',
                        style: Theme.of(context).textTheme.headingLarge),
                    Text('.43', style: Theme.of(context).textTheme.textLarge),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
