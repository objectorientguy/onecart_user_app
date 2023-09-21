import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../../common_widgets/custom_elevated_button.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../add_address_screen.dart';

class AddressBottomNavigationBar extends StatelessWidget {
  const AddressBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(xxxTinySpacing),
        child: CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddAddressScreen.routeName,
                  arguments: false);
            },
            buttonHeight: kElevatedButtonHeightSmall,
            buttonWidth: double.maxFinite,
            child: Text('Add New Address',
                style: Theme.of(context).textTheme.xxTiny.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.white))));
  }
}
