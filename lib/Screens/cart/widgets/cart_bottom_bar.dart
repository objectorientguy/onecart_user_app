import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../checkout/checkout_screen.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 140,
        decoration: const BoxDecoration(color: AppColor.white, boxShadow: [
          BoxShadow(
              blurStyle: BlurStyle.solid,
              color: AppColor.lightGrey,
              spreadRadius: kZero,
              blurRadius: kShadowBlurRadius),
        ]),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(leftRightMargin, leftRightMargin,
                leftRightMargin, leftRightMargin),
            child: Column(
              children: [
                Row(
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
                          width: xxTiniestSpacing,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Home',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headingTiny),
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
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Text(
                                'Akshya Nagar 1st Block 1st Cross, Ramamurthy Nagar, Nagpur-440009',
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
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 7),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1.0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'CHANGE',
                          style:
                              TextStyle(color: AppColor.primary, fontSize: 14),
                        )),
                  ],
                ),
                const SizedBox(height: tinierSpacing),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CheckoutScreen.routeName,
                          arguments: false);
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width - 300,
                            vertical: xxTinierSpacing),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: Text(
                      'PROCEED TO PAYMENT',
                      style: Theme.of(context).textTheme.textButtonLarger,
                    ))
              ],
            )));
  }
}
