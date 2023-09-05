import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_color.dart';

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
            hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400 ,color: AppColor.grey),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: const BorderSide(color: AppColor.lighterGrey)
            ),
            prefixIcon: prefixicon,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              hintText: hintText,
              ),

        )
      ],
    );
  }
}
