import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:wordy/domain/logic/settings_logic.dart';
import '../../../domain/logic/user_data_logic.dart';
import '../../../domain/models/language.dart';
import '../../../domain/models/user.dart';
import '../../../localizator.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    register();
    settingUpProfileUpdate();
    settingUpProfileBegin();
    interfaceLanguageChange();
  }
  void interfaceLanguageChange() {
    on<InitialSetupInterfaceLanguageChange>((event, emit) async {
      final userInstance = locator.get<User>();
      try {
        print(
            "Before UserInstance interface language:${userInstance.interfaceLanguage}");

        if (event.choosenLanguage.toLowerCase() == 'polish') {
          userInstance.interfaceLanguage = 'english';
        } else {
          userInstance.interfaceLanguage = 'polish';
        }
        print(
            "Updated UserInstance interface language:${userInstance.interfaceLanguage}");
        emit(InitialSetupState(
          languageToLearn: event.choosenLanguage,
        ));
      } on Exception catch (e) {
        emit(RegisterError(exception: e));
      }
    });
  }

  void settingUpProfileBegin() {
    on<InitialSetupStateBegin>((event, emit) async {
      emit(InitialSetupLoading());
      emit(InitialSetupState(
        languageToLearn: '',
      ));
    });
  }

  void settingUpProfileUpdate() {
    on<InitialSetupStateUpdate>((event, emit) {
      final userInstance = locator.get<User>();
      if (state is InitialSetupState) {
        if (event.languageToLearn == userInstance.interfaceLanguage) {
          emit(RegisterLanguageChangeInfo(
              message:
                  'Choosing this language will change your interface language.',
              langauge: event.languageToLearn, ));
        } else {
          emit(InitialSetupState(
            languageToLearn: event.languageToLearn,
          ));
        }
      }
    });
  }

  void register() {
    on<Register>((event, emit) async {
      emit(RegisterInProgress(
          email: event.email,
          fullName: event.fullName,
          password: event.password));
      UserDataLogic userLogic = UserDataLogic();

      try {
        String result = await userLogic.registerUser({
          "fullName": event.fullName,
          "email": event.email,
          "password": event.password
        });

        print("DATA: ${result}");
        emit(RegisterSuccess());
      } on Exception catch (e) {
        emit(RegisterError(exception: e));
      }
    });
  }
}
