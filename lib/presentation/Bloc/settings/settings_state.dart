part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {
  SettingsInitial();
}

class SettingsLoaded extends SettingsState {
  SettingsLoaded({required this.themeMode,required this.interfaceLanguage});
  bool themeMode;
  String interfaceLanguage;
  @override
  List<Object> get props =>[themeMode,interfaceLanguage];
}
