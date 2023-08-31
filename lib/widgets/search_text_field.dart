import 'package:flutter/material.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: TextField(
            controller: textcontroller,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(),
                ),
                suffixIcon: suffixicon),
          ),
        )
      ],
    );
  }
}
