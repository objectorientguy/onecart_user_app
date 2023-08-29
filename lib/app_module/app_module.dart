import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/address_repo/address_repository.dart';
import '../repositories/address_repo/address_repository_impl.dart';
import '../repositories/authentication/authentication_repository.dart';
import '../repositories/authentication/authentication_repository_impl.dart';
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
import '../repositories/search_products/search_products_repository.dart';
import '../repositories/search_products/search_products_repository_impl.dart';
import '../repositories/varient/varient_repository.dart';
import '../repositories/varient/varient_repository_impl.dart';
import '../repositories/view_cart/view_cart_repository.dart';
import '../repositories/view_cart/view_cart_repository_impl.dart';
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
  getIt.registerLazySingleton<ItemDetailsRepository>(
      () => ItemDetailsRepositoryImpl());
  getIt.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl());
  getIt.registerLazySingleton<SelectVarientRepository>(
      () => SelectVarientRepositoryImpl());

  getIt.registerLazySingleton<ViewCartRepository>(
      () => ViewCartRepositoryImpl());

  getIt.registerLazySingleton<SearchProductsRepository>(
          () => SearchProductsRepositoryImpl());

  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());

  getIt.registerLazySingleton<CustomerCache>(
      () => CustomerCache(sharedPreferences: getIt<SharedPreferences>()));

  getIt.registerLazySingleton<OrdersRepository>(() => OrdersRepositoryImpl());
}
