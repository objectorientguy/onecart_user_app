import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../Screens/ratings/ratings_screen.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';

class ButtonWidget extends StatelessWidget {
  final double width;

  final String title;
  final bool showRatingScreen;
  final bool isToBePosted;
  final bool isFromCancel;

  const ButtonWidget(
      {super.key,
      required this.title,
      this.showRatingScreen = false,
      this.isToBePosted = false,
      this.isFromCancel = false,
      this.width = kHeight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: kImage,
      child: TextButton(
        onPressed: () {
          if (showRatingScreen == true) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddRatingsScreen()));
          } else if (isToBePosted == true) {
          } else if (isFromCancel == true) {
            Navigator.pop(context);
          }
        },
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(
              horizontal: tinierSpacing, vertical: tiniestSpacing),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kAddRadius)),
          backgroundColor: AppColor.primary,
        ),
        child: Text(title,
            style: Theme.of(context)
                .textTheme
                .xxxTinier
                .copyWith(color: AppColor.white)),
      ),
    );
  }
}
