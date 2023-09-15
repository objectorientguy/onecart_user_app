import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/home/widgets/product_tile_widget_body.dart';

import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/home/home_model.dart';

class ProductTileWidget extends StatelessWidget {
  final bool ratingShow;
  final bool addButtonVisible;

  const ProductTileWidget({
    super.key,
    required this.data,
    this.ratingShow = true,
    this.addButtonVisible = true,
  });

  final Deal data;

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
                          child: Image.network(data.image![0].toString(),
                              fit: BoxFit.fill))))),
          const SizedBox(width: xxxTinySpacing),
          Expanded(
            child: ProductTileWidgetBody(
              data: data,
              ratingShow: ratingShow,
              addButtonVisible: addButtonVisible,
            ),
          )
        ]);
  }
}
