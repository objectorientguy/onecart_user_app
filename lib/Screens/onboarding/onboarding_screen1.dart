import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image.asset('assets/onboard1.png'),
          ),
          Text(
            'Welcome to',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey.shade800, fontWeight: FontWeight.w500),
          ),
          Text('Healthy mart grocery',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38)),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text('Eat fresh fruits and vegetables and try to be healthy',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, color: Colors.grey.shade800)),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.green.shade500,
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: const Text('Skip',style: TextStyle(color: Colors.black))
              ),
            ),
          )
        ],
      ),
    );
  }
}
