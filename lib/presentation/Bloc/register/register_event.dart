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

class InitialSetupInterfaceLanguageChange extends RegisterEvent {
  InitialSetupInterfaceLanguageChange({
    required this.choosenLanguage,
  });
  String choosenLanguage;
}

class InitialSetupStateBegin extends RegisterEvent {
  InitialSetupStateBegin();
}

class InitialSetupStateUpdate extends RegisterEvent {
  InitialSetupStateUpdate({required this.languageToLearn});

  String languageToLearn;
}
