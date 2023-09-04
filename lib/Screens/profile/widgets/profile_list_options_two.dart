import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/profile/widgets/profile_list_widget.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_spacing.dart';

class ProfileOptionsListTwo extends StatelessWidget {
  const ProfileOptionsListTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const ProfileListWidget(
        title: 'About Us',
        description: 'Legal Information',
        icon: Icons.info,
      ),
      const Divider(
        height: 30,
      ),
      const ProfileListWidget(
        title: 'Terms and Conditions',
        description: 'Legal Information',
        icon: Icons.indeterminate_check_box,
      ),
      const Divider(
        height: 30,
      ),
      const ProfileListWidget(
        title: 'Privacy Policy',
        description: 'Legal Information',
        icon: Icons.privacy_tip,
      ),
      const Divider(
        height: 30,
      ),
      const ProfileListWidget(
        title: 'Sign Out',
        description: 'Sign out from account',
        icon: Icons.logout_rounded,
      ),
      const SizedBox(height: xxSmallerSpacing),
      Text(
        'App Version 1.8.0',
        style: Theme.of(context).textTheme.subHeadingMedium,
      ),
    ]);
  }
}
