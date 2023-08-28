import 'package:flutter/material.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/get_product/get_product_model.dart';

class CategoryItemScreenHeader extends StatelessWidget {
  final CategoryHeader categorydata;
  const CategoryItemScreenHeader(
     {
    super.key, required this.categorydata,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColor.white, boxShadow: [
        BoxShadow(
            blurStyle: BlurStyle.solid,
            color: AppColor.lightGrey,
            spreadRadius: kZero,
            blurRadius: kShadowBlurRadius),
      ]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            leftRightMargin, 0, leftRightMargin, leftRightMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                 CircleAvatar(
                  radius: kCircleAvatarRadius,
                  backgroundImage: NetworkImage(categorydata.categoryImage!),
                ),
                const SizedBox(width: tinySpacing),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search products...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kSearchBarRadius),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: tinySpacing),
            InkWell(
              onTap: () {},
              child:  Text(
                categorydata.categoryName!,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: tinySpacing),
          ],
        ),
      ),
    );
  }
}
