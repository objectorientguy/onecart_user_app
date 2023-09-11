import 'package:flutter/material.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/common_widgets/oder_detail_screen_card_two.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../common_widgets/order_detail_screen_card.dart';
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

    return Scaffold(
        appBar: GenericAppBar(title: 'Order Details', actions: [
          TextButton(
              onPressed: () {},
              child: const Text('Help',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColor.darkGrey)))
        ]),
        bottomNavigationBar: BottomAppBar(
            child: Padding(
                padding: const EdgeInsets.all(xxxTinierSpacing),
                child: Expanded(
                    child: CustomElevatedButton(
                        onPressed: () {},
                        buttonHeight: kElevatedButtonHeightSmall,
                        buttonWidth: double.maxFinite,
                        child: const Text('Reorder'))))),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: xxxSmallestSpacing, vertical: tinierSpacing),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Order Status',
                          style: Theme.of(context).textTheme.xxTiny.copyWith(
                              color: AppColor.black,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: xxxTinierSpacing),
                      Text('Delivered on Aug 29',
                          style: Theme.of(context).textTheme.tinier.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColor.primary)),
                      const SizedBox(height: xxxSmallestSpacing),
                      Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: AppColor.transparent),
                          child: const OderDetailScreenCardOne()),
                      const SizedBox(height: xxTinierSpacing),
                      Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: AppColor.transparent),
                          child: OderDetailScreenCardTwo(
                            orderData: orderData,
                          )),
                      const SizedBox(height: kOrderContainerHeight),
                      Center(
                          child: TextButton(
                              onPressed: () {},
                              child: const Text('Get invoice',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: AppColor.mediumBlack))))
                    ]))));
  }
}
