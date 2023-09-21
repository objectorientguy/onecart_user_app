import 'package:flutter/cupertino.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class AddressEditButton extends StatelessWidget {
  const AddressEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: kBottomNavBarHeightX,
        decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(kAddRadius)),
        padding: const EdgeInsets.symmetric(
            vertical: tiniestSpacing, horizontal: xxTiniestSpacing),
        child: const Center(
          child: Text(
            'Edit',
            style: TextStyle(color: AppColor.white, fontSize: xxxTinySpacing),
          ),
        ));
  }
}
