import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/domain/logic/settings_logic.dart';
import 'package:wordy/const/consts.dart';

import '../../../utility/locator/api_locator.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    loadSettings();
    updateUserTheme();
    updateUserInterfaceLanguage();
  }

  void updateUserTheme() {
    on<UpdateUserTheme>((event, emit) {
      final settingsLogic = locator<SettingsLogic>();
      final state = this.state as SettingsLoaded;
      settingsLogic.updateUserTheme(event.themeMode);
      emit(SettingsLoaded(
          themeMode: event.themeMode,
          interfaceLanguage: state.interfaceLanguage));
    });
  }

  void updateUserInterfaceLanguage() {
    on<UpdateUserInterfaceLanguage>((event, emit) {
      final settingsLogic = locator<SettingsLogic>();
      final state = this.state as SettingsLoaded;

      settingsLogic.updateUserInterfaceLanguage(event.interfaceLanguage);

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
