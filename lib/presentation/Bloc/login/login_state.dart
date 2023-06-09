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
  Authenticated({required this.registerCompleted,required this.userId});
  bool registerCompleted;
  String userId;
}

class LoginError extends LoginState {
  LoginError({required this.error});
  CustomError error;
}
