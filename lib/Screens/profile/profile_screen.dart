import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/profile/widgets/profile_header.dart';
import 'package:onecart_user_app/Screens/profile/widgets/profile_list_options.dart';
import 'package:onecart_user_app/Screens/profile/widgets/profile_list_options_two.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';

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
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: leftRightMargin, vertical: topBottomPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileHeader(),
                        SizedBox(height: mediumSpacing),
                        ProfileOptionsList(),
                        SizedBox(height: tinierSpacing),
                      ]),
                ),
              ),
              const SizedBox(
                height: xxSmallerSpacing,
              ),
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
                        horizontal: leftRightMargin,
                        vertical: topBottomPadding),
                    child: ProfileOptionsListTwo()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
