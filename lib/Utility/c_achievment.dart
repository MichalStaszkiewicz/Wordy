import 'package:wordy/data/local/local_repository_implementation.dart';
import 'package:wordy/data/local/local_repository_implementation.dart';

import '../domain/models/achievement.dart';
import '../domain/models/achievements_base.dart';

class CAchievement {
  CAchievement();
  final LocalRepository _localRepository = LocalRepository();
  Future<List<Achievement>> getAllAchievements() async {
    Map<String, dynamic> userData = await _localRepository.getUserData();
    String language = userData['interfaceLanguage'];
    List<Achievement> userProgressInAchievements =
        await getUserProgressInEachAchievement();

    List<Achievement> result = [];
    for (int i = 0; i < getAchievementsCount(); i++) {
      result.add(Achievement(
        name: _achievements[language]![i]!.name,
        description: _achievements[language]![i]!.description,
        image: _achievements[language]![i]!.image,
        achieved: userProgressInAchievements[i].achieved,
        currentProgress: userProgressInAchievements[i].currentProgress,
        progressToAchieve: userProgressInAchievements[i].progressToAchieve,
      ));
    }
    return result;
  }

  Future<Map<String, dynamic>> gainAchievement(double? precision) async {
    List<int> userAchievementIds = await _localRepository.getAchievementsIds();
    int allAchievementCount = getAchievementsCount();
    List<int> userNewAchievementIds = [];
    List<Achievement> userNewAchievements = [];
    Map<String, dynamic> userNewAchievementsData = {};
    for (int i = 0; i < allAchievementCount; i++) {
      if (!userAchievementIds.contains(i)) {
        Achievement? achievement = await convertIdIntoAchievemnet(i, precision);
        if (achievement != null) {
          userNewAchievementIds.add(i);
          userNewAchievements.add(achievement);
        }
      }
    }
    userNewAchievementsData.addAll({
      "achievement_ids": userAchievementIds,
      "achievement_data": userNewAchievements
    });
    return userNewAchievementsData;
  }

  int getAchievementsCount() {
    return _achievements['English']!.length;
  }

  Future<List<Achievement>> getUserProgressInEachAchievement() async {
    List<Achievement> achievements = [];
    for (int i = 0; i < getAchievementsCount(); i++) {
      Achievement? achiv = await convertIdIntoAchievemnet(i, null);
      if (achiv != null) {
        achievements.add(achiv);
      }
    }
    return achievements;
  }

  Future<Achievement?> convertIdIntoAchievemnet(
      int id, double? precision) async {
    Map<String, dynamic> userData = await _localRepository.getUserData();
    String language = userData['interfaceLanguage'];
    if (id == 0) {
      int learnedWords = await _localRepository.getLearnedWordiesCount();
      Map<String, dynamic> data = noviceLinguist(learnedWords);
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: _achievements[language]![id]!.description,
          image: _achievements[language]![id]!.image,
          name: _achievements[language]![id]!.name,
          progressToAchieve: data['progressToAchieve']);
    } else if (id == 1) {
      int learnedWords = await _localRepository.getLearnedWordiesCount();
      Map<String, dynamic> data = wordExplorer(learnedWords);
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: _achievements[language]![id]!.description,
          image: _achievements[language]![id]!.image,
          name: _achievements[language]![id]!.name,
          progressToAchieve: data['progressToAchieve']);
    } else if (id == 2) {
      int learnedWords = await _localRepository.getLearnedWordiesCount();
      Map<String, dynamic> data = lexicalConnoisseur(learnedWords);
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: _achievements[language]![id]!.description,
          image: _achievements[language]![id]!.image,
          name: _achievements[language]![id]!.name,
          progressToAchieve: data['progressToAchieve']);
    } else if (id == 3) {
      int learnedWords = await _localRepository.getLearnedWordiesCount();
      Map<String, dynamic> data = languageSavant(learnedWords);
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: _achievements[language]![id]!.description,
          image: _achievements[language]![id]!.image,
          name: _achievements[language]![id]!.name,
          progressToAchieve: data['progressToAchieve']);
    } else if (id == 4) {
      int learnedWords = await _localRepository.getLearnedWordiesCount();
      Map<String, dynamic> data = vocabularyVirtuoso(learnedWords);
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: _achievements[language]![id]!.description,
          image: _achievements[language]![id]!.image,
          name: _achievements[language]![id]!.name,
          progressToAchieve: data['progressToAchieve']);
    } else if (id == 5) {
      Map<String, dynamic> data =
          polygot(await _localRepository.getPercentageOfEveryCourse());
      return Achievement(
          achieved: data['achieved'],
          currentProgress: data['progress'],
          description: _achievements[language]![id]!.description,
          image: _achievements[language]![id]!.image,
          name: _achievements[language]![id]!.name,
          progressToAchieve: data['progressToAchieve']);
    } else if (id == 6) {
      if (precision != null) {
        Map<String, dynamic> data = flawlessVictory(precision);
        return Achievement(
          name: _achievements[language]![id]!.name,
          image: _achievements[language]![id]!.image,
          description: _achievements[language]![id]!.description,
          achieved: data['achieved'],
          currentProgress: data['progress'],
          progressToAchieve: data['progressToAchieve'],
        );
      } else {
        List<int> userIds = await _localRepository.getAchievementsIds();
        if (userIds.contains(6)) {
          return Achievement(
              name: _achievements[language]![id]!.name,
              image: _achievements[language]![id]!.image,
              description: _achievements[language]![id]!.description,
              achieved: true,
              currentProgress: 1,
              progressToAchieve: 1);
        } else {
          return Achievement(
              name: _achievements[language]![id]!.name,
              image: _achievements[language]![id]!.image,
              description: _achievements[language]![id]!.description,
              achieved: false,
              currentProgress: 0,
              progressToAchieve: 1);
        }
      }
    } else {
      return null;
    }
  }

  AchievementBase convertIdIntoAchievementBase(int id, String language) {
    return _achievements[language]![id]!;
  }

  Map<String, dynamic> noviceLinguist(int words) {
    Map<String, dynamic> data = {};

    if (words >= 100) {
      data.addAll(
          {"achieved": true, "progress": 100, "progressToAchieve": 100});
    } else if (words < 100) {
      data.addAll(
          {"achieved": false, "progress": words, "progressToAchieve": 100});
    }

    return data;
  }

  Map<String, dynamic> wordExplorer(int words) {
    Map<String, dynamic> data = {};
    if (words >= 500) {
      data.addAll(
          {"achieved": true, "progress": 500, "progressToAchieve": 500});
    } else if (words < 500) {
      data.addAll(
          {"achieved": false, "progress": words, "progressToAchieve": 500});
    }

    return data;
  }

  Map<String, dynamic> lexicalConnoisseur(int words) {
    Map<String, dynamic> data = {};
    if (words >= 1000) {
      data.addAll(
          {"achieved": true, "progress": 1000, "progressToAchieve": 1000});
    } else if (words < 1000) {
      data.addAll(
          {"achieved": false, "progress": words, "progressToAchieve": 1000});
    }

    return data;
  }

  Map<String, dynamic> languageSavant(int words) {
    Map<String, dynamic> data = {};
    if (words >= 2500) {
      data.addAll(
          {"achieved": true, "progress": 2500, "progressToAchieve": 2500});
    } else if (words < 2500) {
      data.addAll(
          {"achieved": false, "progress": words, "progressToAchieve": 2500});
    }

    return data;
  }

  Map<String, dynamic> vocabularyVirtuoso(int words) {
    Map<String, dynamic> data = {};
    if (words >= 5000) {
      data.addAll(
          {"achieved": true, "progress": 5000, "progressToAchieve": 5000});
    } else if (words < 5000) {
      data.addAll(
          {"achieved": false, "progress": words, "progressToAchieve": 5000});
    }

    return data;
  }

  Map<String, dynamic> polygot(List<double> overallProgress) {
    Map<String, dynamic> data = {};
    int p = 0;
    for (double progress in overallProgress) {
      if (progress >= 75) {
        p++;
      } else if (progress < 75) {
        data.addAll(
            {"achieved": false, "progress": p, "progressToAchieve": 75});
        return data;
      }
    }
    data.addAll({"achieved": true, "progress": p, "progressToAchieve": 75});
    return data;
  }

  Map<String, dynamic> flawlessVictory(double precision) {
    Map<String, dynamic> data = {};
    if (precision == 100) {
      data.addAll(
          {"achieved": true, "progress": precision, "progressToAchieve": 100});
    } else if (precision < 75) {
      data.addAll(
          {"achieved": false, "progress": precision, "progressToAchieve": 100});
    }

    return data;
  }

  final Map<String, Map<int, AchievementBase>> _achievements = {
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
