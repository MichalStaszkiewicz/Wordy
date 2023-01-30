part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}
class LoadSettings extends SettingsEvent{
const LoadSettings();

}
class UpdateUserTheme extends SettingsEvent{
 UpdateUserTheme({required this.themeMode});
 bool themeMode;





}
class UpdateUserInterfaceLanguage  extends SettingsEvent{
UpdateUserInterfaceLanguage({required this.interfaceLanguage});
String interfaceLanguage;


}