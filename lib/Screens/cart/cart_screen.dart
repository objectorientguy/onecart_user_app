import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_bottom_bar.dart';
import 'package:onecart_user_app/Screens/cart/widgets/cart_item_list.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'CartScreen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Your Cart', style: Theme.of(context).textTheme.headingMedium),
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
