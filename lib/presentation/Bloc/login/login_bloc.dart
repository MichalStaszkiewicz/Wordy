import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:wordy/domain/logic/user_data_logic.dart';
import '../../../const/consts.dart';
import '../../../data/network/request/models/login_user_request_model.dart';
import '../../../domain/models/user.dart';
import '../../../domain/result.dart';
import '../../../localizator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AuthFormEvent, LoginState> {
  LoginBloc() : super(LoggedOut()) {
    login();
  }

  void login() {
    on<Login>((event, emit) async {
      UserDataLogic userLogic = UserDataLogic();
      final userInstance = locator.get<User>();
      emit(Authenticating());
      try {
        await userLogic.loginUser(
            LoginUserModel(email: event.email, password: event.password));

        print("Authentication success");
        print("Register status: ${userInstance.registrationStatus}");
        print("Logging user with id: ${userInstance.uuid}");
        emit(Authenticated(registerCompleted: userInstance.registrationStatus));
      } on Exception catch (e) {
        emit(LoginError(exception: e));
      }
    });
  }
}
