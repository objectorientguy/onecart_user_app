import 'package:get_it/get_it.dart';
import 'package:onecart_user_app/repositories/search_products/search_products_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/add_cart_item/add_cart_item_repository.dart';
import '../repositories/add_cart_item/add_cart_item_repository_impl.dart';
import '../repositories/address_repo/address_repository.dart';
import '../repositories/address_repo/address_repository_impl.dart';
import '../repositories/authentication/authentication_repository.dart';
import '../repositories/authentication/authentication_repository_impl.dart';
import '../repositories/checkout_repo/checkout_repository.dart';
import '../repositories/checkout_repo/checkout_repository_impl.dart';
import '../repositories/home/home_repository.dart';
import '../repositories/home/home_repository_impl.dart';
import '../repositories/item_details/item_details_repository.dart';
import '../repositories/item_details/item_details_repository_impl.dart';
import '../repositories/orders/orders_repository.dart';
import '../repositories/orders/orders_repository_impl.dart';
import '../repositories/product_list/product_ist_repository_impl.dart';
import '../repositories/product_list/product_list_repository.dart';
import '../repositories/categories/categories_repository.dart';
import '../repositories/categories/categories_repository_impl.dart';

import '../repositories/ratings/ratings_repository.dart';
import '../repositories/ratings/ratings_repository_impl.dart';
import '../repositories/search_products/search_products_repository.dart';
import '../repositories/view_cart/view_cart_repository.dart';
import '../repositories/view_cart/view_cart_repository_impl.dart';
import '../repositories/wishlist/wishlist_repository.dart';
import '../repositories/wishlist/wishlist_repository_impl.dart';
import '../utils/shared_pref.dart';

final getIt = GetIt.instance;

configurableDependencies() {
  getIt.registerLazySingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl());
  getIt.registerLazySingleton<AddressRepository>(() => AddressRepositoryImpl());
  getIt.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl());
  getIt.registerLazySingleton<ViewWishlistRepository>(
      () => ViewWishlistRepositoryImpl());

  getIt.registerLazySingleton<ViewRatingsRepository>(
      () => ViewRatingsRepositoryImpl());

  getIt.registerLazySingleton<ProductDetailsRepository>(
      () => ProductDetailsRepositoryImpl());
  getIt.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl());

  getIt.registerLazySingleton<ViewCartRepository>(
      () => ViewCartRepositoryImpl());
  getIt.registerLazySingleton<SearchProductsRepository>(
      () => SearchProductsRepositoryImpl());

  getIt.registerLazySingleton<AddToCartRepository>(
      () => AddToCartRepositoryImpl());

  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  getIt.registerLazySingleton<CustomerCache>(
      () => CustomerCache(sharedPreferences: getIt<SharedPreferences>()));
  getIt.registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImpl());
  getIt.registerLazySingleton<CheckoutRepository>(
      () => CheckoutRepositoryImpl());
}
