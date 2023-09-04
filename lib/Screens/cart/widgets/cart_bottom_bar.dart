import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../common_widgets/custom_elevated_button.dart';
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
    return BottomAppBar(
      child: Padding(
          padding: const EdgeInsets.all(leftRightMargin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Subtotal',
                          style: Theme.of(context).textTheme.subHeadingLarge),
                      const SizedBox(height: xxxTinierSpacing),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('₹',
                              style: Theme.of(context)
                                  .textTheme
                                  .headingLarge
                                  .copyWith(fontWeight: FontWeight.w100)),
                          Text('2,199',
                              style: Theme.of(context).textTheme.headingLarge),
                          Text('.43',
                              style: Theme.of(context).textTheme.textLarge),
                          const SizedBox(
                            width: xxxTinierSpacing,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColor.grey,
                                ),
                                color: AppColor.primaryLight,
                                borderRadius: BorderRadius.circular(
                                    kGeneralBorderRadiusMedium)),
                            padding: const EdgeInsets.symmetric(
                                vertical: xxTiniestSpacing,
                                horizontal: xxTinierSpacing),
                            child: Center(
                              child: Text('3 ITEMS',
                                  style: Theme.of(context)
                                      .textTheme
                                      .textSmall
                                      .copyWith(
                                          color: AppColor.primary,
                                          fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: tinierSpacing),
              CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CheckoutScreen.routeName,
                        arguments: false);
                  },
                  buttonHeight: kElevatedButtonHeightSmall,
                  buttonWidth: double.maxFinite,
                  child: Text(
                    'PROCEED TO PAYMENT',
                    style: Theme.of(context).textTheme.textButtonLarger,
                  ))
            ],
          )),
    );
  }
}
