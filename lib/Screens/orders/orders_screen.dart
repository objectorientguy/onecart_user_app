import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import 'order_details_screen.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders',
            style: Theme.of(context).textTheme.headingMedium),
        leading: const SizedBox(),
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
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 7,
            separatorBuilder: (context, index) => const Divider(
              height: smallestSpacing,
              thickness: 2,
            ),
            itemBuilder: (context, index) {
              if (index == 6) {
                return const SizedBox();
              }
              return Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: xxxTinierSpacing),
                child: Row(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .headingTiny),
                            const SizedBox(height: xxxTiniestSpacing),
                            SizedBox(width: MediaQuery.sizeOf(context).width*0.55,
                              child: Text(
                                'Placed on November 13, 2021, 10:00 AM',
                                style:
                                Theme.of(context).textTheme.subHeadingLarge,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Items: ',
                                  style:
                                  Theme.of(context).textTheme.subHeadingLarge,
                                ),
                                Text(
                                  '10',
                                  style:
                                  Theme.of(context).textTheme.subHeadingLarge.copyWith(color:AppColor.primary),
                                ),
                                const SizedBox(width: xxxTinierSpacing),
                                Text(
                                  'Total Price: ',
                                  style:
                                  Theme.of(context).textTheme.subHeadingLarge,
                                ),
                                Text(
                                  '₹200.00',
                                  style:
                                  Theme.of(context).textTheme.subHeadingLarge.copyWith(color:AppColor.primary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, OrdersDetailsScreen.routeName);
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 2),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 1.0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.keyboard_arrow_right,color: AppColor.primary,)),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}