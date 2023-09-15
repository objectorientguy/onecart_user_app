import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_color.dart';

import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

typedef TextFieldCallBack = Function(String textField);

class TextFieldWidget extends StatelessWidget {
  final int? maxLines;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final TextInputType? textInputType;
  final String? hintText;
  final String? getText;
  final bool? firstCall;
  final TextFieldCallBack onTextFieldChanged;
  final bool? readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final String? initialValue;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;

  const TextFieldWidget(
      {Key? key,
      this.maxLines,
      this.textInputAction,
      this.maxLength,
      this.textInputType,
      this.hintText,
      this.getText,
      this.firstCall,
      required this.onTextFieldChanged,
      this.readOnly = false,
      this.controller,
      this.validator,
      this.suffix,
      this.initialValue,
      this.keyboardType,
      this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: validator,
          readOnly: readOnly!,
          controller: controller,
          initialValue: initialValue,
          onChanged: (value) {
            onTextFieldChanged(value);
          },
          textInputAction: textInputAction,
          maxLines: maxLines,
          maxLength: maxLength,
          keyboardType: keyboardType,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: tinierSpacing, vertical: tinierSpacing),
            isDense: true,
            suffix: suffix,
            counterText: "",
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColor.primary),
                borderRadius: BorderRadius.circular(smallCardCurve)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kArrowIconSize),
              borderSide: const BorderSide(color: AppColor.primary),
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
