part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoggedOut extends LoginState {
  const LoggedOut();

  @override
  List<Object?> get props => [];
}

class Authenticating extends LoginState {
  const Authenticating();
}

class Authenticated extends LoginState {
  Authenticated({required this.registerCompleted, required this.token});
  bool registerCompleted;
  String token;
}

class LoginError extends LoginState {
  LoginError({required this.error});
  CustomError error;
}
