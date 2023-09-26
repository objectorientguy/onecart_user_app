import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../edit_profie_screen.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.primary,
                radius: kCircleAvatarRadius * 1,
                child: Text('JD',
                    style: Theme.of(context).textTheme.xxxTiny.copyWith(
                        color: AppColor.white, fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                width: xxxTinySpacing,
              ),
              Text(
                'John Doe',
                style: Theme.of(context)
                    .textTheme
                    .xxMedium
                    .copyWith(fontWeight: FontWeight.w700),
              )
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, EditProfileScreen.routeName);
            },
            child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: xxTinierSpacing, vertical: tiniestSpacing),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColor.primary, width: kFeatureDivider),
                  borderRadius: BorderRadius.circular(kEditRadius),
                ),
                child: Text(
                  'EDIT',
                  style: Theme.of(context)
                      .textTheme
                      .xTinier
                      .copyWith(color: AppColor.primary),
                )),
          ),
        ],
      ),
      const SizedBox(height: xxSmallestSpacing),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.primaryLight,
          borderRadius: BorderRadius.circular(kGlobalBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: leftRightMargin, vertical: topBottomPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Phone number',
              style: Theme.of(context)
                  .textTheme
                  .xTinier
                  .copyWith(color: AppColor.grey, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: xxTiniestSpacing,
            ),
            Text('+91-99999-88888',
                style: Theme.of(context)
                    .textTheme
                    .xxTinier
                    .copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(
              height: xxxTinySpacing,
            ),
            Text(
              'Email ID',
              style: Theme.of(context)
                  .textTheme
                  .xTinier
                  .copyWith(color: AppColor.grey, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: xxTiniestSpacing,
            ),
            Text('johndoe@gmail.com',
                style: Theme.of(context)
                    .textTheme
                    .xxTinier
                    .copyWith(fontWeight: FontWeight.w600)),
          ]),
        ),
      )
    ]);
  }
}
