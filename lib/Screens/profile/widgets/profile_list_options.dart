import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/profile/widgets/profile_list_widget.dart';
import 'package:onecart_user_app/Screens/wishlist/wishlist_screen.dart';

import '../../../configs/app_dimensions.dart';
import '../../address/address_screen.dart';

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              AddressScreen.routeName,
            );
          },
          child: const ProfileListWidget(
            title: 'Address',
            description: 'Manage and add new Address',
            icon: Icons.location_on,
          ),
        ),
        const Divider(
          height: kDivider,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const WishlistScreen()));
          },
          child: const ProfileListWidget(
            title: 'Wishlist',
            description: 'All your handpicked items at one place',
            icon: Icons.favorite,
          ),
        ),
        const Divider(height: kDivider, thickness: kFeatureDivider),
        const ProfileListWidget(
          title: 'Help',
          description: 'Find answers to all your queries here',
          icon: Icons.help,
        ),
        const Divider(height: kDivider, thickness: kFeatureDivider),
        const ProfileListWidget(
          title: 'Settings',
          description: 'Manage notifications and permissions',
          icon: Icons.settings,
        ),
      ],
    );
  }
}
