import 'package:equatable/equatable.dart';

abstract class AuthenticationStates extends Equatable {}


class LoginLoaded extends AuthenticationStates {
  @override
  List<Object?> get props => [];
}

class SignUpLoaded extends AuthenticationStates {
  @override
  List<Object?> get props => [];
}

class OtpLoading extends AuthenticationStates {
  @override
  List<Object?> get props => [];
}

class OtpReceived extends AuthenticationStates {
  final String verificationId;
  // final String userName;

  OtpReceived({required this.verificationId});

  @override
  List<Object> get props => [verificationId];
}

class PhoneOtpVerified extends AuthenticationStates {
  @override
  List<Object> get props => [];
}

class PhoneAuthError extends AuthenticationStates {
  final String error;

  PhoneAuthError({required this.error});

  @override
  List<Object> get props => [error];
}
