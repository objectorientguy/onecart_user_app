import 'package:flutter/material.dart';
class OnboardingScreen7 extends StatelessWidget {
  const OnboardingScreen7({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/welcome.png')
        ],
      ),
    );
  }
}
