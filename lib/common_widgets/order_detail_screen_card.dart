import 'package:flutter/material.dart';
import 'package:onecart_user_app/common_widgets/stepper_widget.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';
import '../data/models/orders/order_products.dart';

class OrderTrackingExpansionTile extends StatelessWidget {
  final OrderTrackingData trackData;
  const OrderTrackingExpansionTile({
    super.key,
    required this.trackData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primaryLightShade,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(smallCardCurve))),
      child: ExpansionTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderDiscount))),
          backgroundColor: AppColor.white,
          initiallyExpanded: true,
          title:
              Text('Order Tracking', style: Theme.of(context).textTheme.xxTiny),
          trailing: const Icon(Icons.keyboard_arrow_down),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: tinierSpacing),
              child: StepperWidget(trackedData: trackData),
            )
          ]),
    );
  }
}
