import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCustomSnackBar(
    BuildContext context, String? text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(seconds: 1),
      elevation: 100,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft:
                  Radius.circular(MediaQuery.of(context).size.width * 0.01),
              topRight:
                  Radius.circular(MediaQuery.of(context).size.width * 0.01),
              bottomLeft:
                  Radius.circular(MediaQuery.of(context).size.width * 0.0),
              bottomRight:
                  Radius.circular(MediaQuery.of(context).size.width * 0.0))),
      content: Text(
        text!,
        style: const TextStyle(color: Colors.white),
      )));
}
