import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen2.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen5.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/onboard1.png'),
          SizedBox(height: xxxSmallestSpacing),
          Text(
            'Welcome to',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColor.mediumBlack, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 300,height: 110,
            child: const Text('Healthy mart grocery',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36)),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 280,height: 60,
                child: Text('Eat fresh fruits and vegetables and try to be healthy',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: AppColor.mediumBlack)),
              ),
            ],
          ),
          Text(
            '- - - -',
            textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 50,
              width: 320,
              child: ElevatedButton(
                  onPressed: () {Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) =>
                          const OnboardingScreen2()));},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColor.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: const Text('Next')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: 320,
              child: ElevatedButton(
                  onPressed: () {Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const OnboardingScreen5()));},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColor.lightGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: const Text('Skip',style: TextStyle(color: AppColor.black))
              ),
            ),
          )
        ],
      ),
    );
  }
}
