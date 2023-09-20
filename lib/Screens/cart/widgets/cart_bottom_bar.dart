import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../common_widgets/custom_elevated_button.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../address/widget/address_bar.dart';
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
            const AddressBar(),
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
