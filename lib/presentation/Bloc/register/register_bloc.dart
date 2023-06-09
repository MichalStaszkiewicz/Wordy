import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../../Utility/locator/service_locator.dart';
import '../../../data/network/request/models/update_user_current_course_request_model.dart';
import '../../../domain/logic/user_service.dart';

import '../../../domain/models/custom_error.dart';

import '../../../utility/validator.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterInitial()) {
    register();
    settingUpProfileUpdate();
    settingUpProfileBegin();
    switchInterfaceLanguage();
    finishInitialSetup();
    cancelLanguageChange();
  }

  void cancelLanguageChange() {
    on<CancelLanguageChange>((event, emit) {
      emit(InitialSetupState(
        languageToLearn: event.choosenLanguage,
      ));
    });
  }

  void finishInitialSetup() {
    on<FinishInitialSetup>((event, emit) async {
      emit(const RegisterLoadingState());

      final userLogic = locator<UserService>();

      final userId = await locator.get<Repository>().getUserId();
      if (userId.isRight) {
        await Future.microtask(() async {
          await userLogic.updateUserCurrentCourse(UpdateUserCurrentCourseModel(
              courseName: event.currentCourse, userId: userId.right!));
          await userLogic.updateRegisterationStatus(true, userId.right!);
        }).then((value) => emit(InitialSetupDone()));
      } else {
        emit(RegisterError(
            error: ExceptionHelper.getErrorMessage(userId.left!)));
      }
    });
  }

  void switchInterfaceLanguage() {
    on<InterfaceLanguageChange>((event, emit) async {
      String choosenLanguage =
          await Validator.interfaceLanguageChange(event.choosenLanguage);
      emit(InitialSetupState(languageToLearn: choosenLanguage));
    });
  }

  void settingUpProfileBegin() {
    on<InitialSetupBegin>((event, emit) async {
      emit(const InitialSetupLoading());
      emit(InitialSetupState(
        languageToLearn: '',
      ));
    });
  }

  void settingUpProfileUpdate() {
    on<InitialSetupStateUpdate>((event, emit) async {
      if (state is InitialSetupState) {
        final state = this.state as InitialSetupState;
        final userInterfaceLanguage =
            await locator<Repository>().getUserInterfaceLanguage();
        if (event.languageToLearn.toLowerCase() ==
            userInterfaceLanguage.right!.toLowerCase()) {
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
    on<RegisterUser>((event, emit) async {
      emit(RegisterInProgress(
          email: event.email,
          fullName: event.fullName,
          password: event.password));
      final userLogic = locator<UserService>();

      var result = await userLogic.registerUser({
        "fullName": event.fullName,
        "email": event.email,
        "password": event.password
      });
      if (result.isRight) {
        emit(const RegisterSuccess());
      } else {
        emit(RegisterError(
            error: ExceptionHelper.getErrorMessage(result.left!)));
      }
    });
  }
}
