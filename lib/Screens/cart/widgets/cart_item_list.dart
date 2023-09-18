import 'package:flutter/material.dart';

import '../../../configs/app_spacing.dart';
import '../../../data/models/view_cart/view_cart_model.dart';
import 'cart_tile.dart';

class CartItemList extends StatelessWidget {
  final List<CartDetailsData> cartDetails;

  const CartItemList({
    super.key,
    required this.cartDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: cartDetails.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CartTileWidget(
                    data: cartDetails[index],
                  ),
                  const SizedBox(
                    height: xxTinySpacing,
                  )
                ],
              );
            }),
      ),
    );
  }
}
