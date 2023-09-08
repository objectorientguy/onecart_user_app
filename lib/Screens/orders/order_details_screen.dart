import 'package:flutter/material.dart';
import 'package:onecart_user_app/common_widgets/custom_elevated_button.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../../data/models/orders/get_all_orders_model.dart';

class OrdersDetailsScreen extends StatelessWidget {
  static const routeName = 'OrdersDetailsScreen';
  final OrderDatum data;

  const OrdersDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List orderData = [
      {
        'title': 'Name',
        'status': 'Ayushi Chintawar',
      },
      {
        'title': 'Order Number',
        'status': '1661587456982A266',
      },
      {
        'title': 'Order Date',
        'status': '29 August 2022',
      },
      {
        'title': 'Product Total',
        'status': '₹ 583.00',
      },
      {
        'title': 'Order Amount',
        'status': '₹ 583.00 (3 items)',
      },
      {
        'title': 'Delivery Fee',
        'status': 'Free',
      },
      {
        'title': 'Invoice Number',
        'status': 'TFM5114558845610',
      },
      {
        'title': 'Invoice Amount',
        'status': '₹ 575.00',
      }
    ];
    return Scaffold(
      backgroundColor: AppColor.lighterGrey,
      appBar: const GenericAppBar(
        title: 'Order Details',
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomElevatedButton(
                  onPressed: () {},
                  buttonHeight: kElevatedButtonHeightSmall,
                  buttonWidth: double.maxFinite,
                  child: const Text('Need Help'),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: CustomElevatedButton(
                  onPressed: () {},
                  buttonHeight: kElevatedButtonHeightSmall,
                  buttonWidth: double.maxFinite,
                  child: const Text('Reorder'),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 400,
                    decoration: const BoxDecoration(color: AppColor.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: topBottomPadding,
                          vertical: xxTinySpacing),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order Status',
                                style: Theme.of(context)
                                    .textTheme
                                    .textLarge
                                    .copyWith(fontWeight: FontWeight.w600)),
                            Text('Delivered on Aug 29',
                                style: Theme.of(context)
                                    .textTheme
                                    .headingSmall
                                    .copyWith(fontWeight: FontWeight.w600)),
                            const SizedBox(
                              height: xxxSmallestSpacing,
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(height: xxSmallerSpacing),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: AppColor.transparent),
                    child: ExpansionTile(
                      backgroundColor: AppColor.white,
                      collapsedBackgroundColor: AppColor.white,
                      title: Text('Order Details',
                          style: Theme.of(context).textTheme.headingSmall),
                      children: [
                        const SizedBox(height: tinierSpacing),
                        ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 8,
                            separatorBuilder: (context, index) => const Divider(
                                  color: AppColor.grey,
                                ),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: topBottomPadding,
                                      vertical: 2),
                                  child: Row(
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          orderData[index]['title'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headingTiny
                                              .copyWith(
                                                  color: AppColor.darkerGrey),
                                        ),
                                      ),
                                      //SizedBox(width: 30),
                                      Expanded(
                                        flex: 5,
                                        child: Text(orderData[index]['status'],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headingTiny
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: xxSmallerSpacing,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
