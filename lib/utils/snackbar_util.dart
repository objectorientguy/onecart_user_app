import 'package:flutter/material.dart';

import '../configs/app_dimensions.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCustomSnackBar(
    BuildContext context, String? text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(seconds: 1),
      elevation: 100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kZero)),
      content: Text(
        text!,
        style: const TextStyle(color: Colors.white),
      )));
}
