import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/home/home_screen.dart';

import '../Screens/cart/cart_screen.dart';
import '../Screens/categories/category_item_screen.dart';
import '../Screens/category_list/category_list_screen.dart';
import '../Screens/item_details/item_details_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case CategoryItemScreen.routeName:
        return _createRoute(const CategoryItemScreen());
      case ItemDetailsScreen.routeName:
        return _createRoute(const ItemDetailsScreen());
      case CategoryListScreen.routeName:
        return _createRoute(const CategoryListScreen());
      case CartScreen.routeName:
        return _createRoute(const CartScreen());
      default:
        return _createRoute(const HomeScreen());
    }
  }

  static Route<dynamic> _createRoute(Widget view) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
              position: animation.drive(tween), child: child);
        });
  }
}
