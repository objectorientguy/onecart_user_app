import 'package:flutter/material.dart';

import '../../../configs/app_dimensions.dart';

class DeliverDetailsSection extends StatelessWidget {
  const DeliverDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List deliveryData = [
      {'title': '7 day returns', 'image': 'assets/cod.png'},
      {'title': 'Same day shipping', 'image': 'assets/delivery_truck.png'},
      {'title': 'Cancellable', 'image': 'assets/fast_delivery.png'},
      {'title': 'Cancellable', 'image': 'assets/return_order.png'},
      {'title': 'Cancellable', 'image': 'assets/same_day.png'},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(deliveryData.length, (index) {
        return SizedBox(
            width: kImage,
            child: Image.asset(
              deliveryData[index]['image'],
            ));
      }),
    );
  }
}
