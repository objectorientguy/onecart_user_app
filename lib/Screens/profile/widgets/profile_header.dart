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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Account',
            style: Theme.of(context)
                .textTheme
                .xxxTiny
                .copyWith(fontWeight: FontWeight.w700, color: AppColor.grey)),
        const SizedBox(height: xxSmallSpacing),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primary, width: 0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'EDIT',
                    style: TextStyle(color: AppColor.primary, fontSize: 14),
                  )),
            ),
          ],
        ),
        const SizedBox(height: xxSmallestSpacing),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColor.primaryLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: leftRightMargin, vertical: topBottomPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Phone number',
                    style: Theme.of(context).textTheme.tinier.copyWith(
                        fontWeight: FontWeight.w500, color: AppColor.grey)),
                const SizedBox(
                  height: xxTiniestSpacing,
                ),
                Text('+91-99999-88888',
                    style: Theme.of(context).textTheme.xxTiny.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.mediumBlack)),
                const SizedBox(
                  height: xxxTinySpacing,
                ),
                Text('Email ID',
                    style: Theme.of(context).textTheme.tinier.copyWith(
                        fontWeight: FontWeight.w500, color: AppColor.grey)),
                const SizedBox(
                  height: xxTiniestSpacing,
                ),
                Text('johndoe@gmail.com',
                    style: Theme.of(context).textTheme.xxTiny.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColor.mediumBlack)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
