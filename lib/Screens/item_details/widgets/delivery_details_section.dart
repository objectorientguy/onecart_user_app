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
    List deliveryData = [
      {'title': '7 day return'},
      {'title': 'Same day shipping'},
      {'title': 'Cancellable'},
    ];
    return SizedBox(
      height: kHorizontalCategoryListHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: deliveryData.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(leftRightMargin),
            width: kHorizontalCategoryListHeight,
            height: kHorizontalCategoryListHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.lightestGrey, width: 0.3),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                      deliveryData[index]['title'],
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.textMediumx.copyWith(
                          color: AppColor.primary, fontWeight: FontWeight.w400),
                    ))
              ],
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
