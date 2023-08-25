import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repositories/authentication/authentication_repository.dart';
import '../repositories/authentication/authentication_repository_impl.dart';
import '../repositories/product_list/product_ist_repository_impl.dart';
import '../repositories/product_list/product_list_repository.dart';
import '../repositories/categories/categories_repository.dart';
import '../repositories/categories/categories_repository_impl.dart';
import '../repositories/varient/varient_repository.dart';
import '../repositories/varient/varient_repository_impl.dart';
import '../utils/shared_preference.dart';

final getIt = GetIt.instance;

configurableDependencies() {
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl());
  getIt.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl());
  getIt.registerLazySingleton<CategoriesRepository>(
      () => CategoriesRepositoryImpl());
  getIt.registerLazySingleton<SelectVarientRepository>(
      () => SelectVarientRepositoryImpl());
  getIt.registerLazySingleton<CustomerCache>(
          () => CustomerCache(sharedPreferences: getIt<SharedPreferences>()));

}
