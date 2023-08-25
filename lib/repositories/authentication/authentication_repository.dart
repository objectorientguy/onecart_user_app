import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<void> verifyPhoneNumber(
      {required String phoneNumber,
        required Function(PhoneAuthCredential) verificationCompleted,
        required Function(FirebaseAuthException) verificationFailed,
        required Function(String, int?) codeSent,
        required Function(String) codeAutoRetrievalTimeout});

  // Future<AuthenticateUser> authenticateUser(Map userDetailsMap);
}
