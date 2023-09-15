import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_bottom_bar.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_header.dart';
import 'package:onecart_user_app/common_widgets/generic_app_bar.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'CartScreen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: GenericAppBar(
          title: 'Your Cart',
        ),
        bottomNavigationBar: CartBottomBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: leftRightMargin, vertical: xxxTinierSpacing),
          child: Column(children: [
            CartHeader(),
            SizedBox(
              height: xxxSmallestSpacing,
            ),
            //CartItemList()
          ]),
        ));
  }
}
