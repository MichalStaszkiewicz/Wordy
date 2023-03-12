import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';

import '../domain/models/achievement.dart';
import '../domain/models/achievements_base.dart';

class CAchievement {
  CAchievement();
  final LocalRepository _localRepository = LocalRepository();
  Future<List<AchievementBase>> getAllAchievementBases() async {
    Map<String, dynamic> userData = await _localRepository.getUserData();
    String language = userData['interfaceLanguage'];
    List<AchievementBase> result = [];
    for (int i = 0; i < achievements.length; i++) {
      result.add(AchievementBase(
          name: achievements[language]![i]!.name,
          description: achievements[language]![i]!.description,
          image: achievements[language]![i]!.image));
    }
    return result;
  }

  Future<Achievement> convertIdIntoAchievemnet(
    int id,
  ) async {
    Map<String, dynamic> userData = await _localRepository.getUserData();
    String language = userData['interfaceLanguage'];
    if (id == 0) {
      int learnedWords = await _localRepository.getLearnedWordiesCount();
      Map<String, dynamic> data = noviceLinguist(learnedWords);
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: achievements[language]![id]!.description,
          image: achievements[language]![id]!.image,
          name: achievements[language]![id]!.name,
          progressToAchieve: data['progress']);
    } else if (id == 1) {
      int learnedWords = await _localRepository.getLearnedWordiesCount();
      Map<String, dynamic> data = wordExplorer(learnedWords);
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: achievements[language]![id]!.description,
          image: achievements[language]![id]!.image,
          name: achievements[language]![id]!.name,
          progressToAchieve: data['progress']);
    } else if (id == 2) {
      int learnedWords = await _localRepository.getLearnedWordiesCount();
      Map<String, dynamic> data = lexicalConnoisseur(learnedWords);
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: achievements[language]![id]!.description,
          image: achievements[language]![id]!.image,
          name: achievements[language]![id]!.name,
          progressToAchieve: data['progress']);
    } else if (id == 3) {
      int learnedWords = await _localRepository.getLearnedWordiesCount();
      Map<String, dynamic> data = languageSavant(learnedWords);
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: achievements[language]![id]!.description,
          image: achievements[language]![id]!.image,
          name: achievements[language]![id]!.name,
          progressToAchieve: data['progress']);
    } else if (id == 4) {
      int learnedWords = await _localRepository.getLearnedWordiesCount();
      Map<String, dynamic> data = vocabularyVirtuoso(learnedWords);
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: achievements[language]![id]!.description,
          image: achievements[language]![id]!.image,
          name: achievements[language]![id]!.name,
          progressToAchieve: data['progress']);
    } else if (id == 5) {
      int learnedWords = await _localRepository.getLearnedWordiesCount();
      Map<String, dynamic> data =
          polygot(await _localRepository.getPercentageOfEveryCourse());
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: achievements[language]![id]!.description,
          image: achievements[language]![id]!.image,
          name: achievements[language]![id]!.name,
          progressToAchieve: data['progress']);
    } else {
      List<int> ids = await _localRepository.getAchievementsIds();
      if (ids.contains(6)) {
        return Achievement(
            achieved: true,
            currentProgress: 1,
            description: achievements[language]![id]!.description,
            image: achievements[language]![id]!.image,
            name: achievements[language]![id]!.name,
            progressToAchieve: 1);
      } else {
        return Achievement(
            achieved: false,
            currentProgress: 0,
            description: achievements[language]![id]!.description,
            image: achievements[language]![id]!.image,
            name: achievements[language]![id]!.name,
            progressToAchieve: 0);
      }
    }
  }

  AchievementBase convertIdIntoAchievementBase(int id, String language) {
    return achievements[language]![id]!;
  }

  Map<String, dynamic> noviceLinguist(int words) {
    Map<String, dynamic> data = {};
    if (words >= 100) {
      data.addAll({"achieved": true, "progress": 100});
    } else if (words < 100) {
      data.addAll({"achieved": false, "progress": words});
    }

    return data;
  }

  Map<String, dynamic> wordExplorer(int words) {
    Map<String, dynamic> data = {};
    if (words >= 500) {
      data.addAll({"achieved": true, "progress": 500});
    } else if (words < 500) {
      data.addAll({"achieved": false, "progress": words});
    }

    return data;
  }

  Map<String, dynamic> lexicalConnoisseur(int words) {
    Map<String, dynamic> data = {};
    if (words >= 1000) {
      data.addAll({"achieved": true, "progress": 500});
    } else if (words < 1000) {
      data.addAll({"achieved": false, "progress": words});
    }

    return data;
  }

  Map<String, dynamic> languageSavant(int words) {
    Map<String, dynamic> data = {};
    if (words >= 2500) {
      data.addAll({"achieved": true, "progress": 500});
    } else if (words < 2500) {
      data.addAll({"achieved": false, "progress": words});
    }

    return data;
  }

  Map<String, dynamic> vocabularyVirtuoso(int words) {
    Map<String, dynamic> data = {};
    if (words >= 5000) {
      data.addAll({"achieved": true, "progress": 500});
    } else if (words < 5000) {
      data.addAll({"achieved": false, "progress": words});
    }

    return data;
  }

  Map<String, dynamic> polygot(List<double> overallProgress) {
    Map<String, dynamic> data = {};
    int progress = 0;
    for (double progress in overallProgress) {
      if (progress >= 75) {
        progress++;
      } else if (progress < 75) {
        data.addAll({"achieved": false, "progress": progress});
        return data;
      }
    }
    data.addAll({"achieved": true, "progress": progress});
    return data;
  }

  Map<String, dynamic> flawlessVictory(double precision) {
    Map<String, dynamic> data = {};
    if (precision == 100) {
      data.addAll({"achieved": true, "progress": precision});
    } else if (precision < 75) {
      data.addAll({"achieved": false, "progress": precision});
    }

    return data;
  }

  Map<String, Map<int, AchievementBase>> achievements = {
    "English": <int, AchievementBase>{
      0: AchievementBase(
        name: 'Novice Linguist',
        image: 'assets/wordmaster.png',
        description: 'Learn 100 words',
      ),
      1: AchievementBase(
        name: 'Word Explorer',
        image: 'assets/wordmaster.png',
        description: 'Learn 500 words',
      ),
      2: AchievementBase(
        name: 'Lexical Connoisseur',
        image: 'assets/wordmaster.png',
        description: 'Learn 1000 words',
      ),
      3: AchievementBase(
        name: 'Language Savant',
        image: 'assets/wordmaster.png',
        description: 'Learn 2500 words',
      ),
      4: AchievementBase(
        name: 'Vocabulary Virtuoso',
        image: 'assets/wordmaster.png',
        description: 'Learn 5000 words',
      ),
      5: AchievementBase(
        name: 'Polyglot',
        image: 'assets/polyglot.png',
        description:
            'Successfully complete at least 75% of the language courses for three or more',
      ),
      6: AchievementBase(
        name: 'Flawless Victory',
        image: 'assets/perfect.png',
        description: 'Achieve a perfect score on a language learning session',
      ),
    },
    "Polish": <int, AchievementBase>{
      0: AchievementBase(
        name: 'Początkujący Lingwista',
        image: 'assets/wordmaster.png',
        description: 'Naucz się 100 słów',
      ),
      1: AchievementBase(
        name: 'Badacz Słów',
        image: 'assets/wordmaster.png',
        description: 'Naucz się 500 słów',
      ),
      2: AchievementBase(
        name: 'Koneser Językowy',
        image: 'assets/wordmaster.png',
        description: 'Naucz się 1000 słów',
      ),
      3: AchievementBase(
        name: 'Eksplorator Językowy',
        image: 'assets/wordmaster.png',
        description: 'Naucz się 2500 słów',
      ),
      4: AchievementBase(
        name: 'Wirtuoz Słownictwa',
        image: 'assets/wordmaster.png',
        description: 'Naucz się 5000 słów',
      ),
      5: AchievementBase(
        name: 'Poliglota',
        image: 'assets/polyglot.png',
        description:
            'Zdobądź przynajmniej 75% ocen w trzech lub więcej kursach językowych',
      ),
      6: AchievementBase(
        name: 'Bezkresne Zwycięstwo',
        image: 'assets/perfect.png',
        description: 'Uzyskaj perfekcyjny wynik w sesji nauki języka',
      ),
    },
  };
}
