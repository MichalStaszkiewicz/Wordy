import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/presentation/home_page.dart';
import 'package:wordy/presentation/screens/auth_screen.dart';

import '../presentation/screens/initial_settings_screen.dart';
import '../presentation/screens/selected_course_screen.dart';

class AppRouter {
  static const authScreen = "/";
  static const home = "/home";
  static const initialSettings = '/initial_settings';
  static const selectedCourse = '/selected_course';
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
  ]);
}
