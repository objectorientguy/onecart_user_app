import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/home/widgets/product_tile_widget_body.dart';

import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/home/home_model.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({
    super.key,
    required this.screenwidth,
    required this.data,
    required this.index,
  });

  final double screenwidth;
  final List<Deal> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRadiusSmall)),
              child: Padding(
                padding: const EdgeInsets.all(tiniestSpacing),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.23,
                  width: MediaQuery.of(context).size.width * 0.23,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadiusSmall),
                  ),
                  child: Image.network(
                    data[index].image![0].toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: xxxTinierSpacing,
          ),
          ProductTileWidgetBody(
            screenwidth: screenwidth,
            data: data,
            index: index,
          ),
        ],
      ),
    );
  }
}
