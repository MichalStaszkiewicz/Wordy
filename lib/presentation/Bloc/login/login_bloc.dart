import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:wordy/domain/logic/user_data_logic.dart';
import 'package:wordy/domain/repositiories/repository.dart';
import '../../../const/consts.dart';
import '../../../data/network/request/models/login_user_request_model.dart';
import '../../../utility/locator/storage_locator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<AuthFormEvent, LoginState> {
  LoginBloc() : super(LoggedOut()) {
    login();
  }

  void login() {
    on<Login>((event, emit) async {
      final userLogic = locator<UserDataLogic>();
      emit(Authenticating());
      try {
        await userLogic
            .loginUser(
                LoginUserModel(email: event.email, password: event.password))
            .then((value) async {
          final userId = await locator.get<Repository>().getUserId();
          final registerationStatus =
              await locator.get<Repository>().getRegisterationStatus(userId!);
          print("Authentication success");

          print("Logging user with id: $userId");

          emit(Authenticated(
              registerCompleted: registerationStatus.registerationCompleted));
        });
      } on Exception catch (e) {
        print(e);
        emit(LoginError(exception: e));
      }
    });
  }
}
