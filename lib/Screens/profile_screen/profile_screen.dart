import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/profile_screen/widgets/profile_footer.dart';
import 'package:onecart_user_app/Screens/profile_screen/widgets/profile_header.dart';
import 'package:onecart_user_app/Screens/profile_screen/widgets/profile_list_options.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';

import '../../configs/app_dimensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration:
                  const BoxDecoration(color: AppColor.white, boxShadow: [
                BoxShadow(
                    blurStyle: BlurStyle.solid,
                    color: AppColor.lightGrey,
                    spreadRadius: kZero,
                    blurRadius: kShadowBlurRadius),
              ]),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: leftRightMargin, vertical: topBottomPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileHeader(),
                      SizedBox(height: mediumSpacing),
                      ProfileOptionsList(),
                    ]),
              ),
            ),
            const SizedBox(
              height: smallSpacing,
            ),
            const ProfileFooter()
          ],
        ),
      ),
    );
  }
}
