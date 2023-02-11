import '../domain/models/language.dart';

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
String userLanguage = "Polish";
final List<Language> languages = [
  Language(
    image: "assets/poland.png",
    label: "Polish",
  ),
  Language(
    image: "assets/united-kingdom.png",
    label: "English",
  ),
];
Map<String, Map<String, dynamic>> ui_lang = {
  "Polish": {
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
    "exit_dialog_header": "Uwaga!",
    "exit_dialog_description":
        "Czy na pewno chcesz wyjść? Jeśli tak, utracisz postęp.",
    "exit_dialog_yes": "Tak",
    "exit_dialog_no": "Nie",
    "quiz_next_button": "Dalej",
    "quiz_finish_header": "Podsumowanie",
    "quiz_finish_your_score": "Wynik",
    "quiz_finish_percentage": "Procent poprawnych odpowiedzi:",
    "quiz_finish_repeat": "Powtórz quiz",
    "quiz_finish_home": "Zakończ",
  },
  "English": {
    "home_screen_app_bar": "Topic",
    "vocabulary_screen_app_bar": "Vocabulary",
    "vocabulary_screen_search_hint": "Search topic",
    "topic_label": ["Basic Conversation"],
    "profile_screen_app_bar": "Profile",
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
    "exit_dialog_header": "Warning!",
    "exit_dialog_description":
        "Are you sure you want to exit? If so, you will lose progress.",
    "exit_dialog_yes": "Yes",
    "exit_dialog_no": "No",
    "quiz_next_button": "Next",
    "quiz_finish_header": "Summary",
    "quiz_finish_your_score": "Your Score",
    "quiz_finish_percentage": "Percentage of the correct answers",
    "quiz_finish_repeat": "Repeat quiz",
    "quiz_finish_home": "Finish",
  }
};
