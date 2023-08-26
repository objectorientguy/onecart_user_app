import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_bottom_bar.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_item_list.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';

import '../../common_widgets/generic_app_bar.dart';

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
      body: Column(
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
