import 'package:flutter/material.dart';
import '../../../common_widgets/custom_elevated_button.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class OrderDetailsBottomAppBar extends StatelessWidget {
  const OrderDetailsBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        elevation: kZero,
        child: Padding(
          padding: const EdgeInsets.all(xxTinySpacing),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: TextButton(
                        onPressed: () {},
                        child: const Text('Get invoice',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: AppColor.mediumBlack)))),
                CustomElevatedButton(
                    onPressed: () {},
                    buttonHeight: kElevatedButtonHeightSmall,
                    buttonWidth: double.maxFinite,
                    child: const Text('Reorder'))
              ]),
        ));
  }
}
