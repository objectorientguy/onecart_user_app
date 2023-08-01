import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen5.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import '../../configs/app_dimensions.dart';
class OnboardingScreen7 extends StatelessWidget {
  const OnboardingScreen7({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const OnboardingScreen5()));
        },
            icon: Icon(Icons.arrow_back_rounded,color: AppColor.black,)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              SizedBox(height: xxxSmallerSpacing),
              Image.asset('assets/welcome.png'),
              SizedBox(height: xxxTinierSpacing),
              Text('Welcome back!',style: Theme.of(context).textTheme.headingMedium),
              SizedBox(height: xxxTinierSpacing),
              Text('Are you ready for shopping today?',style: Theme.of(context).textTheme.smallGrey),
              SizedBox(height: xxxSmallestSpacing),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize:
                    const Size(double.maxFinite, kElevatedButtonHeight),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(kGeneralBorderRadius))),
                child: Text('Go shopping now',
                  style: Theme.of(context).textTheme.textButtonLarger,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
