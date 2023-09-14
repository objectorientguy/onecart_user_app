import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController textcontroller;
  final TextStyle? hintStyle;
  const CustomTextField ({super.key,
  required this.textcontroller,
  this.hintStyle});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        TextField(
          controller: textcontroller,
          decoration: InputDecoration(
              hintStyle: Theme.of(context)
                  .textTheme
                  .xxxTiny
                  .copyWith(color: AppColor.mediumBlack),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kSearchBarBorderRadius),
                  borderSide: const BorderSide(color: AppColor.lighterGrey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(kSearchBarBorderRadius),
                  borderSide: const BorderSide(color: AppColor.primary)),
              prefixIcon: prefixicon,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: smallerSpacing, vertical: tiniestSpacing),
              hintText: hintText,
              fillColor: AppColor.white,
              filled: true),
        )
      ],
    );
  }
}
