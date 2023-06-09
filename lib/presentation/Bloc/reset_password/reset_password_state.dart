part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {
  const ResetPasswordInitial();
}

class ResetPasswordSended extends ResetPasswordState {
  const ResetPasswordSended();
}

class ResetPasswordError extends ResetPasswordState {
  const ResetPasswordError();
}
