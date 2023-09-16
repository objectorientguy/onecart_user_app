import 'package:flutter/material.dart';

import '../../../configs/app_spacing.dart';
import '../../../data/models/view_cart/view_cart_model.dart';
import 'cart_tile.dart';

class CartItemList extends StatelessWidget {
  final CartDetailsModel cartDetails;

  const CartItemList({
    super.key,
    required this.cartDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: List.generate(8, (index) {
            return Column(
              children: [
                CartTileWidget(
                  data: cartDetails,
                ),
                const SizedBox(
                  height: xxTinySpacing,
                )
              ],
            );
            //ProductTileWidget(data: cartDetails);
          }),
        ),
      ),
    );
  }
}
