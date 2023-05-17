import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import '../../../domain/logic/user_data_logic.dart';
import '../../../domain/models/user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    register();
    settingUpProfile();
    finishRegister();
  }
  void finishRegister() {
    on<InitialSetupFinish>((event, emit) {


      
    });
  }

  void settingUpProfile() {
    on<InitialSetupStateUpdate>((event, emit) => emit(InitialSetupState(
        languageToLearn: event.languageToLearn,
        nativeLanguage: event.nativeLanguage)));
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
        print("ERROR: ${e.toString()}");
        emit(RegisterError(exception: e));
      }
    });
  }
}
