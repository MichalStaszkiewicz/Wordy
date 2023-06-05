part of 'login_bloc.dart';

abstract class AuthFormEvent extends Equatable {
  const AuthFormEvent();

  @override
  List<Object> get props => [];
}

class LogOut extends AuthFormEvent {
  LogOut({required this.errorMessage});
  String errorMessage;
}

class Login extends AuthFormEvent {
  const Login({required this.email, required this.password});

  final String email;
  final String password;
}
