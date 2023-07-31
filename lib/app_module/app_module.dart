import 'package:get_it/get_it.dart';

import '../repositories/authentication/authentication_repository.dart';
import '../repositories/authentication/authentication_repository_impl.dart';

final getIt = GetIt.instance;

configurableDependencies() {
  getIt.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl());
}
