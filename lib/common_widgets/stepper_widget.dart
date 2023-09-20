import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:onecart_user_app/data/models/orders/order_details_model.dart';

import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class StepperWidget extends StatelessWidget {
  final Tracking trackingData;
  const StepperWidget({
    super.key, required this.trackingData,
  });

  @override
  Widget build(BuildContext context) {
    List<StepperData> stepperData = [
      StepperData(
        title: StepperText(
          trackingData.ordered.toString(),
        ),
        subtitle: StepperText("Mon,29 Aug 11:59 AM"),
        iconWidget: Container(
            height: kContainer,
            width: kContainer,
            decoration: const BoxDecoration(
                color: AppColor.primaryLighter, shape: BoxShape.circle),
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: AppColor.primary,
            )),
      ),
      StepperData(
          title: StepperText(
      trackingData.underProcess.toString(),
            textStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: StepperText("Mon,29 Aug 11:59 AM"),
          iconWidget: Image.asset('assets/order_placed.png')),
      StepperData(
          title: StepperText(
            trackingData.shipped.toString(),
            textStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: StepperText("Mon,29 Aug 11:59 AM"),
          iconWidget: Image.asset('assets/order_shipped.png')),
      StepperData(
          title: StepperText(trackingData.delivered.toString(),
              textStyle: const TextStyle(color: Colors.grey)),
          subtitle: StepperText("Mon,29 Aug 11:59 AM"),
          iconWidget: Image.asset('assets/confirmation.png')),
    ];
    return AnotherStepper(
      stepperList: stepperData,
      stepperDirection: Axis.vertical,
      iconWidth: kCacheImageWidth,
      iconHeight: kCacheImageHeight,
      activeBarColor: AppColor.primary,
      inActiveBarColor: AppColor.grey,
      verticalGap: xxxSmallestSpacing,
      activeIndex: 1,
      barThickness: kStepper,
    );
  }
}
