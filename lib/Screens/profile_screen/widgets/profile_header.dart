import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column( crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: xxTinierSpacing),
          child:
              Text('Account', style: Theme.of(context).textTheme.headingMedium),
        ),
        const SizedBox(height: largerSpacing),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColor.primary,
              radius: kCircleAvatarRadius * 1.1,
              child: Text('JD',
                  style: Theme.of(context)
                      .textTheme
                      .headingLarge
                      .copyWith(color: AppColor.white)),
            ),
            const SizedBox(
              width: xxxTinySpacing,
            ),
            Text('John Doe',
                style: Theme.of(context)
                    .textTheme
                    .headingLarge
                    .copyWith(color: AppColor.black))
          ],
        ),
        const SizedBox(height: xxSmallerSpacing),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.primaryLight,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.lightGrey)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: leftRightMargin, vertical: topBottomPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Phone number',
                    style: Theme.of(context)
                        .textTheme
                        .subHeadingLarge
                        .copyWith(fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: xxTiniestSpacing,
                ),
                Text('+91-99999-88888',
                    style: Theme.of(context)
                        .textTheme
                        .textLarge
                        .copyWith(fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: xxxTinySpacing,
                ),
                Text('Email ID',
                    style: Theme.of(context)
                        .textTheme
                        .subHeadingLarge
                        .copyWith(fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: xxTiniestSpacing,
                ),
                Text('johndoe@gmail.com',
                    style: Theme.of(context)
                        .textTheme
                        .textLarge
                        .copyWith(fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
