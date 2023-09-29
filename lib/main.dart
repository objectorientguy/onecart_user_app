import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onecart_user_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onecart_user_app/blocs/checkout_bloc/checkout_bloc.dart';
import 'package:onecart_user_app/blocs/onboarding_bloc/onboarding_bloc.dart';
import 'package:onecart_user_app/configs/app_route.dart';
import 'package:onecart_user_app/configs/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/shops/shops_screen.dart';
import 'app_module/app_module.dart';
import 'blocs/add_cart_item_bloc/add_cart_item_bloc.dart';
import 'blocs/address_bloc/address_bloc.dart';
import 'blocs/get_product_bloc/get_product_bloc.dart';
import 'blocs/categories_bloc/categories_bloc.dart';
import 'blocs/home/home_bloc.dart';
import 'blocs/onboarding_bloc/onboarding_events.dart';
import 'blocs/orders/orders_bloc.dart';

import 'blocs/ratings_bloc/ratings_bloc.dart';
import 'blocs/search_product_bloc/search_product_bloc.dart';
import 'blocs/item_details_bloc/item_details_bloc.dart';
import 'blocs/view_cart_bloc/view_cart_bloc.dart';
import 'blocs/wifiConnectivity/wifi_connectivity_bloc.dart';
import 'blocs/wifiConnectivity/wifi_connectivity_events.dart';
import 'blocs/wifiConnectivity/wifi_connectivity_states.dart';
import 'blocs/wishlist_bloc/wishlist_bloc.dart';

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
        BlocProvider(
            lazy: false,
            create: (context) => WifiConnectivityBloc()..add(ObserveNetwork())),
        BlocProvider(lazy: false, create: (context) => AuthenticationBloc()),
        BlocProvider(lazy: false, create: (context) => AddressBloc()),
        BlocProvider(lazy: false, create: (context) => GetProductBloc()),
        BlocProvider(lazy: false, create: (context) => GetAllCategoriesBloc()),
        BlocProvider(lazy: false, create: (context) => GetProductBloc()),
        BlocProvider(lazy: false, create: (context) => GetAllCategoriesBloc()),
        BlocProvider(lazy: false, create: (context) => ItemDetailsBloc()),
        BlocProvider(lazy: false, create: (context) => GetAllOrdersBloc()),
        BlocProvider(lazy: false, create: (context) => GetAllCartItemsBloc()),
        BlocProvider(lazy: false, create: (context) => CheckoutBloc()),
        BlocProvider(lazy: false, create: (context) => SearchProductsBloc()),
        BlocProvider(lazy: false, create: (context) => AddToCartBloc()),
        BlocProvider(lazy: false, create: (context) => RatingsBloc()),
        BlocProvider(lazy: false, create: (context) => WishlistBloc()),
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
          home: BlocBuilder<WifiConnectivityBloc, WifiConnectivityState>(
              builder: (context, state) {
            return const SelectShops();
          }),
        ),
      ),
    );
  }
}
