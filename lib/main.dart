import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onecart_user_app/blocs/checkout_bloc/checkout_bloc.dart';
import 'package:onecart_user_app/blocs/onboarding_bloc/onboarding_bloc.dart';
import 'package:onecart_user_app/blocs/onboarding_bloc/onboarding_states.dart';
import 'package:onecart_user_app/configs/app_route.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/on_boarding/on_boarding_screen.dart';
import 'Screens/root/root_screen.dart';
import 'app_module/app_module.dart';
import 'blocs/address_bloc/address_bloc.dart';
import 'blocs/get_product_bloc/get_product_bloc.dart';
import 'blocs/categories_bloc/categories_bloc.dart';
import 'blocs/home/home_bloc.dart';
import 'blocs/onboarding_bloc/onboarding_events.dart';
import 'blocs/orders/orders_bloc.dart';

import 'blocs/search_product_bloc/search_product_bloc.dart';
import 'blocs/varient_bloc/varient_bloc.dart';
import 'blocs/item_details_bloc/item_details_bloc.dart';
import 'blocs/view_cart_bloc/view_cart_bloc.dart';

Future<void> main() async {
  await _initApp();
  await _initDependencies();
  runApp(const MyApp());
}

_initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

_initDependencies() async {
  configurableDependencies();
  await getIt.isReady<SharedPreferences>();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: false, create: (context) => AuthenticationBloc()),
        BlocProvider(lazy: false, create: (context) => AddressBloc()),
        BlocProvider(lazy: false, create: (context) => GetProductBloc()),
        BlocProvider(lazy: false, create: (context) => GetAllCategoriesBloc()),
        BlocProvider(lazy: false, create: (context) => SelectVarientBloc()),
        BlocProvider(lazy: false, create: (context) => GetProductBloc()),
        BlocProvider(lazy: false, create: (context) => GetAllCategoriesBloc()),
        BlocProvider(lazy: false, create: (context) => ItemDetailsBloc()),
        BlocProvider(lazy: false, create: (context) => GetAllOrdersBloc()),
        BlocProvider(lazy: false, create: (context) => GetAllCartItemsBloc()),
        BlocProvider(lazy: false, create: (context) => CheckoutBloc()),
        BlocProvider(lazy: false, create: (context) => SearchProductsBloc()),
        BlocProvider(
            lazy: false,
            create: (context) => OnBoardingBloc()..add(CheckLoggedIn())),
        BlocProvider(lazy: false, create: (context) => GetHomeDetailsBloc()),
      ],
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: BlocBuilder<OnBoardingBloc, OnBoardingStates>(
              builder: (context, state) {
            if (state is LoggedIn) {
              log('loggedIn ===========>');
              return const RootScreen();
            } else {
              return const OnBoardingScreen();
            }
          }),
        ),
      ),
    );
  }
}
