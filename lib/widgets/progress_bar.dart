import 'package:flutter/material.dart';

import '../configs/app_color.dart';

class ProgressBar {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (context) {
        return Center(
            child: SizedBox(
          height: MediaQuery.of(context).size.width * 0.07,
          width: MediaQuery.of(context).size.width * 0.07,
          child: const CircularProgressIndicator(
            color: AppColor.primary,
          ),
        ));
      },
    );
  }

  static Widget showLoadingWidget(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
      ),
    );
  }

  static void dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }
}
