import 'package:onecart_user_app/data/models/authenticate_user/authenticate%20_user_model.dart';

import 'authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<AuthenticateUserModel> authenticateUser() async {
    return AuthenticateUserModel.fromJson({
      "status": 200,
      "message": "New user successfully Logged in for this company!",
      "data": {
        "customer_name": "Testing Cpmpany filter",
        "created_at": "2023-07-29T15:47:25.666864+05:30",
        "customer_id": "123AB",
        "customer_birthdate": null,
        "customer_contact": 12345670
      }
    });
  }
}
