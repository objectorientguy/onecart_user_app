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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: leftRightMargin, vertical: topBottomPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.info,
                                  color: AppColor.primary,
                                  size: kLocationIconSize,
                                ),
                                const SizedBox(
                                  width: xxTinierSpacing,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('About Us',
                                        style: Theme.of(context)
                                            .textTheme
                                            .textLarge
                                            .copyWith(
                                                fontWeight: FontWeight.w700)),
                                    const SizedBox(
                                      height: xxTiniestSpacing,
                                    ),
                                    SizedBox(
                                      child: Text(
                                        'Legal Information',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subHeadingMedium,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: xxxTinierSpacing,
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: xxSmallerSpacing),
                        Text(
                          'App Version 1.8.0',
                          style: Theme.of(context).textTheme.subHeadingMedium,
                        ),
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
