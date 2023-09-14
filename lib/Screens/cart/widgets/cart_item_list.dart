import 'package:flutter/material.dart';

import '../../../configs/app_spacing.dart';


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
            return const Padding(
              padding: EdgeInsets.all(tinierSpacing),
              child: SizedBox(),
            );
          }),
        ),
      ),
    );
  }
}
