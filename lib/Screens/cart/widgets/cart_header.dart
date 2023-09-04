import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          leftRightMargin, tinySpacing, leftRightMargin, topBottomPadding),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: kCircleAvatarRadius,
                backgroundImage: AssetImage('assets/img.png'),
              ),
              const SizedBox(
                width: xxTinierSpacing,
              ),
              Text('BRP Foods Agro Store',
                  style: Theme.of(context).textTheme.headingSmall),
              const SizedBox(
                width: xxxTinySpacing,
              ),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColor.primary,
              )
            ],
          ),
          const SizedBox(
            height: xxxTinySpacing,
          ),
          Container(
            padding: const EdgeInsets.all(leftRightMargin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kGeneralBorderRadius),
              color: AppColor.skyBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Subtotal',
                    style: Theme.of(context).textTheme.subHeadingLarge),
                const SizedBox(height: xxxTinierSpacing),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('₹',
                        style: Theme.of(context)
                            .textTheme
                            .headingLarge
                            .copyWith(fontWeight: FontWeight.w100)),
                    Text('2,199',
                        style: Theme.of(context).textTheme.headingLarge),
                    Text('.43', style: Theme.of(context).textTheme.textLarge),
                    const SizedBox(
                      width: xxxTinierSpacing,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.grey,
                          ),
                          color: AppColor.primaryLight,
                          borderRadius: BorderRadius.circular(
                              kGeneralBorderRadiusMedium)),
                      padding: const EdgeInsets.symmetric(
                          vertical: xxTiniestSpacing,
                          horizontal: xxTinierSpacing),
                      child: Center(
                        child: Text('3 ITEMS',
                            style: Theme.of(context)
                                .textTheme
                                .textSmall
                                .copyWith(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
