import 'dart:collection';
import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wordy/domain/models/word.dart';
import 'package:wordy/presentation/Provider/interface_language_provider.dart';
import 'package:wordy/presentation/Widgets/quiz_options.dart';

import '../domain/models/course_entry.dart';
import '../domain/models/quiz_question.dart';
import '../presentation/Bloc/user_progress/user_progress_bloc.dart';
import '../presentation/Provider/interface_language_provider.dart';
import '../presentation/Provider/interface_language_provider.dart';
import '../presentation/Widgets/language_to_choose.dart';
import '../shared/consts.dart';

class Utility {
  Utility();
  Widget languageChangeMenu(
    double animationValue,
  ) {
  
    return AnimatedPositioned(
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
      bottom: animationValue,
      left: 0,
      right: 0,
      child: BlocBuilder<UserProgressBloc, UserProgressState>(
        builder: (context, state) {
            String interfaceLanguage =
        Provider.of<InterfaceLanguageProvider>(context, listen: false)
            .interfaceLangauge;
          if (state is UserCoursesAndSettingsInformations) {
            return Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        ui_lang[interfaceLanguage]![
                            'language_menu_information'],
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                        itemCount: languages.length,
                        itemBuilder: (context, index) => LanguageToChoose(
                              function: () {
                                if (languages[index].label ==
                                    state.nativeLanguage) {
                                  languageChangeNotPossibleForUserNativeLangugae(
                                      context,
                                      state.nativeLanguage,
                                      languages[index].label);
                                } else {
                                  context
                                      .read<UserProgressBloc>()
                                      .add(UpdateUserCourse(
                                        course: languages[index].label,
                                      ));
                                }
                              },
                              index: index,
                              language: state.currentCourse,
                              listLangs: languages,
                            )),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void languageChangeNotPossibleForUserNativeLangugae(
      BuildContext context, String nativeLanguage, String choosenLanguage) {
    InterfaceLanguageProvider provider =
        Provider.of<InterfaceLanguageProvider>(context, listen: false);
    AwesomeDialog(
            context: context,
            dialogType: DialogType.warning,
            animType: AnimType.bottomSlide,
            title: ui_lang[nativeLanguage]!["warning_dialog_header"],
            desc: choosenLanguage == "Polish"
                ? ui_lang[nativeLanguage]![
                    "dialog_change_native_language_to_english"]
                : ui_lang[nativeLanguage]![
                    "dialog_change_native_language_to_polish"],
            btnOkColor: Colors.blue,
            btnOkText: ui_lang[nativeLanguage]!["dialog_yes"],
            btnCancelText: ui_lang[nativeLanguage]!["dialog_no"],
            btnOkOnPress: () {
              context.read<UserProgressBloc>().add(UpdateUserCourse(
                    course: choosenLanguage,
                  ));
              provider.changeUserInterfaceLanguage(choosenLanguage);
            },
            btnCancelOnPress: () {})
        .show();
  }

  List<CourseEntry> convertWordToCourse(List<Word> words,
      String languageToLearn, String languageThatUserWillLearnFrom) {
    List<CourseEntry> result = [];

    for (Word word in words) {
      if (languageToLearn.toLowerCase() == "english" &&
          languageThatUserWillLearnFrom.toLowerCase() == "polish") {
        result.add(CourseEntry(
            translation: word.english, word: word.polish, topic: word.topic));
      }
    }
    return result;
  }

  Map<String, String> convertCurrentCourseName(
      String courseName, String interfaceLanguage) {
    Map<String, String> map = {};
    String courseNameTable = "${interfaceLanguage}To$courseName";

    map.addAll({
      "courseNameTable": courseNameTable,
      "courseName": courseName,
      "interfaceLanguage": interfaceLanguage
    });
    return map;
  }

  String convertStepIntoTitle(int step) {
    if (step == 1) {
      return "Choose your native language";
    }
    if (step == 2) {
      return "Choose language you want to learn";
    } else {
      return "Finish";
    }
  }

  List<QuizQuestion> createListOfQuestions(List<CourseEntry> words) {
    List<QuizQuestion> questions = [];
    HashSet<String> usedWords = HashSet<String>();
    for (int i = 0; i < words.length; i++) {
      Random random = Random();
      if (questions.length == 20) {
        break;
      }

      while (usedWords.length < 4) {
        var randomWord = words[random.nextInt(words.length)].word;
        if (!usedWords.contains(randomWord)) {
          usedWords.add(randomWord);
        }
      }
      List<String> answersList = usedWords.toList();
      var correctAnswerIndex = 0;
      var correctAnswer = words[i].word;

      if (usedWords.contains(correctAnswer)) {
        for (int i = 0; i < usedWords.length; i++) {
          if (usedWords.elementAt(i) == correctAnswer) {
            answersList[i] = correctAnswer;
            correctAnswerIndex = i;
          }
        }
      } else {
        correctAnswerIndex = random.nextInt(4);
        answersList[correctAnswerIndex] = correctAnswer;
      }

      questions.add(QuizQuestion(
          answer: words[i].word,
          questionOptions: answersList,
          question: words[i].translation,
          correct_answer_index: correctAnswerIndex));

      usedWords.remove(correctAnswer);
    }

    return questions;
  }

  Positioned quizSettings(
      bool show,
      Offset localPosition,
      Offset globalPosition,
      int index,
      String name,
      BuildContext context,
      ScrollController controller) {
    if (show == true) {
      var deviceDimensions = MediaQuery.of(context).size;
      Offset showMenuPosition = Offset(globalPosition.dx - localPosition.dx,
          globalPosition.dy - localPosition.dy);

      if (showMenuPosition.dy < 10) {
        Offset offsetAfterJump = Offset(globalPosition.dx - localPosition.dx,
            (globalPosition.dy - (showMenuPosition.dy)) - localPosition.dy);
        controller.animateTo(controller.offset + (showMenuPosition.dy),
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        return Positioned(
          top: offsetAfterJump.dy + 30,
          left: offsetAfterJump.dx,
          child: QuizOptions(
            title: name,
          ),
        );
      } else if (deviceDimensions.height < showMenuPosition.dy + 180 &&
          showMenuPosition.dy > 10) {
        Offset offsetAfterJump = Offset(globalPosition.dx - localPosition.dx,
            (globalPosition.dy - 180) - localPosition.dy);
        controller.animateTo(controller.offset + 180,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        return Positioned(
          top: offsetAfterJump.dy,
          left: offsetAfterJump.dx,
          child: QuizOptions(
            title: name,
          ),
        );
      } else {
        return Positioned(
          top: showMenuPosition.dy,
          left: showMenuPosition.dx,
          child: QuizOptions(
            title: name,
          ),
        );
      }
    } else {
      return Positioned(child: Container());
    }
  }
}
