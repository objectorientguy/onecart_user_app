import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import '../../data/models/orders/get_all_orders_model.dart';

class OrdersDetailsScreen extends StatelessWidget {
  static const routeName = 'OrdersDetailsScreen';
  final OrderDatum data;

  const OrdersDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List orderData = [
      {'title': 'Order Placed', 'status': 'done'},
      {'title': 'Confirmation of Order', 'status': 'done'},
      {'title': 'Order Shipped', 'status': 'current'},
      {'title': 'Out for Delivery', 'date': 'Pending', 'status': 'pending'},
      {'title': 'To be Delivered', 'date': 'Pending', 'status': 'pending'}
    ];
    return Scaffold(
      appBar: const GenericAppBar(
        title: 'Order Details',
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: leftRightMargin, vertical: topBottomPadding),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: xxxTinierSpacing),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                color: AppColor.primaryLighter,
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: AppColor.primary,
                            )),
                        const SizedBox(
                          width: xxxTinySpacing,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.orderId.toString(),
                                style: Theme.of(context).textTheme.headingTiny),
                            const SizedBox(height: xxxTiniestSpacing),
                            Row(
                              children: [
                                Text(
                                  'Items: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subHeadingLarge,
                                ),
                                Text(
                                  data.itemCount.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .subHeadingLarge
                                      .copyWith(color: AppColor.primary),
                                ),
                                const SizedBox(width: xxxTinierSpacing),
                                Text(
                                  'Total Price: ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subHeadingLarge,
                                ),
                                Text(
                                  ' ₹${data.totalPrice.toString()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subHeadingLarge
                                      .copyWith(color: AppColor.primary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: tinierSpacing),
                ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    separatorBuilder: (context, index) => const Divider(
                          height: smallestSpacing,
                        ),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: xMediumSpacing),
                              const SizedBox(
                                width: xxxTinySpacing,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(orderData[index]['title'],
                                          style: (orderData[index]['status'] !=
                                                  'pending')
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .textMedium
                                              : Theme.of(context)
                                                  .textTheme
                                                  .textMedium
                                                  .copyWith(
                                                      color: AppColor.grey)),
                                      const SizedBox(width: xxxTinierSpacing),
                                      (orderData[index]['status'] != 'pending')
                                          ? const Icon(
                                              Icons.check,
                                              color: AppColor.primary,
                                              size: 15,
                                            )
                                          : const SizedBox()
                                    ],
                                  ),
                                  const SizedBox(height: xxxTiniestSpacing),
                                  Text(
                                    (orderData[index]['status'] != 'pending')
                                        ? DateFormat('MMM dd y hh:mm a')
                                            .format(data.orderPlaced!)
                                            .toString()
                                        : 'Pending',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subHeadingMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          (orderData[index]['status'] == 'current')
                              ? Text(
                                  'Check My Package',
                                  style: Theme.of(context)
                                      .textTheme
                                      .xxSmall
                                      .copyWith(color: AppColor.primary),
                                )
                              : const SizedBox()
                        ],
                      );
                    })
              ],
            ),
          )),
    );
  }
}
