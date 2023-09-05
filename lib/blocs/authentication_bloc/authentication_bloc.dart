import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication_events.dart';
import 'authentication_states.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationStates> {
  // static String verify="";
  FirebaseAuth auth = FirebaseAuth.instance;
  AuthenticationStates get initialState => LoginLoaded();
  AuthenticationBloc() : super(LoginLoaded()) {
    on<LoadSignUpScreen>(_loadSignUpScreen);
    on<LoadLoginScreen>(_loadLoginScreen);
    on<GetOtp>(_getOtp);
    on<OtpReceivedOnPhone>(_otpReceivedOnPhone);
    on<VerifyOtp>(_onVerifyOtp);
    on<OtpVerificationError>(_onOtpVerificationError);
  }

  _loadLoginScreen(
      LoadLoginScreen event, Emitter<AuthenticationStates> emit) async {
    emit(LoginLoaded());
  }

  _loadSignUpScreen(
      LoadSignUpScreen event, Emitter<AuthenticationStates> emit) async {
    emit(SignUpLoaded());
  }

  _otpReceivedOnPhone(
      OtpReceivedOnPhone event, Emitter<AuthenticationStates> emit) async {
    emit(OtpReceived(
        verificationId: event.verificationId));
  }


  FutureOr<void> _getOtp(
      GetOtp event, Emitter<AuthenticationStates> emit) async {
    emit(OtpLoading());
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: event.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
         add(OtpReceivedOnPhone(
           verificationId: verificationId,
                   ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  FutureOr<void> _onVerifyOtp(
      VerifyOtp event, Emitter<AuthenticationStates> emit) async {
    try {
      emit(OtpLoading());
      // PhoneAuthCredential credential=PhoneAuthProvider.credential(verificationId:verify, smsCode: event.otpCode);
      // await auth.signInWithCredential(credential);
      // PhoneAuthCredential credential = PhoneAuthProvider.credential(
      //   verificationId: event.verificationId,
      //   smsCode: event.otpCode,
      // );
      emit(PhoneOtpVerified());
    } catch (e) {
      emit(PhoneAuthError(error: e.toString()));
    }
  }

  // FutureOr<void> _loginWithCredential(
  //     OtpVerified event, Emitter<AuthenticationStates> emit) async {
  //   try {
  //     SharedPreference sharedPreference = SharedPreference();
  //     await auth.signInWithCredential(event.credential).then((user) async {
  //       if (user.user != null) {
  //         Map userDetailsMap = {
  //           'customer_id': user.user!.uid,
  //           'customer_name': (event.userName.toString() == "null")
  //               ? "null"
  //               : event.userName.toString(),
  //           'customer_contact': user.user?.phoneNumber
  //         };
  //         // AuthenticateUser authenticateUser =
  //         // await _authenticationRepository.authenticateUser(userDetailsMap);
  //         // if (authenticateUser.status == 200) {
  //         //   await sharedPreference.setInt(
  //         //       SharedPrefKey.userId, authenticateUser.data!.customerContact!);
  //         //   await sharedPreference.setMap(
  //         //       SharedPrefKey.userData, authenticateUser.data!.toJson());
  //         //   await sharedPreference.setBool(SharedPrefKey.isLoggedIn, true);
  //           // userDetails = await sharedPreference.getMap(SharedPrefKey.userData);
  //           emit(PhoneOtpVerified());
  //
  //       }
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     emit(PhoneAuthError(error: e.code));
  //   } catch (e) {
  //     emit(PhoneAuthError(error: e.toString()));
  //   }
  // }

  _onOtpVerificationError(
      OtpVerificationError event, Emitter<AuthenticationStates> emit) async {
    emit(PhoneAuthError(error: 'Something went wrong'));
    emit(LoginLoaded());
  }
}
