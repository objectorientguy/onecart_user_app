import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_color.dart';

import '../configs/app_dimensions.dart';

typedef TextFieldCallBack = Function(String textField);

class TextFieldWidget extends StatefulWidget {
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
  final TextStyle? hintStyle;
  final Color? fillColor;
  final bool? filled;

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
      this.hintStyle,
      this.fillColor,
      this.filled})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController textFieldController = TextEditingController();

  @override
  void initState() {
    textFieldController.text =
        (widget.getText.toString() == "null") ? "" : widget.getText.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          validator: widget.validator,
          readOnly: widget.readOnly!,
          controller: textFieldController,
          onChanged: (value) {
            widget.onTextFieldChanged(value);
          },
          textInputAction: widget.textInputAction,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          keyboardType: widget.textInputType,
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            filled: widget.filled,
            fillColor: widget.fillColor,
            hintStyle: widget.hintStyle,
            suffix: widget.suffix,
            counterText: "",
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(kGeneralBorderRadius)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kGeneralBorderRadius),
              borderSide: const BorderSide(color: AppColor.primary),
            ),
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
