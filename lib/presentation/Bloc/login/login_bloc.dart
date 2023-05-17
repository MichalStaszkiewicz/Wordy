import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:wordy/domain/logic/user_data_logic.dart';
import '../../../const/consts.dart';
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
        String userId = await userLogic
            .loginUser({"email": event.email, "password": event.password});
        userInstance.uuid = userId;
        userInstance.registrationStatus =
            await userLogic.registerationStatus(userId);

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
