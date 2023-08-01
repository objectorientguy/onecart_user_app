import '../../data/models/authenticate_user/authenticate_user_model.dart';

abstract class AuthenticationRepository {
  Future<AuthenticateUserModel> authenticateUser();
}
