import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/domain/models/beginner_question.dart';

import 'package:wordy/presentation/home_page.dart';
import 'package:wordy/presentation/screens/auth_screen.dart';
import 'package:wordy/presentation/screens/quiz_finish_screen.dart';
import 'package:wordy/presentation/screens/quiz_screen.dart';
import 'package:wordy/presentation/screens/vocabulary_screen.dart';
import 'package:wordy/presentation/widgets/selected_vocabulary_topic.dart';

import '../domain/models/active_course.dart';
import '../presentation/screens/achievements_screen.dart';
import '../presentation/screens/initial_settings_screen.dart';
import '../presentation/screens/learned_words_selected_course.dart';
import '../presentation/screens/selected_course_screen.dart';
import '../presentation/screens/words_learned_screen.dart';
import '../utility/observers/custom_route_observer.dart';

class AppRouter {
  static const authScreen = "/";
  static const home = "/home";
  static const initialSettings = '/initial_settings';
  static const selectedCourse = '/selected_course';
  static const quizScreen = '/home/quiz_screen';
  static const quizCompleted = '/home/quiz_screen/completed';
  static const vocabularyTopicScreen = '/home/vocabulary_topic_screen';
  static const achievementsScreen = '/home/profile/achievements';
  static const wordsLearnedScreen = '/words_learned_screen';

  static const vocabularyTopicSelectedScreen =
      '/home/vocabulary_topic_selected_screen';

  static const learnedWordsSelectedCourse = '/learned_word_course_selected';

  static Widget _learnedWordsSelectedCourse(
      BuildContext context, GoRouterState state) {
    Map<String, dynamic> data = state.extra as Map<String, dynamic>;
    return LearnedWordsSelectedCourse(
      course: data['activeCourse'] as ActiveCourse,
    );
  }

  static Widget _achievementsScreenRouteBuilder(
      BuildContext context, GoRouterState state) {
    Map<String, dynamic> data = state.extra as Map<String, dynamic>;
    return AchievementsScreen(
      achievements: data['achievements'],
    );
  }

  static Widget _vocabularyTopicScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const VocabularyScreen();
  static Widget _vocabularyTopicSelectedScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      SelectedVocabularyTopic(
        topic: state.queryParameters['topic']!,
      );

  static Widget _wordsLearnedScreenRouteBuilder(
      BuildContext context, GoRouterState state) {
    Map<String, dynamic> data = state.extra as Map<String, dynamic>;
    return WordsLearnedScreen(
      beginnerProgress: data['beginnerProgress'] as List<ActiveCourse>,
    );
  }

  static Widget _quizScreenCompletedRouteBuilder(
      BuildContext context, GoRouterState state) {
    Map<String, dynamic> data = state.extra as Map<String, dynamic>;
    return QuizFinishScreen(
      topic: data['topic']!,
      correctAnswers: data['correctAnswers']! as List<int>,
      questions: data['maximumPoints']! as List<BeginnerQuestion>,
    );
  }

  static Widget _quizScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      QuizScreen(
        topic: state.extra as String,
      );
  static Widget _selectedCourseScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const SelectedCourseScreen();
  static Widget _authScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const AuthScreen();
  static Widget _initialSettingsScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const InitialSettingsScreen();
  static Widget _homeScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const HomePage();
  static final GoRouter router = GoRouter(observers: [
    CustomRouteObserver(),
  ], routes: [
    GoRoute(
        path: achievementsScreen,
        name: achievementsScreen,
        builder: _achievementsScreenRouteBuilder),
    GoRoute(
        path: learnedWordsSelectedCourse,
        name: learnedWordsSelectedCourse,
        builder: _learnedWordsSelectedCourse),
    GoRoute(
        path: wordsLearnedScreen,
        name: wordsLearnedScreen,
        builder: _wordsLearnedScreenRouteBuilder),
    GoRoute(
        name: authScreen, path: authScreen, builder: _authScreenRouteBuilder),
    GoRoute(
        name: initialSettings,
        path: initialSettings,
        builder: _initialSettingsScreenRouteBuilder),
    GoRoute(name: home, path: home, builder: _homeScreenRouteBuilder),
    GoRoute(
        name: selectedCourse,
        path: selectedCourse,
        builder: _selectedCourseScreenRouteBuilder),
    GoRoute(
        name: quizScreen, path: quizScreen, builder: _quizScreenRouteBuilder),
    GoRoute(
        name: quizCompleted,
        path: quizCompleted,
        builder: _quizScreenCompletedRouteBuilder),
    GoRoute(
        name: vocabularyTopicScreen,
        path: vocabularyTopicScreen,
        builder: _vocabularyTopicScreenRouteBuilder),
    GoRoute(
        name: vocabularyTopicSelectedScreen,
        path: vocabularyTopicSelectedScreen,
        builder: _vocabularyTopicSelectedScreenRouteBuilder),
  ]);

  static void popUntil(BuildContext context, String path) {
    Navigator.popUntil(context, (route) {
      return route.settings.name == path;
    });
  }
}
