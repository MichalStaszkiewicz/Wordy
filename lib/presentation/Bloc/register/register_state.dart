part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  RegisterInitial();
}

class RegisterInProgress extends RegisterState {
  RegisterInProgress(
      {required this.fullName, required this.email, required this.password});
  String fullName;
  String email;
  String password;
}

class InitialSetupLoading extends RegisterState {
  InitialSetupLoading();
}

class RegisterSuccess extends RegisterState {
  RegisterSuccess();
}

class RegisterError extends RegisterState {
  RegisterError({required this.exception});
  Exception exception;
}

class RegisterLanguageChangeInfo extends RegisterState {
  RegisterLanguageChangeInfo(
      {required this.message,
      required this.langauge,
});
  String message;
  String langauge;

  @override
  List<Object> get props => [message, langauge,];
}

class InitialSetupState extends RegisterState {
  InitialSetupState({
    required this.languageToLearn,
  });

  String languageToLearn;
  @override
  List<Object> get props => [languageToLearn];
}
