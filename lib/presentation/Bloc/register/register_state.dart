part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterInProgress extends RegisterState {
  RegisterInProgress(
      {required this.fullName, required this.email, required this.password});
  String fullName;
  String email;
  String password;
}

class UserPasswordUpdated extends RegisterState {
  UserPasswordUpdated();
}

class UpdateUserPasswordState extends RegisterState {
  UpdateUserPasswordState();
}

class RecoverAccountMessageSended extends RegisterState {
  RecoverAccountMessageSended();
}

class InitialSetupLoading extends RegisterState {
  const InitialSetupLoading();
}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess();
}

class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState();
}

class RegisterError extends RegisterState {
  RegisterError({required this.error});
  CustomError error;
  @override
  List<Object> get props => [error];
}

class InitialSetupDone extends RegisterState {}

class InitialSetupState extends RegisterState {
  InitialSetupState(
      {required this.languageToLearn,
      required this.languageConflict,
      required this.languageToLearnCopy});
  bool languageConflict;
  String languageToLearn;
  String languageToLearnCopy;

  @override
  List<Object> get props =>
      [languageToLearn, languageConflict, languageToLearnCopy];
}
