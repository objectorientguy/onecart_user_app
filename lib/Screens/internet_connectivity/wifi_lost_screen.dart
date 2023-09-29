import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../common_widgets/button_widget.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';

class WifiLostScreen extends StatelessWidget {
  const WifiLostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: leftRightMargin, vertical: topBottomPadding),
            child: Center(
                child: Column(children: [
              const SizedBox(height: kEmptyBox),
              Image.asset('assets/wifi.png', height: kGeneralWidth),
              const SizedBox(
                height: smallerSpacing,
              ),
              Text(
                'Something went wrong !!',
                style: Theme.of(context).textTheme.xTinier.copyWith(
                    color: AppColor.mediumBlack, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: xxTinierSpacing,
              ),
              Text('Slow or no internet connection.',
                  style: Theme.of(context).textTheme.xTinier.copyWith()),
              Text('Please check your network settings.',
                  style: Theme.of(context).textTheme.xTinier.copyWith()),
              const SizedBox(height: xMediumSpacing),
              ButtonWidget(
                  title: 'Refresh',
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]))));
  }
}
