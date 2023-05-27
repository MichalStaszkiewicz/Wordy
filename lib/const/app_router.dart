import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/presentation/home_page.dart';
import 'package:wordy/presentation/screens/auth_screen.dart';
import 'package:wordy/presentation/screens/quiz_finish_screen.dart';
import 'package:wordy/presentation/screens/quiz_screen.dart';

import '../presentation/screens/initial_settings_screen.dart';
import '../presentation/screens/selected_course_screen.dart';

class AppRouter {
  static const authScreen = "/";
  static const home = "/home";
  static const initialSettings = '/initial_settings';
  static const selectedCourse = '/selected_course';
  static const quizScreen = '/home/quiz_screen';
  static const quizCompleted = '/home/quiz_screen/completed';
  static Widget _quizScreenCompletedRouteBuilder(
          BuildContext context, GoRouterState state) =>
      QuizFinishScreen(
        topic: state.queryParameters['topic']!,
        correctAnswers: int.parse(state.queryParameters['correctAnswers']!),
        maximumPoints: int.parse(state.queryParameters['maximumPoints']!),
      );
  static Widget _quizScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      QuizScreen(
        topic: state.queryParameters['topic']!,
      );
  static Widget _selectedCourseScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      SelectedCourseScreen();
  static Widget _authScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      AuthScreen();
  static Widget _initialSettingsScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      InitialSettingsScreen();
  static Widget _homeScreenRouteBuilder(
          BuildContext context, GoRouterState state) =>
      HomePage();
  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: authScreen, builder: _authScreenRouteBuilder),
    GoRoute(path: initialSettings, builder: _initialSettingsScreenRouteBuilder),
    GoRoute(path: home, builder: _homeScreenRouteBuilder),
    GoRoute(path: selectedCourse, builder: _selectedCourseScreenRouteBuilder),
    GoRoute(
        name: 'quiz_screen',
        path: quizScreen,
        builder: _quizScreenRouteBuilder),
    GoRoute(
        name: 'quiz_screen_completed',
        path: quizCompleted,
        builder: _quizScreenCompletedRouteBuilder),
  ]);
}
