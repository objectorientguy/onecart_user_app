import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class SellingPartnerSection extends StatelessWidget {
  const SellingPartnerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.primaryLighter,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(leftRightMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: xxxTinierSpacing),
                    child: Text(
                      'Sold By',
                      style: Theme.of(context).textTheme.subHeadingMedium,
                    ),
                  ),
                  const SizedBox(height: xxxTinierSpacing),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: kCircleAvatarRadius,
                            backgroundImage: AssetImage('assets/img.png'),
                          ),
                          const SizedBox(
                            width: xxxTinierSpacing,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('BRP Foods Agro Store',
                                  style:
                                      Theme.of(context).textTheme.headingSmall),
                              const SizedBox(
                                height: xxTiniestSpacing,
                              ),
                              Text(
                                '35-40 mins · Free Delivery',
                                style: Theme.of(context)
                                    .textTheme
                                    .subHeadingMedium,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          )
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColor.primary,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
