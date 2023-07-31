import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/Screens/onboarding/onboarding_screen1.dart';
import 'package:onecart_user_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onecart_user_app/configs/app_route.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'app_module/app_module.dart';


void main() {
  _initDependencies();
  runApp(const MyApp());
}

_initDependencies() async {
  configurableDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(lazy:false, create: (context) => AuthenticationBloc())],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const OnboardingScreen1(),
        ),
      ),
    );
  }
}
