import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/domain/logic/settings_logic.dart';

import '../../../Utility/locator/service_locator.dart';

part 'settings_event.dart';
part 'settings_state.dart';
//TODO: Implement Dark Mode
/*
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsInitial()) {
    loadSettings();
    updateUserTheme();
    updateUserInterfaceLanguage();
  }

  void updateUserTheme() {
    on<UpdateUserTheme>((event, emit) {
      final settingsLogic = locator<SettingsLogic>();
      final state = this.state as SettingsLoaded;
     
      emit(SettingsLoaded(
          themeMode: event.themeMode,
          interfaceLanguage: state.interfaceLanguage));
    });
  }

  void updateUserInterfaceLanguage() {
    on<UpdateUserInterfaceLanguage>((event, emit) {
      final settingsLogic = locator<SettingsLogic>();
      final state = this.state as SettingsLoaded;

      

      emit(SettingsLoaded(
          themeMode: state.themeMode,
          interfaceLanguage: event.interfaceLanguage));
    });
  }

  void loadSettings() {
    on<LoadSettings>((event, emit) async {
      final settingsLogic = locator<SettingsLogic>();
      emit(SettingsLoaded(
          interfaceLanguage: await settingsLogic.getUserInterfaceLanguage(),
          themeMode: await settingsLogic.getUserTheme()));
    });
  }
  
}
*/