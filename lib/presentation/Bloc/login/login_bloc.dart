import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import '../../../const/consts.dart';
import '../../../data/network/request/models/login_user_request_model.dart';
import '../../../domain/models/custom_error.dart';
import '../../../utility/locator/storage_locator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AuthFormEvent, LoginState> {
  LoginBloc() : super(LoggedOut()) {
    login();
    loginLogOut();
  }
  void loginLogOut() {
    on<LogOut>((event, emit) {
      emit(LoggedOut());
    });
  }

  void login() {
    on<Login>((event, emit) async {
      final userLogic = locator<UserService>();
      emit(Authenticating());

      var userId = await userLogic.loginUser(
          LoginUserModel(email: event.email, password: event.password));
      if (userId.isRight) {
        final registerationStatus = await locator
            .get<Repository>()
            .getRegisterationStatus(userId.right!);
        print("Authentication success");

        print("Logging user with id: $userId");
        if (registerationStatus.isRight) {
          emit(Authenticated(
              registerCompleted:
                  registerationStatus.right!.registerationCompleted));
        } else {
          emit(LoginError(
              error:
                  ExceptionHelper.getErrorMessage(registerationStatus.left!)));
        }
      } else {
        emit(LoginError(error: ExceptionHelper.getErrorMessage(userId.left!)));
      }
    });
  }
}
