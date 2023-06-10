import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:wordy/presentation/home_page.dart';
import 'package:wordy/presentation/screens/auth_screen.dart';
import 'package:wordy/presentation/screens/quiz_finish_screen.dart';
import 'package:wordy/presentation/screens/quiz_screen.dart';
import 'package:wordy/presentation/screens/vocabulary_screen.dart';
import 'package:wordy/presentation/widgets/selected_vocabulary_topic.dart';

import '../presentation/screens/initial_settings_screen.dart';
import '../presentation/screens/selected_course_screen.dart';

class AppRouter {
  static const authScreen = "/";
  static const home = "/home";
  static const initialSettings = '/initial_settings';
  static const selectedCourse = '/selected_course';
  static const quizScreen = '/home/quiz_screen';
  static const quizCompleted = '/home/quiz_screen/completed';
  static const vocabularyTopicScreen = '/home/vocabulary_topic_screen';
  static const selectedCourseScreenNamed = '/selected_course_named';
  static const vocabularyTopicSelectedScreen =
      '/home/vocabulary_topic_selected_screen';
  static const vocabularyTopicSelectedScreenNamed =
      'vocabulary_topic_selected_screen';

  static Widget _vocabularyTopicScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const VocabularyScreen();
  static Widget _vocabularyTopicSelectedScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      SelectedVocabularyTopic(
        topic: state.queryParameters['topic']!,
      );

  static Widget _quizScreenCompletedRouteBuilder(
      BuildContext context, GoRouterState state) {
    Map<String, String> data = state.extra as Map<String, String>;
    return QuizFinishScreen(
      topic: data['topic']!,
      correctAnswers: int.parse(data['correctAnswers']!),
      maximumPoints: int.parse(data['maximumPoints']!),
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
  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: authScreen, builder: _authScreenRouteBuilder),
    GoRoute(path: initialSettings, builder: _initialSettingsScreenRouteBuilder),
    GoRoute(path: home, builder: _homeScreenRouteBuilder),
    GoRoute(
        name: selectedCourseScreenNamed,
        path: selectedCourse,
        builder: _selectedCourseScreenRouteBuilder),
    GoRoute(
        name: 'quiz_screen',
        path: quizScreen,
        builder: _quizScreenRouteBuilder),
    GoRoute(
        name: 'quiz_screen_completed',
        path: quizCompleted,
        builder: _quizScreenCompletedRouteBuilder),
    GoRoute(
        name: 'vocabulary_topic_screen',
        path: vocabularyTopicScreen,
        builder: _vocabularyTopicScreenRouteBuilder),
    GoRoute(
        name: vocabularyTopicSelectedScreenNamed,
        path: vocabularyTopicSelectedScreen,
        builder: _vocabularyTopicSelectedScreenRouteBuilder),
  ]);
}
