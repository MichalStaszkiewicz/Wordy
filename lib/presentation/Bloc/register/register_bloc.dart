import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:wordy/data/network/request/update_user_interface_language_request.dart';
import 'package:wordy/domain/logic/settings_logic.dart';
import '../../../data/network/request/models/update_user_current_course_request_model.dart';
import '../../../data/network/request/models/update_user_interface_language_request_model.dart';
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
    finishInitialSetup();
  }

  void finishInitialSetup() {
    on<FinishInitialSetup>((event, emit) async {
      try {
        emit(RegisterLoadingState());
        UserDataLogic userLogic = UserDataLogic();

        final userInstance = locator.get<User>();

        userInstance.currentCourse = await userLogic.updateUserCurrentCourse(
            UpdateUserCurrentCourseModel(
                courseName: event.currentCourse, userId: userInstance.uuid!));
        await userLogic.updateUserRegisterStatus(userInstance.uuid!);

        emit(InitialSetupDone());
      } on Exception catch (e) {
        emit(RegisterError(exception: e));
      }
    });
  }

  void interfaceLanguageChange() {
    on<InitialSetupInterfaceLanguageChange>((event, emit) async {
      final userInstance = locator.get<User>();
      UserDataLogic userLogic = UserDataLogic();
      try {
        if (event.choosenLanguage.toLowerCase() == 'polish') {
          await userLogic.updateUserInterfaceLanguage(
              UpdateUserInterfaceLanguageModel(
                  userId: userInstance.uuid!, languageName: "english"));
        } else {
          await userLogic.updateUserInterfaceLanguage(
              UpdateUserInterfaceLanguageModel(
                  userId: userInstance.uuid!, languageName: "polish"));
        }

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
        final state = this.state as InitialSetupState;

        if (event.languageToLearn == userInstance.interfaceLanguage) {
          emit(RegisterLanguageChangeInfo(
              message:
                  'Choosing this language will change your interface language.',
              languageToLearn: event.languageToLearn,
              langaugeOnCancel: state.languageToLearn));
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
