import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'package:onecart_user_app/data/models/orders/order_details_model.dart';

import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class OderDetailExpansionTile extends StatelessWidget {
  final OrderDetails orderData;
  const OderDetailExpansionTile({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primaryLightShade,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(smallCardCurve))),
      child: ExpansionTile(
          initiallyExpanded: true,
          backgroundColor: AppColor.white,
          title:
              Text('Order Details', style: Theme.of(context).textTheme.xxTiny),
          trailing: const Icon(Icons.keyboard_arrow_down),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderDiscount))),
          children: [
            const SizedBox(height: tinierSpacing),
            Padding(
              padding: const EdgeInsets.only(left: kZero),
              child:  SizedBox(
                        width: MediaQuery.of(context).size.width *
                            kMediaQuerrySize,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: topBottomPadding,
                                vertical: xxxTiniestSpacing),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(children: [
                                  Expanded(
                                      flex: 5,
                                      child: Text('Name',
                                          style: Theme.of(context)
                                              .textTheme
                                              .tinier
                                              .copyWith(
                                                  color: AppColor.darkGrey,
                                                  fontWeight: FontWeight.w400))),
                                  Expanded(
                                    flex: 5,
                                    child: Text(orderData.userName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(fontWeight: FontWeight.w500)),
                                  )
                                ]),
                                Row(children: [
                                  Expanded(
                                      flex: 5,
                                      child: Text('Order Number',
                                          style: Theme.of(context)
                                              .textTheme
                                              .tinier
                                              .copyWith(
                                              color: AppColor.darkGrey,
                                              fontWeight: FontWeight.w400))),
                                  Expanded(
                                    flex: 5,
                                    child: Text(orderData.orderNumber,
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(fontWeight: FontWeight.w500)),
                                  )
                                ]),
                                Row(children: [
                                  Expanded(
                                      flex: 5,
                                      child: Text('Order Date',
                                          style: Theme.of(context)
                                              .textTheme
                                              .tinier
                                              .copyWith(
                                              color: AppColor.darkGrey,
                                              fontWeight: FontWeight.w400))),
                                  Expanded(
                                    flex: 5,
                                    child: Text(DateFormat.yMMMMd().format(orderData.orderDate),
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(fontWeight: FontWeight.w500)),
                                  )
                                ]),
                                Row(children: [
                                  Expanded(
                                      flex: 5,
                                      child: Text('Product Total',
                                          style: Theme.of(context)
                                              .textTheme
                                              .tinier
                                              .copyWith(
                                              color: AppColor.darkGrey,
                                              fontWeight: FontWeight.w400))),
                                  Expanded(
                                    flex: 5,
                                    child: Text(orderData.productTotal.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(fontWeight: FontWeight.w500)),
                                  )
                                ]),
                                Row(children: [
                                  Expanded(
                                      flex: 5,
                                      child: Text('Order Amount',
                                          style: Theme.of(context)
                                              .textTheme
                                              .tinier
                                              .copyWith(
                                              color: AppColor.darkGrey,
                                              fontWeight: FontWeight.w400))),
                                  Expanded(
                                    flex: 5,
                                    child: Text(orderData.orderAmount.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(fontWeight: FontWeight.w500)),
                                  )
                                ]),
                                Row(children: [
                                  Expanded(
                                      flex: 5,
                                      child: Text('Delivery Fee',
                                          style: Theme.of(context)
                                              .textTheme
                                              .tinier
                                              .copyWith(
                                              color: AppColor.darkGrey,
                                              fontWeight: FontWeight.w400))),
                                  Expanded(
                                    flex: 5,
                                    child: Text(orderData.deliveryFees.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(fontWeight: FontWeight.w500)),
                                  )
                                ]),
                                Row(children: [
                                  Expanded(
                                      flex: 5,
                                      child: Text('Invoice Number',
                                          style: Theme.of(context)
                                              .textTheme
                                              .tinier
                                              .copyWith(
                                              color: AppColor.darkGrey,
                                              fontWeight: FontWeight.w400))),
                                  Expanded(
                                    flex: 5,
                                    child: Text(orderData.invoiceNumber.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(fontWeight: FontWeight.w500)),
                                  )
                                ]),
                                Row(children: [
                                  Expanded(
                                      flex: 5,
                                      child: Text('Invoice Amount',
                                          style: Theme.of(context)
                                              .textTheme
                                              .tinier
                                              .copyWith(
                                              color: AppColor.darkGrey,
                                              fontWeight: FontWeight.w400))),
                                  Expanded(
                                    flex: 5,
                                    child: Text(orderData.invoiceAmount.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .tinier
                                            .copyWith(fontWeight: FontWeight.w500)),
                                  )
                                ]),

                              ],
                            )))
            )
          ]),
    );
  }
}
