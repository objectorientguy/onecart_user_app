import 'package:get_it/get_it.dart';

import '../repositories/authentication/authentication_repository.dart';
import '../repositories/authentication/authentication_repository_impl.dart';
import '../repositories/product_list/product_ist_repository_impl.dart';
import '../repositories/product_list/product_list_repository.dart';

final getIt = GetIt.instance;

configurableDependencies() {
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl());
  getIt.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl());
}
