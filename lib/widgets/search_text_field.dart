import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final Widget prefixicon;
  final TextEditingController textcontroller;
  final TextStyle? hintStyle;
  const SearchTextField(
      {super.key,
      required this.hintText,
      required this.prefixicon,
      required this.textcontroller,
      this.hintStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textcontroller,
          decoration: InputDecoration(
              prefixIconColor: AppColor.darkGrey,
              hintStyle: (hintStyle == null)
                  ? Theme.of(context)
                      .textTheme
                      .xxxTiny
                      .copyWith(color: AppColor.mediumBlack)
                  : hintStyle,
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
