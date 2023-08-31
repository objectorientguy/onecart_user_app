import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget suffixicon;
  final TextEditingController textcontroller;
   const CustomTextField({super.key, required this.hintText, required this.suffixicon, required this.textcontroller});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(

            controller: textcontroller,
            decoration: InputDecoration(
            contentPadding:
            const EdgeInsets.only(left: 30, top: 4),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(),
        ),
            suffixIcon: suffixicon),

        )
      ],
    );
  }
}
