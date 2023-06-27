import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ColorScheme colorScheme = ColorScheme.fromSwatch(
  primarySwatch: Colors.blue,
  accentColor: Colors.green,
  brightness: Brightness.light,
);
final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    textTheme: GoogleFonts.robotoSlabTextTheme(),
    colorScheme: colorScheme);

final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.blue[800],
    textTheme: GoogleFonts.robotoSlabTextTheme(),
    colorScheme: colorScheme.copyWith(brightness: Brightness.dark));
const Color kdisabledcolor = Color.fromARGB(156, 212, 209, 209);
const Color kactivestatuscolor = Color.fromARGB(255, 67, 165, 70);
const Color ktitlecolor = Color.fromRGBO(51, 51, 51, 1.0);

Map<String, Map<String, dynamic>> ui_lang = {
  "polish": {
    'in': 'w',
    'known_words': "Znane Słowa",
    'choose_correct_translation': "Wybierz poprawne tłumaczenie",
    'learning': "Nauka",
    'polish': "Polski",
    'btn_cancel': 'Anuluj',
    'btn_ok': 'Ok',
    'english_quiz': "Angielskim",
    'french_quiz': "Francuskim",
    'spanish_quiz': "Hiszpańskim",
    'polish_quiz': "Polskim",
    'english': "Angielski",
    'french': "Francuski",
    'spanish': "Hiszpański",
    'achieved': "Zdobyte",
    'course': "Kurs",
    'select_course': "Wybierz kurs",
    'incorrect_answer': "Niepoprawna odpowiedź !",
    'correct_answer': "Poprawna odpowiedź !",
    'locked': "Zablokowane",
    'completed': "Ukończono",
    'review': "Powtórka",
    'start': 'Rozpocznij',
    'finish': 'Zakończ',
    'check': 'Sprawdź',
    'confirm': "potwierdź",
    'continue': 'Kontynuuj',
    'congratulations': 'Gratulacje !',
    'quiting_quiz': "Jeżeli teraz wyjdziesz stracisz cały postęp",
    'completed_topic': "Udało ci sie ukonczyć ten temat",
    'learned_words': "Znane złowa",
    'new_learned_words': 'Nowo poznane słowa',
    'achievements_everything': "Osiągnięcia - Wszystkie",
    'achievements_only_achieved': "Osiągnięcia - Zdobyte",
    'achievements_locked': "Osiągnięcia - Zablokowane",
    'achievements': {
      'beginner': {'name': 'Początkujący', 'description': 'Naucz się 10 słów'},
      'intermediate': {
        'name': 'Średnio zaawansowany',
        'description': 'Naucz się 50 słów'
      },
      'advanced': {'name': 'Zaawansowany', 'description': 'Naucz się 100 słów'},
      'expert': {'name': 'Ekspert', 'description': 'Naucz się 200 słów'},
      'master': {'name': 'Mistrz', 'description': 'Naucz się 300 słów'},
      'grandmaster': {
        'name': 'Arcymistrz',
        'description': 'Naucz się 500 słów'
      },
      'legend': {'name': 'Legenda', 'description': 'Naucz się 1000 słów'},
      'language_master': {
        'name': 'Mistrz Języka',
        'description': 'Naucz się 5000 słów'
      },
      'language_guru': {
        'name': 'Językowy Guru',
        'description': 'Naucz się 10000 słów'
      },
      'linguistics_master': {
        'name': 'Mistrz Lingwistyki',
        'description': 'Naucz się 25000 słów'
      }
    },
    'choose_your_course': "Wybierz swój kurs",
    'are_you_sure': 'Jesteś pewny?',
    'vocabulary': 'Słownictwo',
    'your_courses': 'Twoje kursy',
    'log_out': "Czy chcesz sie wylogować?",
    'asking_for_change_interface_language':
        "Czy chcesz zmienić swoj język interfejsu?",
    "theme": "Motyw",
    "register_account_is_ready": "Twoje konto jest gotowe!",
    "language_menu_information": "Wybierz język którego chcesz się nauczyć",
    "register_finish_text":
        "Gratulacje! Jesteś krokiem bliżej do osiągnięcia swoich celów językowych. Razem z nami zacznij przygodę z nauką!",
    "dialog_change_native_language_to_english":
        "Ten język jest dostępny tylko jeśli już znasz angielski. Czy chcesz zmienić swój ojczysty język na angielski?",
    "dialog_change_native_language_to_polish":
        "Ten język jest dostępny tylko jeśli już znasz język polski. Czy chcesz zmienić swój ojczysty język na język polski?",
    "home_screen_app_bar": "Kursy",
    "vocabulary_screen_app_bar": "Słownictwo",
    "vocabulary_screen_search_hint": "Wyszukaj kategorie",
    "topic_label": {
      'food': "Żywność",
      "animals": "Zwierzęta",
      'conversation': "Rozmowy",
      "colors": "Kolory"
    },
    "profile_screen_app_bar": "Profil",
    "profile_screen_courses_header": "Kursy",
    "profile_screen_statistics_header": "Statystyki",
    "profile_screen_days_in_a_row": "Dni z rzędu",
    "profile_screen_learned_words": "Nauczone słowa",
    "profile_screen_finished_topics": "Ukończone kursy",
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
    "quiz_next_button": "Następne pytanie",
    "quiz_finish_header": "Podsumowanie",
    "quiz_finish_your_score": "Wynik",
    "quiz_finish_percentage": "Procent poprawnych odpowiedzi:",
    "quiz_finish_repeat": "Powtórz quiz",
    "quiz_finish_home": "Zakończ",
    "no_achievements":
        "Osiągnięcia nie przychodzą łatwo, ale to właśnie sprawia, że są warte poświęcenia. Nie poddawaj się i wkrótce będziesz miał pełną półkę trofeów i dokonań!",
  },
  "english": {
    'in': 'in',
    'known_words': "Known Words",
    'choose_correct_translation': "Choose the Correct Translation",
    'learning': "Learning",
    'polish': "Polish",
    'btn_cancel': 'Cancel',
    'btn_ok': 'OK',
    'english_quiz': "English",
    'french_quiz': "French",
    'spanish_quiz': "Spanish",
    'polish_quiz': "Polish",
    'english': "English",
    'french': "French",
    'spanish': "Spanish",
    'achieved': "Achieved",
    'course': "Course",
    'select_course': "Select a Course",
    'incorrect_answer': "Incorrect Answer!",
    'correct_answer': "Correct Answer!",
    'locked': "Locked",
    'completed': "Completed",
    'review': "Review",
    'start': 'Start',
    'achievements': {
      'beginner': {'name': 'Beginner', 'description': 'Learn 10 words'},
      'intermediate': {'name': 'Intermediate', 'description': 'Learn 50 words'},
      'advanced': {'name': 'Advanced', 'description': 'Learn 100 words'},
      'expert': {'name': 'Expert', 'description': 'Learn 200 words'},
      'master': {'name': 'Master', 'description': 'Learn 300 words'},
      'grandmaster': {'name': 'Grandmaster', 'description': 'Learn 500 words'},
      'legend': {'name': 'Legend', 'description': 'Learn 1000 words'},
      'language_master': {
        'name': 'Language Master',
        'description': 'Learn 5000 words'
      },
      'language_guru': {
        'name': 'Language Guru',
        'description': 'Learn 10000 words'
      },
      'linguistics_master': {
        'name': 'Linguistics Master',
        'description': 'Learn 25000 words'
      }
    },
    'finish': 'Finish',
    'check': 'Check',
    'confirm': "Confirm",
    'continue': 'Continue',
    'congratulations': 'Congratulations!',
    'quiting_quiz': "If you quit now, you will lose all progress",
    'completed_topic': "You have successfully completed this topic",
    'learned_words': "Learned Words",
    'new_learned_words': 'Newly Learned Words',
    'achievements_everything': "Achievements - Everything",
    'achievements_only_achieved': "Achievements - Achieved",
    'achievements_locked': "Achievements - Locked",
    'choose_your_course': "Choose Your Course",
    'are_you_sure': 'Are you sure?',
    'vocabulary': 'Vocabulary',
    'your_courses': 'Your Courses',
    'log_out': "Do you want to log out?",
    'asking_for_change_interface_language':
        "Do you want to change your interface language?",
    "theme": "Theme",
    "register_account_is_ready": "Your account is ready!",
    "language_menu_information": "Choose the language you want to learn",
    "register_finish_text":
        "Congratulations! You're one step closer to achieving your language goals. Start your learning adventure with us!",
    "dialog_change_native_language_to_english":
        "This language is only available if you already know English. Do you want to change your native language to English?",
    "dialog_change_native_language_to_polish":
        "This language is only available if you already know Polish. Do you want to change your native language to Polish?",
    "home_screen_app_bar": "Courses",
    "vocabulary_screen_app_bar": "Vocabulary",
    "vocabulary_screen_search_hint": "Search categories",
    "topic_label": {
      'food': "Food",
      "animals": "Animals",
      'conversation': "Conversation",
      "colors": "Colors"
    },
    "profile_screen_app_bar": "Profile",
    "profile_screen_courses_header": "Courses",
    "profile_screen_statistics_header": "Statistics",
    "profile_screen_days_in_a_row": "Days in a Row",
    "profile_screen_learned_words": "Learned Words",
    "profile_screen_finished_topics": "Completed Courses",
    "profile_screen_achievements": "Achievements",
    "settings_screen_app_bar": "Settings",
    "settings_screen_theme_description":
        "Choose a theme to define the look and feel of the app interface.",
    "settings_screen_interface_header": "Interface Language",
    "settings_screen_interface_description":
        "Use this option to change the interface language.",
    "settings_screen_choose_interface_language": "Choose Interface Language",
    "unexpected_error": "Something went wrong",
    "quiz_settings_learn": "Learn",
    "quiz_settings_review": "Review",
    "finished_topic_announcement":
        "Congratulations! You have completed the topic:",
    "no_words_to_review_announcement": "You have no words to review",
    "warning_dialog_header": "Warning!",
    "exit_dialog_description":
        "Are you sure you want to exit? If so, you will lose your progress.",
    "dialog_yes": "Yes",
    "dialog_no": "No",
    "quiz_next_button": "Next Question",
    "quiz_finish_header": "Summary",
    "quiz_finish_your_score": "Your Score",
    "quiz_finish_percentage": "Percentage of Correct Answers:",
    "quiz_finish_repeat": "Repeat Quiz",
    "quiz_finish_home": "Finish",
    "no_achievements":
        "Achievements don't come easy, but that's what makes them worth it. Don't give up, and soon you'll have a full shelf of trophies and accomplishments!",
  }
};
