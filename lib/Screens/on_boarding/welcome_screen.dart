import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/on_boarding/login_screen.dart';
import 'package:onecart_user_app/Screens/root/root_screen.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_dimensions.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LogInScreen()));
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: AppColor.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: xxxSmallerSpacing),
              Image.asset('assets/welcome.png'),
              const SizedBox(height: xxxTinierSpacing),
              Text('Welcome back!',
                  style: Theme.of(context).textTheme.headingMedium),
              const SizedBox(height: xxxTinierSpacing),
              Text('Are you ready for shopping today?',
                  style: Theme.of(context).textTheme.smallGrey),
              const SizedBox(height: xxxSmallestSpacing),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const RootScreen()));
                },
                style: ElevatedButton.styleFrom(
                    minimumSize:
                        const Size(double.maxFinite, kElevatedButtonHeight),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(kGeneralBorderRadius))),
                child: Text(
                  'Go shopping now',
                  style: Theme.of(context).textTheme.textButtonLarger,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
