import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/network/exceptions/validation_error.dart';
import 'package:wordy/domain/logic/user_service.dart';

import '../../../Utility/locator/service_locator.dart';
import '../../../data/network/exceptions/exception_helper.dart';
import '../../../domain/models/custom_error.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  String email = '';
  ResetPasswordBloc() : super(ResetPasswordInitial()) {
    initialResetPassword();
    recoverAccount();
    confirmTokenReset();
    updatePassword();
  }
  void initialResetPassword() {
    on<InitialResetPassword>((event, emit) {
      emit(ResetPasswordInitial());
    });
  }

  void recoverAccount() {
    on<RecoverAccount>((event, emit) async {
      try {
        var recoverState =
            await locator<UserService>().recoverAccount(event.email);

        if (recoverState.isError) {
          emit(ResetPasswordError(
              error: ExceptionHelper.getErrorMessage(recoverState.error!)));
        } else {
          email = event.email;
          emit(const RecoverAccountMessageSended());
        }
      } on Exception catch (e) {
        emit(ResetPasswordError(error: ExceptionHelper.getErrorMessage(e)));
      }
    });
  }

  void confirmTokenReset() {
    on<ValidateResetPasswordToken>((event, emit) async {
      try {
        var validation = await locator<UserService>()
            .validateResetPasswordToken(email, event.token);

        if (validation.isError) {
          emit(ResetPasswordError(
              error: ExceptionHelper.getErrorMessage(validation.error!)));
        } else {
          emit(const UpdateUserPasswordState());
        }
      } on Exception catch (e) {
        emit(ResetPasswordError(error: ExceptionHelper.getErrorMessage(e)));
      }
    });
  }

  void updatePassword() {
    on<UpdateUserPassword>((event, emit) async {
      try {
        if (event.password.length < 5) {
          emit(ResetPasswordError(
              error: ExceptionHelper.getErrorMessage(ValidationError(
                  'Too Short Password',
                  message:
                      'The password is too short must be at least 5 characters'))));
          return;
        }
        var validation = await locator<UserService>()
            .updateUserPassword(email, event.password);
        if (validation.isError) {
          emit(ResetPasswordError(
              error: ExceptionHelper.getErrorMessage(validation.error!)));
        } else {
          emit(const UserPasswordUpdated());
        }
      } on Exception catch (e) {
        emit(ResetPasswordError(error: ExceptionHelper.getErrorMessage(e)));
      }
    });
  }
}
