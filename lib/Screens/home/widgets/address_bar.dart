import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimentions.dart';
import '../../../configs/app_spacing.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.location_on,
          color: AppColor.primary,
          size: kLocationIconSize,
        ),
        const SizedBox(
          width: xxTiniestSpacing,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Home', style: Theme.of(context).textTheme.headingTiny),
                const SizedBox(
                  width: xxxTiniestSpacing,
                ),
                const Center(
                    heightFactor: kLocationIconHeightFactor,
                    child: Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: AppColor.primary,
                      size: kLocationIconSize,
                    ))
              ],
            ),
            const SizedBox(
              height: xxTiniestSpacing,
            ),
            SizedBox(
              width: 300,
              child: Text(
                'Address - aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                style: Theme.of(context).textTheme.subHeadingMedium,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        )
      ],
    );
  }
}
