part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoggedOut extends LoginState {
  LoggedOut();

  @override
  List<Object?> get props => [];
}

class Authenticating extends LoginState {
  Authenticating();
}

class Authenticated extends LoginState {
  Authenticated({required this.registerCompleted});
  bool registerCompleted;
}

class LoginError extends LoginState {
  LoginError({required this.error});
  CustomError error;
}
