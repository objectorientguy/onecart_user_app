import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/bill_section.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/coupon_section.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/delivery_details_section.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/payment_details_section.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../common_widgets/generic_app_bar.dart';
import '../../configs/app_color.dart';
import 'order_success.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = 'CheckoutScreen';

  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GenericAppBar(
        title: 'Checkout',
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(leftRightMargin),
          child: CustomElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  OrderSuccessScreen.routeName,
                );
              },
              child: Text(
                'PAY AND CHECKOUT',
                style: Theme.of(context).textTheme.textButtonLarger,
              )),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const BillSection(),
            Container(
              height: xxSmallerSpacing,
              color: AppColor.lighterGrey,
            ),
            const CouponSection(),
            Container(
              height: xxSmallerSpacing,
              color: AppColor.lighterGrey,
            ),
            const DeliveryDetailsSection(),
            Container(
              height: xxSmallerSpacing,
              color: AppColor.lighterGrey,
            ),
            const PaymentDetailsSection(),
          ],
        ),
      ),
    );
  }
}
