import 'package:flutter/material.dart';
import 'package:onecart_user_app/common_widgets/stepper_widget.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';

class OderDetailScreenCardOne extends StatelessWidget {
  const OderDetailScreenCardOne({
    super.key,
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
          title: Text('Order Details',
              style: Theme.of(context).textTheme.headingTiny),
          trailing: const Icon(Icons.keyboard_arrow_down),
          children: const [StepperWidget()]),
    );
  }
}
