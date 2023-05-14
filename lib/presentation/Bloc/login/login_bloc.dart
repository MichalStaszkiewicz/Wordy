import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:wordy/domain/logic/user_data_logic.dart';

import '../../../const/consts.dart';
import '../../../domain/models/user.dart';
import '../../../domain/result.dart';
import '../../../localizator.dart';
import '../../../utility/user_manager.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AuthFormEvent, LoginState> {
  LoginBloc() : super(LoggedOut()) {
    login();
  }
  void login() {
    on<Login>((event, emit) async {
      UserDataLogic userLogic = UserDataLogic();
      final userInstance = locator.get<UserManager>();
      emit(Authenticating());
      try {
        userInstance.userId = await userLogic.loginUser(
            User(email: event.email, password: event.password, fullName: null));
        print("Authentication success");
        print("Logging user with id: " + userInstance.userId.toString());
        emit(Authenticated());
      } on Exception catch (e) {
        emit(LoginError(exception: e));
      }
    });
  }
}
