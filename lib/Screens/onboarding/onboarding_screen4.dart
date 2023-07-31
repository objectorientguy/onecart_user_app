import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../configs/app_dimensions.dart';
import '../root/root_screen.dart';

class OnboardingScreen4 extends StatelessWidget {
  const OnboardingScreen4({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/onboard4.png'),
            const SizedBox(height: xxxSmallestSpacing),
            Text('Big saving',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.xtextMedium),
            SizedBox(
              width: kHeadingWidthOnboarding,
              child: Text('With seasonal discounts',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headingLargest),
            ),
            const SizedBox(height: xxxSmallestSpacing),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: kHeadingWidthOnboarding,
                    child: Text(
                        'We provide the best prices for our customers.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.textLarger),
                  ),
                ]),
            const SizedBox(height: xxxSmallestSpacing),
            const Text('- - - -', textAlign: TextAlign.center),
            const SizedBox(height: xxxSmallestSpacing),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context,
                    RootScreen.routeName,
                        (Route<dynamic> route) => false,
                    arguments: false);
              },
              style: ElevatedButton.styleFrom(
                  minimumSize:
                      const Size(double.maxFinite, kElevatedButtonHeight),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(kGeneralBorderRadius))),
              child: Text(
                'Next',
                style: Theme.of(context).textTheme.textButtonLarger,
              ),
            ),
            const SizedBox(height: xxTinierSpacing),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RootScreen.routeName,
                    arguments: false);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.lightGrey,
                  minimumSize:
                      const Size(double.maxFinite, kElevatedButtonHeight),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(kGeneralBorderRadius))),
              child: Text(
                'Skip',
                style: Theme.of(context)
                    .textTheme
                    .textButtonLarger
                    .copyWith(color: AppColor.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
