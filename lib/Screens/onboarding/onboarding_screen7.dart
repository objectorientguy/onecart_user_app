import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen5.dart';
import 'package:onecart_user_app/configs/app_color.dart';
import 'package:onecart_user_app/configs/app_spacing.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: leftRightMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            Image.asset('assets/welcome.png'),
            Text('Welcome back!',style: Theme.of(context).textTheme.headingMedium),
            SizedBox(height: xxxTinierSpacing),
            Text('Are you ready for shopping today?',style: Theme.of(context).textTheme.smallGrey),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 50,
                width: 320,
                child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                    child: const Text('Go shopping now!')
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
