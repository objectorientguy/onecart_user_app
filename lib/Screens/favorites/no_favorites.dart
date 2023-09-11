import 'package:flutter/material.dart';
import 'package:onecart_user_app/common_widgets/custom_elevated_button.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';

class NoFavoritesScreen extends StatelessWidget {
  static const routeName = 'NoFavoritesScreen';
  const NoFavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: leftRightMargin, vertical: topBottomPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: kSuccessImageHeight,
                child: Image.asset(
                  'assets/sorry.png',
                  fit: BoxFit.fitHeight,
                )),
            const SizedBox(height: tinySpacing),
            Text('Sorry',
                style: Theme.of(context)
                    .textTheme
                    .xxMedium
                    .copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(
              height: xxTinySpacing,
            ),
            SizedBox(
                width: kSuccessDescriptionWidth,
                child: Text(
                  'Your Favorites List is empty, Try to Explore New Items',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .xxTiny
                      .copyWith(color: AppColor.grey),
                )),
            const SizedBox(
              height: smallerSpacing,
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              buttonHeight: 50,
              buttonWidth: 200,
              child: Text(
                'GO BACK',
                style: Theme.of(context).textTheme.xxTiny.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
