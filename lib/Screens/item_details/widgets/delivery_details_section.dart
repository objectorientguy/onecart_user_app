import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class DeliverDetailsSection extends StatelessWidget {
  const DeliverDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHorizontalCategoryListHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 0 || index == 4) {
            return const SizedBox();
          }
          return Container(
            padding: const EdgeInsets.all(leftRightMargin),
            width: kHorizontalCategoryListHeight,
            height: kHorizontalCategoryListHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.primaryMedium, width: 1),
            ),
            child: Center(
              child: Column(
                children: [
                  Expanded(
                      child: Center(
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: AppColor.primaryLighter,
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.local_shipping_outlined,
                                color: AppColor.primary,
                              )))),
                  const SizedBox(height: tinierSpacing),
                  SizedBox(
                      width: kHorizontalCategoryListItemWidth,
                      child: Text(
                        'Same Day Delivery',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .textMedium
                            .copyWith(color: AppColor.primary),
                      ))
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: tinySpacing);
        },
      ),
    );
  }
}
