import '../../utility/either.dart';
import '../models/interface_language.dart';
import '../repositiories/repository.dart';

class SettingsLogic {
  SettingsLogic(this._repository);

  final Repository _repository;
  Future<Either<Exception, List<InterfaceLanguage>>>
      getAvailableLanguages() async {
    var languages = await _repository.getAvailableLanguages();
    if (languages.isError) {
      return Either.error(languages.error!);
    }
    return Either.data(languages.data);
  }

  Future<Either<Exception, List<InterfaceLanguage>>>
      getAvailableLanguagesExceptCurrentUserLanguage() async {
    var availableLanguages = await _repository.getAvailableLanguages();
    if (availableLanguages.isError) {
      return Either.error(availableLanguages.error!);
    }
    var currentUserLanguage = _repository.getUserInterfaceLanguage();
    if (currentUserLanguage.isError) {
      return Either.error(currentUserLanguage.error);
    }
    availableLanguages.data!.removeWhere((element) =>
        element.name.toLowerCase() == currentUserLanguage.data!.toLowerCase());
    return Either.data(availableLanguages.data);
  }
}
