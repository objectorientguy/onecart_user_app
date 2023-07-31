import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen3.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../configs/app_dimensions.dart';
import '../root/root_screen.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/onboard2.png'),
            const SizedBox(height: xxxSmallestSpacing),
            Text('We provide',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.xtextMedium),
            SizedBox(
              width: kHeadingWidthOnboarding,
              child: Text('The best quality grocery to you',
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
                        'Healthy mart store where we deliver everything on time.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.textLarger),
                  ),
                ]),
            const SizedBox(height: xxxSmallestSpacing),
            const Text('- - - -', textAlign: TextAlign.center),
            const SizedBox(height: xxxSmallestSpacing),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const OnboardingScreen3()));
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
