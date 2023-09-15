import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/address/widget/current_location.dart';
import 'package:onecart_user_app/data/models/address_model/address_model.dart';
import 'package:onecart_user_app/data/models/home/home_model.dart';
import '../Screens/address/add_address_screen.dart';
import '../Screens/address/address_screen.dart';
import '../Screens/address/edit_address_screen.dart';
import '../Screens/cart/cart_screen.dart';
import '../Screens/categories/category_item_screen.dart';
import '../Screens/checkout/checkout_screen.dart';
import '../Screens/checkout/order_success.dart';
import '../Screens/favorites/no_favorites.dart';
import '../Screens/item_details/item_details_screen.dart';
import '../Screens/item_details/widgets/image_zoom_section.dart';
import '../Screens/orders/order_details_screen.dart';
import '../Screens/profile/edit_field_screen.dart';
import '../Screens/profile/edit_profie_screen.dart';
import '../Screens/profile/widgets/privacy_policy_screen.dart';
import '../Screens/profile/widgets/terms_and_conditions_screen.dart';
import '../Screens/root/root_screen.dart';
import '../Screens/varient/select_varient_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case CategoryItemScreen.routeName:
        return _createRoute(const CategoryItemScreen(
            //categoryDetails: settings.arguments as dynamic,
            ));
      case ItemDetailsScreen.routeName:
        return _createRoute(ItemDetailsScreen(
          itemDetails: settings.arguments as TodaySDeal,
        ));
      case CartScreen.routeName:
        return _createRoute(const CartScreen());
      case CheckoutScreen.routeName:
        return _createRoute(const CheckoutScreen());
      case SelectVariantScreen.routeName:
        return _createRoute(
            SelectVariantScreen(dataone: settings.arguments as TodaySDeal));
      case AddressScreen.routeName:
        return _createRoute(AddressScreen());

      case TermsOfServiceScreen.routeName:
        return _createRoute(const TermsOfServiceScreen());

      case PrivacyPolicyScreen.routeName:
        return _createRoute(const PrivacyPolicyScreen());

      case OrderSuccessScreen.routeName:
        return _createRoute(const OrderSuccessScreen());
      case NoFavoritesScreen.routeName:
        return _createRoute(const NoFavoritesScreen());
      case OrdersDetailsScreen.routeName:
        return _createRoute(const OrdersDetailsScreen());
      case ImageZoomSection.routeName:
        return _createRoute(ImageZoomSection(
            imageListOne: settings.arguments as List<dynamic>));

      case EditProfileScreen.routeName:
        return _createRoute(const EditProfileScreen());
      case EditFieldScreen.routeName:
        return _createRoute(
            EditFieldScreen(fieldData: settings.arguments as String));
      case EditAddressScreen.routeName:
        return _createRoute(EditAddressScreen(
          addressDataMap: settings.arguments as AddressDatum,
        ));
      case AddAddressScreen.routeName:
        return _createRoute(AddAddressScreen());
      case CurrentLocation.routeName:
        return _createRoute(const CurrentLocation());
      case RootScreen.routeName:
        return _createRoute(const RootScreen());
      default:
        return _createRoute(const RootScreen());
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
