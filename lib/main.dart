import 'package:flutter/material.dart';
import 'package:onecart_user_app/configs/app_route.dart';
import 'package:onecart_user_app/configs/app_theme.dart';

import 'Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        title: 'OneCart',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        home: const HomeScreen(),
      ),
    );
  }
}
