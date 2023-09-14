import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class ProfileListWidget extends StatelessWidget {
  const ProfileListWidget(
      {Key? key, this.title = '', this.description = '', this.icon})
      : super(key: key);
  final String title;
  final String description;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: xxxTiniestSpacing),
              child: Icon(
                icon,
                color: AppColor.primary,
                size: kLocationIconSize,
              ),
            ),
            const SizedBox(
              width: xxTinierSpacing,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.xTinier.copyWith(
                      color: AppColor.mediumBlack, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: xxTiniestSpacing,
                ),
                SizedBox(
                  child: Text(
                    description,
                    style: Theme.of(context)
                        .textTheme
                        .xxTinier
                        .copyWith(color: AppColor.grey),
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
              size: kIconSizeSmall,
            ),
            SizedBox(
              width: xxxTinierSpacing,
            )
          ],
        )
      ],
    );
  }
}
