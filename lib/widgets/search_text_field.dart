import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final Widget prefixicon;
  final TextEditingController textcontroller;
  const SearchTextField(
      {super.key,
      required this.hintText,
      required this.prefixicon,
      required this.textcontroller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: textcontroller,
          decoration: InputDecoration(
            prefixIconColor: AppColor.darkGrey,
            hintStyle: Theme.of(context).textTheme.xxTinier,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kSearchBarBorderRadius),
                borderSide: const BorderSide(color: AppColor.lighterGrey)),
            prefixIcon: prefixicon,
            contentPadding:  EdgeInsets.symmetric(
                horizontal: smallerSpacing, vertical: tiniestSpacing),
            hintText: hintText,
          ),
        )
      ],
    );
  }
}
