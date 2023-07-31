import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen2.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import '../../configs/app_dimensions.dart';
import '../root/root_screen.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/onboard1.png'),
            const SizedBox(height: xxxSmallestSpacing),
            Text('Welcome to',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.xtextMedium),
            SizedBox(
              width: kHeadingWidthOnboarding,
              child: Text('Healthy mart grocery',
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
                        'Eat fresh fruits and vegetables and try to be healthy',
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
                    builder: (context) => const OnboardingScreen2()));
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
