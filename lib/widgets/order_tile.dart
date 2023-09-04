import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../configs/app_color.dart';
import '../configs/app_spacing.dart';

class OrderTile extends StatelessWidget {
  final String dateTime;
  final String orderID;
  final String countItem;
  final String priceTotal;
  const OrderTile({super.key, required this.dateTime, required this.orderID, required this.countItem, required this.priceTotal});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Text(
                    orderID,
                    style: Theme.of(context)
                        .textTheme
                        .headingTiny),
                const SizedBox(height: xxxTiniestSpacing),
                Row(
                  children: [
                    Text(
                      'Ordered On: ',
                      style: Theme.of(context)
                          .textTheme
                          .subHeadingLarge,
                    ),
                    SizedBox(
                      child: Text(
                        dateTime,
                        style: Theme.of(context)
                            .textTheme
                            .subHeadingLarge
                            .copyWith(
                            color: AppColor.primary),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Items: ',
                      style: Theme.of(context)
                          .textTheme
                          .subHeadingLarge,
                    ),
                    Text(
                      countItem,
                      style: Theme.of(context)
                          .textTheme
                          .subHeadingLarge
                          .copyWith(
                          color: AppColor.primary),
                    ),
                    const SizedBox(width: xxxTinierSpacing),
                    Text(
                      'Total Price: ',
                      style: Theme.of(context)
                          .textTheme
                          .subHeadingLarge,
                    ),
                    Text(
                      priceTotal,
                      style: Theme.of(context)
                          .textTheme
                          .subHeadingLarge
                          .copyWith(
                          color: AppColor.primary),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const Center(
          child: Icon(
            Icons.keyboard_arrow_right,
            color: AppColor.primary,
          ),
        ),

      ],
    );
  }
}
