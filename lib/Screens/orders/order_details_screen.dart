import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';

import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../common_widgets/custom_elevated_button.dart';
import '../../configs/app_color.dart';

import '../../configs/app_dimensions.dart';

class OrdersDetailsScreen extends StatelessWidget {
  static const routeName = 'OrdersDetailsScreen';

  const OrdersDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List orderData = [
      {
        'title': 'Name',
        'status': 'Ayushi Chintawar',
      },
      {
        'title': 'Order Number',
        'status': '1661587456982A2',
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
        'status': 'TFM511455884510',
      },
      {
        'title': 'Invoice Amount',
        'status': '₹ 575.00',
      }
    ];
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
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(xxxTinierSpacing),
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
                width: xxTiniestSpacing,
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
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: xxxTinierSpacing, vertical: tinierSpacing),
            child: Column(
              children: [
                Container(
                  width: kOrderContainerWidth,
                  decoration: const BoxDecoration(color: AppColor.white),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: tinySpacing),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order Status',
                              style: Theme.of(context).textTheme.textLarge),
                          Text('Delivered on Aug 29',
                              style: Theme.of(context)
                                  .textTheme
                                  .headingTiny
                                  .copyWith(fontWeight: FontWeight.w600)),
                          const SizedBox(
                            height: xxTinierSpacing,
                          ),
                        ]),
                  ),
                ),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: AppColor.transparent),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    title: Text('Order Details',
                        style: Theme.of(context).textTheme.headingTiny),
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
                const SizedBox(height: xxTinierSpacing),
                Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: AppColor.transparent),
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    backgroundColor: AppColor.white,
                    collapsedBackgroundColor: AppColor.white,
                    title: Text('Order Details',
                        style: Theme.of(context).textTheme.headingTiny),
                    trailing: const Icon(Icons.keyboard_arrow_down),
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
                              width: MediaQuery.of(context).size.width *
                                  kMediaQuerrySize,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: topBottomPadding,
                                    vertical: xxxTiniestSpacing),
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
                                                color: AppColor.darkGrey,
                                                fontWeight: FontWeight.w400),
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
                                                  fontWeight: FontWeight.w500)),
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
            )),
      ),
    );
  }
}
