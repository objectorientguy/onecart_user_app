import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import '../configs/app_dimensions.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final double buttonWidth;
  final double buttonHeight;
  final ButtonStyle? style;
  final Color? backgroundColor;
  const CustomElevatedButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      required this.buttonWidth,
      required this.buttonHeight,
      this.style,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor:
              (backgroundColor == null) ? AppColor.primary : backgroundColor,
          minimumSize: Size(buttonWidth, buttonHeight),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kGeneralBorderRadius))),
      child: child,
    );
  }
}
// double.maxFinite, kElevatedButtonHeight
