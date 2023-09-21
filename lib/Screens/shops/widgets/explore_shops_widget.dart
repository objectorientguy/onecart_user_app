import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class ExploreShops extends StatelessWidget {
  final List shopData;

  const ExploreShops({super.key, required this.shopData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: shopData.length,
        itemBuilder: (context, index) {
          return Container(
            height: kShopExplore,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(shopData[index]['image']),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(kGeneralBorderRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: leftRightMargin, vertical: topBottomPadding),
              child: Text(
                ' Get\n 50% OFF\n on your favourite items',
                style: Theme.of(context).textTheme.xSmall.copyWith(
                    color: AppColor.white, fontWeight: FontWeight.w500),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: xxSmallestSpacing);
        });
  }
}
