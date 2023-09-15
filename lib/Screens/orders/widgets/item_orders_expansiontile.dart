import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/home/widgets/product_tile_widget.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'package:onecart_user_app/data/models/home/home_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class ItemOrderedExpansionTile extends StatelessWidget {
  final index;

  const ItemOrderedExpansionTile({
    super.key,
    this.index,
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
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.all(tinierSpacing),
              child: ProductTileWidget(
                addButtonVisible: false,
                ratingShow: false,
                data: Deal(
                  productName:
                      'Lays American Style Creame and Onion Potato Chips',
                  image: ['image: assets/img_2.png'],
                  discountedCost: 400,
                  price: 300,
                  weight: 166.toString(),
                  discount: 40,
                ),
              ),
            );
          })),
    );
  }
}
