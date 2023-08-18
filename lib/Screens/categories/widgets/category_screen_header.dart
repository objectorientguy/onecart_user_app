import 'package:flutter/material.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class CategoryItemScreenHeader extends StatelessWidget {
  const CategoryItemScreenHeader({
    super.key,
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
                const CircleAvatar(
                  radius: kCircleAvatarRadius,
                  backgroundImage: AssetImage('assets/img.png'),
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
              child: const Text(
                'Fruits and vegetables',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: tinySpacing),
            const Row(
              children: [
                Text(
                  '21 Stores · 234 Products',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      color: AppColor.grey),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
