import 'package:flutter/material.dart';

import '../../../configs/app_spacing.dart';
import '../../../data/models/home/home_model.dart';
import '../../home/widgets/product_tile_widget.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.all(tinierSpacing),
              child: ProductTileWidget(
                ratingShow: false,
                data: Product(
                    productName:
                        'Lays American Style Creame and Onion Potato Chips',
                    productId: 72,
                    details: 'Premium',
                    variants: []),
              ),
            );
          }),
        ),
      ),
    );
  }
}
