import 'package:flutter/material.dart';

import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final Widget suffixicon;
  final TextEditingController textcontroller;
  const SearchTextField(
      {super.key,
      required this.hintText,
      required this.suffixicon,
      required this.textcontroller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textcontroller,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: smallerSpacing, vertical: tiniestSpacing),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kGeneralBorderRadius),
                borderSide: const BorderSide(),
              ),
              suffixIcon: suffixicon),
        )
      ],
    );
  }
}
