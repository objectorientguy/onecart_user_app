import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_bottom_bar.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_item_list.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'CartScreen';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: xxTiniestSpacing),
          child: Text(
            "Your Cart",
            style: Theme.of(context)
                .textTheme
                .tiny
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
      ),
      bottomNavigationBar: const CartBottomBar(),
      body: const Column(
        children: [
          SizedBox(
            height: tinySpacing,
          ),
          CartItemList(),
        ],
      ),
    );
  }
}
