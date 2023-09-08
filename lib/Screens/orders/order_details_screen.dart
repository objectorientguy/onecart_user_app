import 'package:flutter/material.dart';
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
        'title': 'Out for Delivery',
        'date': 'Pending',
        'status': 'pending',
        'image': 'assets/pending.png'
      },
      {
        'title': 'To be Delivered',
        'date': 'Pending',
        'status': 'pending',
        'image': 'assets/pending.png'
      }
    ];
    return  Scaffold(
      backgroundColor: AppColor.lighterGrey,
      appBar: const GenericAppBar(
        title: 'Order Details',
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 400,
                    decoration:
                    const BoxDecoration(color: AppColor.white),
                    child:  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: topBottomPadding, vertical: xxTinySpacing),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order Status', style: Theme.of(context).textTheme.textLarge.copyWith(fontWeight: FontWeight.w600)),
                            Text('Delivered on Aug 29',
                            style: Theme.of(context).textTheme.headingSmall.copyWith(fontWeight: FontWeight.w600)),
                            SizedBox(height: xxxSmallestSpacing,),

                          ]),
                    ),
                  ),
                  Container(
                    height: 250,
                    decoration:
                    const BoxDecoration(color: AppColor.white),
                   child: Padding(
                     padding: const EdgeInsets.all(topBottomPadding),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Track Order', style: Theme.of(context).textTheme.headingSmall,),
                         Icon(Icons.keyboard_arrow_down),
                       ],
                     ),
                   ),
                  ),
                  const SizedBox(
                    height: xxSmallerSpacing,
                  ),
                  Container(
                    height: 600,
                    decoration: const BoxDecoration(color: AppColor.white),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpansionTile(
                        title: Text('Order Details', style: Theme.of(context).textTheme.headingSmall),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Name', style: Theme.of(context).textTheme.xxGSmall),
                              Text('Ayushi Chintawar', style: Theme.of(context).textTheme.xxGSmall.copyWith(color: AppColor.black)),

                            ],
                          ),
                          Divider(),
                        ],

                      ),
                    ),
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
