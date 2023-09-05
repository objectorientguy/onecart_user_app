import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/home/widgets/product_tile_widget_body.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.23,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
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
          const SizedBox(
            width: xxxTinierSpacing,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenwidth * 0.40,
                      child: Text(
                        data[index].productName!,
                        style: Theme.of(context)
                            .textTheme
                            .subHeadingMedium
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColor.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('4.2'),
                        SizedBox(
                          width: xxxTiniestSpacing,
                        ),
                        Icon(
                          Icons.star,
                          size: kStarIcon,
                          color: Colors.amber,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: tiniestSpacing,
                ),
                ProductTileWidgetBody(
                  screenwidth: screenwidth,
                  data: data,
                  index: index,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
