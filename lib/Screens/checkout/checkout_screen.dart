import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/bill_section.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/coupon_section.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/delivery_details_section.dart';
import 'package:onecart_user_app/Screens/checkout/widgets/payment_details_section.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../configs/app_color.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = 'CheckoutScreen';
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text('Checkout', style: Theme.of(context).textTheme.headingMedium),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.black,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: AppColor.black,
              ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
        child: Padding(
          padding: const EdgeInsets.only(bottom: topBottomPadding),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: xxxTinySpacing, vertical: tinierSpacing),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
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
            Container(height: xxSmallerSpacing,color: AppColor.lighterGrey,),
            const CouponSection(),
            Container(height: xxSmallerSpacing,color: AppColor.lighterGrey,),
            const DeliveryDetailsSection(),
            Container(height: xxSmallerSpacing,color: AppColor.lighterGrey,),
            const PaymentDetailsSection(),
          ],
        ),
      ),
    );
  }
}








