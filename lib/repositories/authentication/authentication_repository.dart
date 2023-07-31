import '../../data/models/authenticate_user/authenticate _user_model.dart';

abstract class AuthenticationRepository {
  Future<AuthenticateUserModel> authenticateUser();
}
