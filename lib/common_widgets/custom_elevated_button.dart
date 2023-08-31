import 'package:flutter/material.dart';
import '../configs/app_dimensions.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;
  final double buttonWidth;
  final double buttonHeight;
  const CustomElevatedButton(
      {Key? key, required this.child, required this.onPressed, required this.buttonWidth, required this.buttonHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize:  Size(buttonWidth, buttonHeight),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kGeneralBorderRadius))),
      child: child,
    );
  }
}
// double.maxFinite, kElevatedButtonHeight