import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../../Utility/locator/service_locator.dart';
import '../../../domain/logic/user_service.dart';

import '../../../domain/models/custom_error.dart';

import '../../../utility/validator.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final userLogic = locator<UserService>();
  RegisterBloc() : super(const RegisterInitial()) {
    registerInit();
    register();
    settingUpProfileBegin();
    switchInterfaceLanguage();
    finishInitialSetup();
    cancelLanguageChange();
    initialSetupStateUpdate();
  }
  void registerInit() {
    on<RegisterEvent>((event, emit) {
      emit(const RegisterInitial());
    });
  }

  void cancelLanguageChange() {
    on<CancelLanguageChange>((event, emit) {
      emit(InitialSetupState(
        languageToLearn: event.choosenLanguage,
        languageConflict: false,
        languageToLearnCopy: event.choosenLanguage,
      ));
    });
  }

  void initialSetupStateUpdate() {
    on<InitialSetupStateUpdate>((event, emit) async {
      final userInterfaceLanguage =
          locator<UserService>().getUserInterfaceLanguage();
      if (userInterfaceLanguage!.isError) {
        emit(RegisterError(
            error: ExceptionHelper.getErrorMessage(UnexpectedError())));
      } else {
        if (event.updatedLanguage.toLowerCase() == userInterfaceLanguage!) {
          emit(InitialSetupState(
            languageToLearn: event.updatedLanguage,
            languageConflict: true,
            languageToLearnCopy: event.beforeUpdateLanguage,
          ));
        } else {
          emit(InitialSetupState(
            languageToLearn: event.updatedLanguage,
            languageConflict: false,
            languageToLearnCopy: event.updatedLanguage,
          ));
        }
      }
    });
  }

  void finishInitialSetup() {
    on<FinishInitialSetup>((event, emit) async {
      emit(const RegisterLoadingState());

      final userLogic = locator<UserService>();

      final token = await locator.get<Repository>().getTokenAccess();
      if (token!.isData) {
        await Future.microtask(() async {
          var userCourseData = await userLogic.updateUserCurrentCourse(
            event.currentCourse,
          );

          if (userCourseData.isError) {
            emit(RegisterError(
                error: ExceptionHelper.getErrorMessage(token.error!)));
          } else {
            await userLogic
                .updateRegisterationStatus(token.data!)
                .then((value) => emit(InitialSetupDone()));
          }
        });
      } else {
        emit(RegisterError(
            error: ExceptionHelper.getErrorMessage(token.error!)));
      }
    });
  }

  void switchInterfaceLanguage() {
    on<InterfaceLanguageChange>((event, emit) async {
      emit(InitialSetupState(
          languageToLearn: event.choosenLanguage,
          languageConflict: false,
          languageToLearnCopy: event.choosenLanguage));
    });
  }

  void settingUpProfileBegin() {
    on<InitialSetupBegin>((event, emit) async {
      emit(const InitialSetupLoading());
      emit(InitialSetupState(
        languageToLearn: '',
        languageConflict: false,
        languageToLearnCopy: '',
      ));
    });
  }

  void register() {
    on<RegisterUser>((event, emit) async {
      emit(RegisterInProgress(
          email: event.email,
          fullName: event.fullName,
          password: event.password));

      var result = await userLogic.registerUser({
        "fullName": event.fullName,
        "email": event.email,
        "password": event.password
      });
      if (result.isData) {
        emit(RegisterSuccess(email: event.email, password: event.password));
      } else {
        emit(RegisterError(
            error: ExceptionHelper.getErrorMessage(result.error!)));
      }
    });
  }
}
