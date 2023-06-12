import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import '../../../Utility/locator/service_locator.dart';
import '../../../data/network/request/models/login_user_request_model.dart';
import '../../../domain/models/custom_error.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AuthFormEvent, LoginState> {
  LoginBloc() : super(const LoggedOut()) {
    login();
    loginLogOut();
  }
  void loginLogOut() {
    on<LogOut>((event, emit) {
      emit(const LoggedOut());
    });
  }

  void login() {
    on<Login>((event, emit) async {
      final userLogic = locator<UserService>();
      emit(const Authenticating());

      var token = await userLogic.loginUser(
          LoginUserModel(email: event.email, password: event.password));

      //TODO Implement saving token in shared preferences
      if (token.isRight) {
        final registerationStatus = await locator
            .get<Repository>()
            .getRegisterationStatus(token.right!);
        print("Authentication success");

        if (registerationStatus.isRight) {
          emit(Authenticated(
              registerCompleted:
                  registerationStatus.right!.registerationCompleted,
              userId: token.right!));
        } else {
          emit(LoginError(
              error:
                  ExceptionHelper.getErrorMessage(registerationStatus.left!)));
        }
      } else {
        emit(LoginError(error: ExceptionHelper.getErrorMessage(token.left!)));
      }
    });
  }
}
