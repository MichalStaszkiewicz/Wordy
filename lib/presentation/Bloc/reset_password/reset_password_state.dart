part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {
  ResetPasswordInitial();
}

class ResetPasswordError extends ResetPasswordState {
  ResetPasswordError({required this.error});
  CustomError error;
  @override
  List<Object> get props => [error];
}

class UserPasswordUpdated extends ResetPasswordState {
  const UserPasswordUpdated();
}

class UpdateUserPasswordState extends ResetPasswordState {
  const UpdateUserPasswordState();
}

class RecoverAccountMessageSended extends ResetPasswordState {
  const RecoverAccountMessageSended();
}
