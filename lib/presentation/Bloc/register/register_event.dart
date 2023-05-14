part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class Register extends RegisterEvent {
  Register(
      {required this.fullName, required this.email, required this.password});
  String fullName;
  String email;
  String password;
}
