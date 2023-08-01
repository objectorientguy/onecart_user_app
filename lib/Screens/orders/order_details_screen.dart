import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';


class OrdersDetailsScreen extends StatelessWidget {
  static const routeName = 'OrdersDetailsScreen';
  const OrdersDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List orderData = [
      {
        'title': 'Order Placed',
        'date': 'Nov 13 2021 10:00 AM',
        'status': 'done'
      },
      {
        'title': 'Confirmation of Order',
        'date': 'Nov 13 2021 10:05 AM',
        'status': 'done'
      },
      {
        'title': 'Order Shipped',
        'date': 'Nov 13 2021 11:00 AM',
        'status': 'current'
      },
      {'title': 'Out for Delivery', 'date': 'Pending', 'status': 'pending'},
      {'title': 'To be Delivered', 'date': 'Pending', 'status': 'pending'}
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details',
            style: Theme.of(context).textTheme.headingMedium),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColor.black,
              ))
        ],
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
                            Text('Order #1234',
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
                                  '10',
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
                                  '₹200.00',
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
                const SizedBox(height: xxxTinierSpacing),
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
                                    orderData[index]['date'],
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
                                      .textMedium
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
