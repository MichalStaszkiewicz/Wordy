part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUser extends RegisterEvent {
  RegisterUser(
      {required this.fullName, required this.email, required this.password});
  String fullName;
  String email;
  String password;
}

class RegisterInit extends RegisterEvent {
  RegisterInit();
}


class FinishInitialSetup extends RegisterEvent {
  FinishInitialSetup({required this.currentCourse});
  String currentCourse;
}

class InterfaceLanguageChange extends RegisterEvent {
  InterfaceLanguageChange({
    required this.choosenLanguage,
  });
  String choosenLanguage;
}

class CancelLanguageChange extends RegisterEvent {
  CancelLanguageChange({required this.choosenLanguage});
  String choosenLanguage;
}

class InitialSetupBegin extends RegisterEvent {
  const InitialSetupBegin();
}

class InitialSetupStateUpdate extends RegisterEvent {
  InitialSetupStateUpdate(
      {required this.updatedLanguage, required this.beforeUpdateLanguage});

  String updatedLanguage;
  String beforeUpdateLanguage;
}
