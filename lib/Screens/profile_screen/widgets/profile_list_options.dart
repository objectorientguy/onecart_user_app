import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on,
                    color: AppColor.primary,
                    size: kLocationIconSize,
                  ),
                  const SizedBox(
                    width: xxTinierSpacing,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Address',
                          style: Theme.of(context).textTheme.headingSmall),
                      const SizedBox(
                        height: xxTiniestSpacing,
                      ),
                      SizedBox(
                        child: Text(
                          'Manage and Add new Addresses',
                          style: Theme.of(context).textTheme.subHeadingMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.arrow_forward_ios),
                  SizedBox(
                    width: xxxTinierSpacing,
                  )
                ],
              )
            ],
          ),
        ),
        const Divider(height: 40, thickness: 0.3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.favorite,
                  color: AppColor.primary,
                  size: kLocationIconSize,
                ),
                const SizedBox(
                  width: xxTinierSpacing,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Favorite items',
                        style: Theme.of(context).textTheme.headingSmall),
                    const SizedBox(
                      height: xxTiniestSpacing,
                    ),
                    SizedBox(
                      child: Text(
                        'All your handpicked items at one place',
                        style: Theme.of(context).textTheme.subHeadingMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
            const Row(
              children: [
                Icon(Icons.arrow_forward_ios),
                SizedBox(
                  width: xxxTinierSpacing,
                )
              ],
            )
          ],
        ),
        const Divider(height: 40, thickness: 0.3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.help,
                  color: AppColor.primary,
                  size: kLocationIconSize,
                ),
                const SizedBox(
                  width: xxTinierSpacing,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Help',
                        style: Theme.of(context).textTheme.headingSmall),
                    const SizedBox(
                      height: xxTiniestSpacing,
                    ),
                    SizedBox(
                      child: Text(
                        'Find answers to all your queries here',
                        style: Theme.of(context).textTheme.subHeadingMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
            const Row(
              children: [
                Icon(Icons.arrow_forward_ios),
                SizedBox(
                  width: xxxTinierSpacing,
                )
              ],
            )
          ],
        ),
        const Divider(height: 40, thickness: 0.3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.settings,
                  color: AppColor.primary,
                  size: kLocationIconSize,
                ),
                const SizedBox(
                  width: xxTinierSpacing,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Setiings',
                        style: Theme.of(context).textTheme.headingSmall),
                    const SizedBox(
                      height: xxTiniestSpacing,
                    ),
                    SizedBox(
                      child: Text(
                        'Manage notifications and permissions',
                        style: Theme.of(context).textTheme.subHeadingMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
              ],
            ),
            const Row(
              children: [
                Icon(Icons.arrow_forward_ios),
                SizedBox(
                  width: xxxTinierSpacing,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
