import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_settings_and_preferences_event.dart';
part 'user_settings_and_preferences_state.dart';

class UserSettingsAndPreferencesBloc extends Bloc<UserSettingsAndPreferencesEvent, UserSettingsAndPreferencesState> {
  UserSettingsAndPreferencesBloc() : super(UserSettingsAndPreferencesInitial()) {
    on<UserSettingsAndPreferencesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
