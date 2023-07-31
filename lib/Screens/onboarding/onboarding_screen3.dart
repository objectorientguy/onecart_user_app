import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen4.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../configs/app_dimensions.dart';
import '../root/root_screen.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/onboard3.png'),
            SizedBox(height: xxxSmallestSpacing),
            Text('Peace of mind',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.xtextMedium),
            SizedBox(
              width: kHeadingWidthOnboarding,
              child: Text('Same day delivery guaranteed',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headingLargest),
            ),
            SizedBox(height: xxxSmallestSpacing),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: kHeadingWidthOnboarding,
                    child: Text(
                        'We deliver your orders to fast and your prefer time.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.textLarger),
                  ),
                ]),
            SizedBox(height: xxxSmallestSpacing),
            Text('- - - -', textAlign: TextAlign.center),
            SizedBox(height: xxxSmallestSpacing),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const OnboardingScreen4()));
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
            SizedBox(height: xxTinierSpacing),
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
