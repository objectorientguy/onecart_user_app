import 'package:flutter/material.dart';
import '../configs/app_dimensions.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final Function() onPressed;

  const CustomElevatedButton({Key? key, required this.child, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.maxFinite, kElevatedButtonHeight),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kGeneralBorderRadius))),
        child: child,
        );
  }
}
