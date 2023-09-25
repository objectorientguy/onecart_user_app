import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../data/models/orders/order_details_model.dart';
import 'order_placed_tile.dart';

class ItemOrderedExpansionTile extends StatelessWidget {
  final index;
  final List<OrderProduct> orderProductData;
  const ItemOrderedExpansionTile({
    super.key,
    this.index,
    required this.orderProductData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primaryLightShade,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(smallCardCurve))),
      child: ExpansionTile(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(kBorderDiscount))),
          backgroundColor: AppColor.white,
          initiallyExpanded: true,
          title:
              Text('Item Ordered', style: Theme.of(context).textTheme.xxTiny),
          trailing: const Icon(Icons.keyboard_arrow_down),
          children: List.generate(orderProductData.length, (index) {
            return OrderPlacedTile(
              title: 'Add Review',
              orderProductData: orderProductData[index],
            );
          })),
    );
  }
}
