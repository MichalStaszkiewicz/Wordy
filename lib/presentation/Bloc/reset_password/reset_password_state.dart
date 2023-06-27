part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {
  const ResetPasswordInitial();
}

class ResetPasswordError extends ResetPasswordState {
  ResetPasswordError({required this.error});
  CustomError error;
  @override
  List<Object> get props => [error];
}

class UserPasswordUpdated extends ResetPasswordState {
  UserPasswordUpdated();
}

class UpdateUserPasswordState extends ResetPasswordState {
  UpdateUserPasswordState();
}

class RecoverAccountMessageSended extends ResetPasswordState {
  RecoverAccountMessageSended();
}
