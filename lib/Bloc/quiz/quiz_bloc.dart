import 'dart:math';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mysql1/mysql1.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/models/quiz_question.dart';

import '../../models/word.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    learningWords();
    reviewWords();
    nextQuestion();
  }

  void nextQuestion() {
    on<LoadNextQuestion>((event, emit) {
      if (state is QuizLoaded) {
        final state = this.state as QuizLoaded;
        emit(QuizLoaded(
          questions: state.questions,
          index: state.index++,
        ));
      }
    });
  }

  void learningWords() {
    on<LoadQuestionsForLearning>((event, emit) async {
      var settings = ConnectionSettings(
        host: '34.116.212.168',
        port: 3306,
        user: 'root',
        password: '1337',
        db: 'wordy-database',
      );
      var connection = await MySqlConnection.connect(settings);
      var results = await connection
          .query("SELECT * FROM translations WHERE Topic = ?", [event.topic]);
      print(results.length);
      List<Word> words = [];
      for (int i = 0; i < results.length; i++) {
        words.add(Word(
            polish: results.elementAt(i).fields['Polish'],
            english: results.elementAt(i).fields['English'],
            french: results.elementAt(i).fields['French'],
            spanish: results.elementAt(i).fields['Spanish']));
      }
      connection.close();
      String databasePath = await getDatabasesPath();
      String path = "$databasePath/wordyDB.db/";
      Database db = await openDatabase(path);
      Utility utility = Utility();

      List<QuizQuestion> questions = [];
      var profile = await db.rawQuery("SELECT currentCourse FROM profile");
      if (profile.isNotEmpty) {
        String currentCourse = profile.elementAt(0)['currentCourse'].toString();
        print(currentCourse);
        Map<String, String> map =
            utility.convertCurrentCourseName(currentCourse);
        String languageToLearn = map['languageToLearn'] ?? "";
        String languageThatUserWillLearnFrom =
            map['languageThatUserWillLearnFrom'] ?? "";

        print("languageToLearn " + languageToLearn.toLowerCase());
        print("languageThatUserWillLearnFrom " +
            languageThatUserWillLearnFrom.toLowerCase());
        print("courseNameTable " + map['courseNameTable'].toString());
        var learnedWords =
            await db.rawQuery("SELECT * FROM ${map['courseNameTable']}");
        print(words.length);
        for (int i = 0; i < words.length; i++) {
          if (questions.length == 20) {
            break;
          }
          if (languageToLearn.toLowerCase() == "english" &&
              languageThatUserWillLearnFrom.toLowerCase() == "polish") {
            Random rnd = Random();
            questions.add(QuizQuestion(
                answer: words[i].english,
                questionOptions: [
                  words[rnd.nextInt(words.length - 1)].english,
                  words[rnd.nextInt(words.length - 1)].english,
                  words[rnd.nextInt(words.length - 1)].english,
                  words[rnd.nextInt(words.length - 1)].english,
                ],
                question: words[i].polish));
          }
        }

        emit(QuizLoaded(
          questions: questions,
          index: 0,
        ));
      }
    });
  }

  void reviewWords() {
    on<LoadQuestionsForReview>((event, emit) async {
      var settings = ConnectionSettings(
        host: '34.116.212.168',
        port: 3306,
        user: 'root',
        password: '1337',
        db: 'wordy-database',
      );
      var connection = await MySqlConnection.connect(settings);
      var results = await connection
          .query("SELECT * FROM translations WHERE Topic = ${event.topic}");

      List<Word> words = [];
      for (int i = 0; i < results.length; i++) {
        words.add(Word(
            polish: results.elementAt(i).fields['Polish'],
            english: results.elementAt(i).fields['English'],
            french: results.elementAt(i).fields['French'],
            spanish: results.elementAt(i).fields['Spanish']));
      }
      connection.close();
      emit(QuizLoaded(
        questions: [],
        index: 0,
      ));
    });
  }
}
