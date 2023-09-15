import 'package:flutter/material.dart';

import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_spacing.dart';

import '../../../data/models/item_details/item_details_model.dart';
import 'item_details_body.dart';

class ItemDetailsSection extends StatelessWidget {
  final ProductDetailsModel productDetailsModel;

  const ItemDetailsSection({
    required this.productDetailsModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.3 * leftRightMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productDetailsModel.data.productData.productName,
              style: Theme.of(context)
                  .textTheme
                  .tiny
                  .copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: tinySpacing),
          ItemDetailsBody(
            productDetailsModel: productDetailsModel,
          ),
          const SizedBox(height: xxxSmallestSpacing)
        ],
      ),
    );
  }
}
