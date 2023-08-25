import 'package:firebase_auth/firebase_auth.dart';
import 'authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {

  @override
  Future verifyPhoneNumber({required String phoneNumber,
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (error) {
      rethrow;
    }
  }
// Future<AuthenticateUser> authenticateUser(Map userDetailsMap) async {
//   try {
//     final response = await apiProvider.post(
//         StringConstants.baseUrl + StringConstants.kAuthenticateUser,
//         userDetailsMap);
//     return AuthenticateUser.fromJson(response);
//   } catch (error) {
//     rethrow;
//   }
// }
}
