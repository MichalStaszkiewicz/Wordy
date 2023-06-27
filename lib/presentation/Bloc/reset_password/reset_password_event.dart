part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class InitialResetPassword extends ResetPasswordEvent {
  InitialResetPassword();
}

class RecoverAccount extends ResetPasswordEvent {
  RecoverAccount({required this.email});
  String email;
}

class ValidateResetPasswordToken extends ResetPasswordEvent {
  ValidateResetPasswordToken({required this.token});
  String token;
}

class UpdateUserPassword extends ResetPasswordEvent {
  UpdateUserPassword({required this.password});
  String password;
}
