part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {
  ResetPasswordInitial();
}

class ResetPasswordSended extends ResetPasswordState {
  ResetPasswordSended();
}

class ResetPasswordError extends ResetPasswordState {
  ResetPasswordError();
}
