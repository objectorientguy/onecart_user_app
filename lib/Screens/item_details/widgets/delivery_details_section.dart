import 'package:flutter/material.dart';

import '../../../configs/app_dimensions.dart';
import '../../../data/models/item_details/item_details_model.dart';

class DeliverDetailsSection extends StatelessWidget {
  final ProductDetailsModel productDetailsModel;

  const DeliverDetailsSection({
    super.key,
    required this.productDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
          productDetailsModel.data.feature[0].featureImage.length, (index) {
        return SizedBox(
            width: kImage,
            child: Image.network(
              productDetailsModel.data.feature[0].featureImage[index],
            ));
      }),
    );
  }
}
