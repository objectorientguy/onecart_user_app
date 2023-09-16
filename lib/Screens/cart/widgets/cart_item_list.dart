import 'package:flutter/material.dart';

import '../../../data/models/view_cart/view_cart_model.dart';

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
          children: List.generate(3, (index) {
            return const Text('data');
            //ProductTileWidget(data: cartDetails);
          }),
        ),
      ),
    );
  }
}
