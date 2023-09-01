import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/profile/widgets/profile_header.dart';
import 'package:onecart_user_app/Screens/profile/widgets/profile_list_options.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_dimensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: leftRightMargin, vertical: topBottomPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ProfileHeader(),
                        const SizedBox(height: mediumSpacing),
                        const ProfileOptionsList(),
                        const SizedBox(height: xxxLargerSpacing),
                        Text('App Version 1.8.0',
                            style:
                                Theme.of(context).textTheme.subHeadingMedium),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
