import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class PaymentDetailsSection extends StatelessWidget {
  const PaymentDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: leftRightMargin, vertical: topBottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pay Using', style: Theme.of(context).textTheme.subHeadingLarge),
          const SizedBox(
            height: tinierSpacing,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: xxxTinierSpacing, vertical: topBottomPadding),
            decoration: BoxDecoration(
                border: Border.all(color: AppColor.lightGrey),
                borderRadius: BorderRadius.circular(kGeneralBorderRadius)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: tiniestSpacing),
                      child: Container(
                        height: kSizedBoxHeightSmall,
                        width: kSizedBoxHeightSmall,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(kGeneralBorderRadius),
                            image: const DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage('assets/hdfc.png'))),
                      ),
                    ),
                    const SizedBox(
                      width: xxxTinierSpacing,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('HDFC Credit Card',
                            style: Theme.of(context).textTheme.headingSmallx),
                        const SizedBox(
                          height: xxTinySpacing,
                        ),
                        Text(
                          'Platinum  5241 XXXX XXXX 0321',
                          style: Theme.of(context).textTheme.subHeadingMedium,
                        ),
                        const SizedBox(
                          height: xxTinySpacing,
                        ),
                        Row(
                          children: [
                            Text('Available Limit',
                                style: Theme.of(context).textTheme.headingTiny),
                            const SizedBox(
                              width: xxxTinySpacing,
                            ),
                            Text('₹84,321',
                                style: Theme.of(context).textTheme.xtextMedium)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColor.primary,
                  size: xxxSmallerSpacing,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
