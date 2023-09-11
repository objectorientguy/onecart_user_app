import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class ProfileFooter extends StatelessWidget {
  const ProfileFooter({
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
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: topBottomPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('About',
                    style: Theme.of(context)
                        .textTheme
                        .tiny
                        .copyWith(fontWeight: FontWeight.w700)),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
            const Divider(
              height: 40,
              thickness: 0.3,
            ),
            const SizedBox(height: mediumSpacing),
            const Text('App Version 1.8.0'),
            const SizedBox(
              height: xxxLargerSpacing,
            )
          ],
        ),
      ),
    );
  }
}
