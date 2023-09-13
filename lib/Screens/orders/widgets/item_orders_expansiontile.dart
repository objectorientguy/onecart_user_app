import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/home/widgets/product_tile_widget.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'package:onecart_user_app/data/models/home/home_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';

class ItemOrderedExpansionTile extends StatelessWidget {
  final index;
  final List orderdetaildata;

  ItemOrderedExpansionTile({
    super.key,
    this.index,
    required this.orderdetaildata,
  });

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    List orderDetailData = [
      {
        'name': 'Lays American Style Creame and Onion Potato Chips',
        'image': 'image: assets/img_2.png',
        'price': '₹300',
        'actual prize': '₹300',
        'discount offer': '40% OFF',
      },
      {
        'name': 'Lays American Style Creame and Onion Potato Chips',
        'image': 'image: assets/img_2.png',
        'price': '₹300',
        'actual prize': '₹300',
        'discount offer': '40% OFF',
      },
    ];

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
          children: [
            // padding: EdgeInsets.only(left: tinierSpacing),
            ProductTileWidget(
              screenwidth: screenwidth,
              data: [Deal()],
              index: index,
            )
          ]),
    );
  }
}
