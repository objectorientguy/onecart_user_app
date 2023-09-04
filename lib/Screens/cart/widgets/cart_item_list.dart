import 'package:flutter/material.dart';
import 'package:onecart_user_app/widgets/cart_item_tile.dart';
import '../../../configs/app_spacing.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          return const CartItemTile();
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: xxxSmallSpacing,
          );
        },
      ),
    );
  }
}
