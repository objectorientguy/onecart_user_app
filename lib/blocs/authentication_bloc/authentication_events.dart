import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvent extends Equatable {}

class LoadLoginScreen extends AuthenticationEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadSignUpScreen extends AuthenticationEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetOtp extends AuthenticationEvent {
  final String phoneNumber;
  // final String userName;
  //
  GetOtp({required this.phoneNumber});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OtpReceivedOnPhone extends AuthenticationEvent {
  final String verify;
  // final int? token;
  // final String userName;

  OtpReceivedOnPhone(
      {required this.verify});

  @override
  List<Object> get props => [verify];
}

class VerifyOtp extends AuthenticationEvent {
  final String otpCode;
  final String verificationId;
  // final String userName;

  VerifyOtp(
      {required this.otpCode,
        required this.verificationId,});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OtpVerified extends AuthenticationEvent {
  final AuthCredential credential;
  // final String userName;

  OtpVerified({required this.credential});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class OtpVerificationError extends AuthenticationEvent {
  final String error;

  OtpVerificationError({required this.error});

  @override
  List<Object> get props => [error];
}
