import 'package:flutter/material.dart';

import '../../../configs/app_dimensions.dart';

class DeliverDetailsSection extends StatelessWidget {
  const DeliverDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: kImage,
            child: Image.asset(
              'assets/cod.png',
            )),
        SizedBox(
            width: kImage,
            child: Image.asset(
              'assets/delivery_truck.png',
            )),
        SizedBox(
            width: kImage,
            child: Image.asset(
              'assets/fast_delivery.png',
            )),
        SizedBox(
            width: kImage,
            child: Image.asset(
              'assets/return_order.png',
            )),
        SizedBox(
            width: kImage,
            child: Image.asset(
              'assets/same_day.png',
            )),
      ],
    );
  }
}
