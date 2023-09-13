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
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Icon(
                      Icons.location_on,
                      size: smallerSpacing,
                      color: AppColor.primary,
                    ),
                    const SizedBox(width: tiniestSpacing),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Office',
                            style: Theme.of(context)
                                .textTheme
                                .tinier
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: xxTiniestSpacing,
                          ),
                          SizedBox(
                            width: kSizedBoxInfinite,
                            child: Text(
                              'Akshya Nagar 1 st Block 1 st Cross',
                              style: Theme.of(context)
                                  .textTheme
                                  .xxxTinier
                                  .copyWith(color: AppColor.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ])
                  ]),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.primary,
                        ),
                        borderRadius: BorderRadius.circular(kBigRadius)),
                    padding: const EdgeInsets.symmetric(
                        vertical: xxTiniestSpacing,
                        horizontal: xxTinierSpacing),
                    child: Center(
                      child: Text('CHANGE',
                          style: Theme.of(context).textTheme.tinier.copyWith(
                              color: AppColor.primary,
                              fontWeight: FontWeight.w500)),
                    ),
                  )
                ]),
            const SizedBox(height: tinierSpacing),
            CustomElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, CheckoutScreen.routeName,
                      arguments: false);
                },
                buttonHeight: kElevatedButtonHeightSmall,
                buttonWidth: double.maxFinite,
                child: Text(
                  'PAY AND CHECKOUT',
                  style: Theme.of(context).textTheme.xxTiny.copyWith(
                      fontWeight: FontWeight.w600, color: AppColor.white),
                ))
          ])),
    );
  }
}
