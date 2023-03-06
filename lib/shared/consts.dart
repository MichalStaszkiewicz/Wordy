import 'package:flutter/material.dart';

import '../domain/models/course_profile.dart';
import '../domain/models/language.dart';

const Color kdisabledcolor = Color.fromARGB(156, 212, 209, 209);
const Color kactivestatuscolor = Color.fromARGB(255, 67, 165, 70);
const Color ktitlecolor = Color.fromRGBO(51, 51, 51, 1.0);
List<CourseProfile> kCourses = [
  CourseProfile(
      native: "English",
      dbNotation: "Polish",
      flag: "poland",
      language: "Polish"),
  CourseProfile(
      native: "English",
      dbNotation: "French",
      flag: "france",
      language: "French"),
  CourseProfile(
      native: "English",
      dbNotation: "Spanish",
      flag: "spain",
      language: "Spanish"),
  CourseProfile(
      native: "Polish",
      dbNotation: "English",
      flag: "united-kingdom",
      language: "English"),

];

List<String> topics = ["Basic Conversation"];
Map<String, String> quizTitles = {
  "Basic Conversation": "Basic Conversation",
  "Podstawowe Wyrażenia": "Basic Conversation"
};

Map<String, String> flagWays = {
  "Polish": "poland",
  "Spanish": "spain",
  "French": "france",
  "English": "united-kingdom"
};

final List<Language> languages_available_for_interface = [
  Language(
    image: "assets/poland.png",
    label: "Polish",
  ),
  Language(
    image: "assets/united-kingdom.png",
    label: "English",
  ),
];
final List<Language> languages = [
  Language(
    image: "assets/poland.png",
    label: "Polish",
  ),
  Language(
    image: "assets/spain.png",
    label: "Spanish",
  ),
  Language(
    image: "assets/france.png",
    label: "French",
  ),
  Language(
    image: "assets/united-kingdom.png",
    label: "English",
  ),
];
Map<String, Map<String, dynamic>> ui_lang = {
  "Polish": {
    "language_menu_information": "Wybierz język którego chcesz się nauczyć",
    "dialog_change_native_language_to_english":
        "Ten język jest dostępny tylko jeśli już znasz angielski. Czy chcesz zmienić swój ojczysty język na angielski?",
    "dialog_change_native_language_to_polish":
        "Ten język jest dostępny tylko jeśli już znasz język polski. Czy chcesz zmienić swój ojczysty język na język polski?",
    "home_screen_app_bar": "Kategorie",
    "vocabulary_screen_app_bar": "Słownictwo",
    "vocabulary_screen_search_hint": "Wyszukaj kategorie",
    "topic_label": ["Podstawowe Wyrażenia"],
    "profile_screen_app_bar": "Profil",
    "profile_screen_courses_header": "Kursy",
    "profile_screen_statistics_header": "Statystyki",
    "profile_screen_days_in_a_row": "Dni z rzędu",
    "profile_screen_learned_words": "Nauczone słowa",
    "profile_screen_finished_topics": "Ukończone tematy",
    "profile_screen_achievements": "Osiągnięcia",
    "settings_screen_app_bar": "Ustawienia",
    "settings_screen_theme_description":
        "Wybierz motyw, aby określić wygląd i wrażenia z interfejsu w aplikacji.",
    "settings_screen_interface_header": "Język interfejsu",
    "settings_screen_interface_description":
        "Użyj tej opcji aby zmienić język interfejsu",
    "settings_screen_choose_interface_language": "Wybierz język interfejsu",
    "unexpected_error": "Coś poszło nie tak",
    "quiz_settings_learn": "Nauka",
    "quiz_settings_review": "Powtórka",
    "finished_topic_announcement": "Gratulacje udało ci się ukończyć temat:",
    "no_words_to_review_announcement": "Nie masz słow do powtórki",
    "warning_dialog_header": "Uwaga!",
    "exit_dialog_description":
        "Czy na pewno chcesz wyjść? Jeśli tak, utracisz postęp.",
    "dialog_yes": "Tak",
    "dialog_no": "Nie",
    "quiz_next_button": "Dalej",
    "quiz_finish_header": "Podsumowanie",
    "quiz_finish_your_score": "Wynik",
    "quiz_finish_percentage": "Procent poprawnych odpowiedzi:",
    "quiz_finish_repeat": "Powtórz quiz",
    "quiz_finish_home": "Zakończ",
  },
  "English": {
    "language_menu_information": "Select language you want to learn",
    "home_screen_app_bar": "Topic",
    "vocabulary_screen_app_bar": "Vocabulary",
    "vocabulary_screen_search_hint": "Search topic",
    "topic_label": ["Basic Conversation"],
    "profile_screen_app_bar": "Profile",
    "dialog_change_native_language_to_english":
        "This language is only available if you already know english. Do you want to swap your native language to english?",
    "dialog_change_native_language_to_polish":
        "This language is only available if you already know polish. Do you want to swap your native language to polish?",
    "profile_screen_courses_header": "My Courses",
    "profile_screen_statistics_header": "Statistics",
    "profile_screen_days_in_a_row": "Days in a row",
    "profile_screen_learned_words": "Learned words",
    "profile_screen_finished_topics": "Finished topics",
    "profile_screen_achievements": "Achievements",
    "settings_screen_app_bar": "Settings",
    "settings_screen_theme_description":
        "Choose a theme to define the look and feel of the app interface",
    "settings_screen_interface_header": "Interface language",
    "settings_screen_interface_description":
        "Use this option to change the interface language",
    "settings_screen_choose_interface_language": "Choose interface language",
    "unexpected_error": "Something went wrong",
    "quiz_settings_learn": "Learn",
    "quiz_settings_review": "Review",
    "finished_topic_announcement": "Congratulations you finished topic:",
    "no_words_to_review_announcement": "You have no words to review",
    "warning_dialog_header": "Warning!",
    "exit_dialog_description":
        "Are you sure you want to exit? If so, you will lose progress.",
    "dialog_yes": "Yes",
    "dialog_no": "No",
    "quiz_next_button": "Next",
    "quiz_finish_header": "Summary",
    "quiz_finish_your_score": "Your Score",
    "quiz_finish_percentage": "Percentage of the correct answers",
    "quiz_finish_repeat": "Repeat quiz",
    "quiz_finish_home": "Finish",
  }
};
