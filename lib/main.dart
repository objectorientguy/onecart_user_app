import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onecart_user_app/configs/app_route.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'Screens/on_boarding/on_boarding_screen.dart';
import 'app_module/app_module.dart';
import 'blocs/get_product_bloc/get_product_bloc.dart';
import 'blocs/categories_bloc/categories_bloc.dart';
import 'blocs/varient_bloc/varient_bloc.dart';
import 'package:firebase_core/firebase_core.dart';


Future main() async{
  _initDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      providers: [
        BlocProvider(lazy: false, create: (context) => AuthenticationBloc()),
        BlocProvider(lazy: false, create: (context) => GetProductBloc()),
        BlocProvider(lazy: false, create: (context) => GetAllCategoriesBloc()),
        BlocProvider(lazy: false, create: (context) => SelectVarientBloc()),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const OnBoardingScreen(),
        ),
      ),
    );
  }
}
