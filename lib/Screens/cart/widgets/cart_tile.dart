import 'package:flutter/material.dart';
import 'package:onecart_user_app/data/models/view_cart/view_cart_model.dart';

import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'cart_tile_body.dart';

class CartTileWidget extends StatelessWidget {
  final bool ratingShow;

  const CartTileWidget({
    super.key,
    required this.data,
    this.ratingShow = true,
  });

  final CartDetailsModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
              child: Card(
                  margin: EdgeInsets.zero,
                  elevation: kCardElevation,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadiusSmall)),
                  child: Padding(
                      padding: const EdgeInsets.all(tiniestSpacing),
                      child: Container(
                          height: MediaQuery.of(context).size.width * 0.24,
                          width: MediaQuery.of(context).size.width * 0.23,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadiusSmall)),
                          child: Image.network(data.variant.image[0].toString(),
                              fit: BoxFit.fill))))),
          const SizedBox(width: xxxTinySpacing),
          Expanded(
            child: CartTileWidgetBody(data: data, ratingShow: ratingShow),
          )
        ]);
  }
}
