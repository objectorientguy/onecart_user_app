import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class CouponSection extends StatelessWidget {
  const CouponSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(leftRightMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: tiniestSpacing),
                child: CircleAvatar(
                  radius: 17,
                  backgroundImage: AssetImage('assets/percentDiscount.png'),
                ),
              ),
              const SizedBox(
                width: xxxTinierSpacing,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PAYTMTREATS',
                      style: Theme.of(context).textTheme.textLarge),
                  const SizedBox(
                    height: xxTiniestSpacing,
                  ),
                  Text(
                    'Offer applied on the bill',
                    style: Theme.of(context).textTheme.subHeadingMedium,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColor.primary,
            size: 20,
          )
        ],
      ),
    );
  }
}
