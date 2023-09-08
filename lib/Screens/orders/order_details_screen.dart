import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';

import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';

import '../../configs/app_color.dart';

import '../../configs/app_dimensions.dart';

class OrdersDetailsScreen extends StatelessWidget {
  static const routeName = 'OrdersDetailsScreen';

  const OrdersDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StepperData> stepperData = [
      StepperData(
        title: StepperText(
          "Ordered",
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
            "Under Process",
            textStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: StepperText("Mon,29 Aug 11:59 AM"),
          iconWidget: Image.asset('assets/order_placed.png')),
      StepperData(
          title: StepperText(
            "Shipped",
            textStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          subtitle: StepperText("Mon,29 Aug 11:59 AM"),
          iconWidget: Image.asset('assets/order_shipped.png')),
      StepperData(
          title: StepperText("Delivered",
              textStyle: const TextStyle(color: Colors.grey)),
          subtitle: StepperText("Mon,29 Aug 11:59 AM"),
          iconWidget: Image.asset('assets/confirmation.png')),
    ];

    return Scaffold(
      appBar: const GenericAppBar(
        title: 'Order Details',
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: leftRightMargin, vertical: topBottomPadding),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: xxxTinierSpacing),
            child: Column(
              children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: AppColor.transparent),
                  child: ExpansionTile(
                    title: const Text('Order Details'),
                    trailing: const Icon(Icons.keyboard_arrow_down),
                    children: [
                      AnotherStepper(
                        stepperList: stepperData,
                        stepperDirection: Axis.vertical,
                        iconWidth: kCacheImageWidth,
                        iconHeight: kCacheImageHeight,
                        activeBarColor: AppColor.primary,
                        inActiveBarColor: Colors.grey,
                        verticalGap: xxxSmallestSpacing,
                        activeIndex: 1,
                        barThickness: kStepper,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
