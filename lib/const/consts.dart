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
    'incorrect_answer': "Niepoprawna odpowiedź",
    'correct_answer': "Poprawna odpowiedź",
    'locked': "Zablokowane",
    'completed': "Ukończono",
    'review': "Powtórka",
    'start': 'Rozpocznij',
    'finish': 'Zakończ',
    'check': 'Sprawdź',
    'confirm': "Potwierdź",
    'continue': 'Kontynuuj',
    'congratulations': 'Gratulacje !',
    'quiting_quiz': "Jeżeli teraz wyjdziesz stracisz cały postęp",
    'completed_topic': "Udało ci sie ukonczyć ten temat",
    'learned_words': "Znane słowa",
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
    "finished_topic_announcement": "Gratulacje udało ci się ukończyć temat",
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
    'incorrect_answer': "Incorrect Answer",
    'correct_answer': "Correct Answer",
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
        "Achievements don't come easy, but that's what makes them worth it. Don't give up, and soon you'll have a full shelf of trophies and accomplishments!"
  },
  "spanish": {
    'in': 'en',
    'known_words': "Palabras Conocidas",
    'choose_correct_translation': "Elije la Traducción Correcta",
    'learning': "Aprendizaje",
    'polish': "Polaco",
    'btn_cancel': 'Cancelar',
    'btn_ok': 'Aceptar',
    'english_quiz': "Inglés",
    'french_quiz': "Francés",
    'spanish_quiz': "Español",
    'polish_quiz': "Polaco",
    'english': "Inglés",
    'french': "Francés",
    'spanish': "Español",
    'achieved': "Logrado",
    'course': "Curso",
    'select_course': "Selecciona un Curso",
    'incorrect_answer': "Respuesta Incorrecta",
    'correct_answer': "Respuesta Correcta",
    'locked': "Bloqueado",
    'completed': "Completado",
    'review': "Revisión",
    'start': 'Comenzar',
    'finish': 'Finalizar',
    'check': 'Comprobar',
    'confirm': "Confirmar",
    'continue': 'Continuar',
    'congratulations': '¡Felicidades!',
    'quiting_quiz': "Si sales ahora, perderás todo tu progreso",
    'completed_topic': "Has completado este tema exitosamente",
    'learned_words': "Palabras Aprendidas",
    'new_learned_words': 'Nuevas Palabras Aprendidas',
    'achievements_everything': "Logros - Todo",
    'achievements_only_achieved': "Logros - Logrados",
    'achievements_locked': "Logros - Bloqueados",
    'choose_your_course': "Elige Tu Curso",
    'are_you_sure': '¿Estás seguro?',
    'vocabulary': 'Vocabulario',
    'your_courses': 'Tus Cursos',
    'log_out': "¿Quieres cerrar sesión?",
    'asking_for_change_interface_language':
        "¿Deseas cambiar el idioma de la interfaz?",
    "theme": "Tema",
    "register_account_is_ready": "¡Tu cuenta está lista!",
    "language_menu_information": "Elige el idioma que deseas aprender",
    "register_finish_text":
        "¡Felicidades! Estás un paso más cerca de alcanzar tus objetivos de idioma. ¡Comienza tu aventura de aprendizaje con nosotros!",
    "dialog_change_native_language_to_english":
        "Este idioma solo está disponible si ya conoces el inglés. ¿Quieres cambiar tu idioma nativo al inglés?",
    "dialog_change_native_language_to_polish":
        "Este idioma solo está disponible si ya conoces el polaco. ¿Quieres cambiar tu idioma nativo al polaco?",
    "home_screen_app_bar": "Cursos",
    "vocabulary_screen_app_bar": "Vocabulario",
    "vocabulary_screen_search_hint": "Buscar categorías",
    "topic_label": {
      'food': "Comida",
      "animals": "Animales",
      'conversation': "Conversación",
      "colors": "Colores"
    },
    "profile_screen_app_bar": "Perfil",
    "profile_screen_courses_header": "Cursos",
    "profile_screen_statistics_header": "Estadísticas",
    "profile_screen_days_in_a_row": "Días seguidos",
    "profile_screen_learned_words": "Palabras Aprendidas",
    "profile_screen_finished_topics": "Cursos Completados",
    "profile_screen_achievements": "Logros",
    "settings_screen_app_bar": "Ajustes",
    "settings_screen_theme_description":
        "Elige un tema para definir la apariencia y la experiencia en la interfaz de la aplicación.",
    "settings_screen_interface_header": "Idioma de la Interfaz",
    "settings_screen_interface_description":
        "Utiliza esta opción para cambiar el idioma de la interfaz.",
    "settings_screen_choose_interface_language":
        "Elige el Idioma de la Interfaz",
    "unexpected_error": "Algo salió mal",
    "quiz_settings_learn": "Aprender",
    "quiz_settings_review": "Revisar",
    "finished_topic_announcement": "¡Felicidades! Has completado el tema",
    "no_words_to_review_announcement": "No tienes palabras para revisar",
    "warning_dialog_header": "¡Advertencia!",
    "exit_dialog_description":
        "¿Estás seguro de que quieres salir? Si lo haces, perderás tu progreso.",
    "dialog_yes": "Sí",
    "dialog_no": "No",
    "quiz_next_button": "Siguiente Pregunta",
    "quiz_finish_header": "Resumen",
    "quiz_finish_your_score": "Tu Puntuación",
    "quiz_finish_percentage": "Porcentaje de Respuestas Correctas:",
    "quiz_finish_repeat": "Repetir Cuestionario",
    "quiz_finish_home": "Finalizar",
    "no_achievements":
        "Los logros no son fáciles de conseguir, pero eso es lo que los hace valer la pena. ¡No te rindas y pronto tendrás una estantería llena de trofeos y logros!",
  },
  "french": {
    'in': 'en',
    'known_words': "Mots Connus",
    'choose_correct_translation': "Choisissez la Bonne Traduction",
    'learning': "Apprentissage",
    'polish': "Polonais",
    'btn_cancel': 'Annuler',
    'btn_ok': 'OK',
    'english_quiz': "Anglais",
    'french_quiz': "Français",
    'spanish_quiz': "Espagnol",
    'polish_quiz': "Polonais",
    'english': "Anglais",
    'french': "Français",
    'spanish': "Espagnol",
    'achieved': "Atteint",
    'course': "Cours",
    'select_course': "Sélectionnez un Cours",
    'incorrect_answer': "Réponse Incorrecte",
    'correct_answer': "Réponse Correcte",
    'locked': "Verrouillé",
    'completed': "Completé",
    'review': "Révision",
    'start': 'Commencer',
    'finish': 'Terminer',
    'check': 'Vérifier',
    'confirm': "Confirmer",
    'continue': 'Continuer',
    'congratulations': 'Félicitations !',
    'quiting_quiz':
        "Si vous quittez maintenant, vous perdrez tout votre progrès",
    'completed_topic': "Vous avez réussi à compléter ce sujet",
    'learned_words': "Mots Appris",
    'new_learned_words': 'Nouveaux Mots Appris',
    'achievements_everything': "Réalisations - Tout",
    'achievements_only_achieved': "Réalisations - Atteintes",
    'achievements_locked': "Réalisations - Verrouillées",
    'choose_your_course': "Choisissez Votre Cours",
    'are_you_sure': 'Êtes-vous sûr ?',
    'vocabulary': 'Vocabulaire',
    'your_courses': 'Vos Cours',
    'log_out': "Voulez-vous vous déconnecter ?",
    'asking_for_change_interface_language':
        "Voulez-vous changer la langue de l'interface ?",
    "theme": "Thème",
    "register_account_is_ready": "Votre compte est prêt !",
    "language_menu_information":
        "Choisissez la langue que vous voulez apprendre",
    "register_finish_text":
        "Félicitations ! Vous êtes un pas de plus vers l'atteinte de vos objectifs linguistiques. Commencez votre aventure d'apprentissage avec nous !",
    "dialog_change_native_language_to_english":
        "Cette langue n'est disponible que si vous connaissez déjà l'anglais. Voulez-vous changer votre langue maternelle en anglais ?",
    "dialog_change_native_language_to_polish":
        "Cette langue n'est disponible que si vous connaissez déjà le polonais. Voulez-vous changer votre langue maternelle en polonais ?",
    "home_screen_app_bar": "Cours",
    "vocabulary_screen_app_bar": "Vocabulaire",
    "vocabulary_screen_search_hint": "Rechercher des catégories",
    "topic_label": {
      'food': "Nourriture",
      "animals": "Animaux",
      'conversation': "Conversation",
      "colors": "Couleurs"
    },
    "profile_screen_app_bar": "Profil",
    "profile_screen_courses_header": "Cours",
    "profile_screen_statistics_header": "Statistiques",
    "profile_screen_days_in_a_row": "Jours d'affilée",
    "profile_screen_learned_words": "Mots Appris",
    "profile_screen_finished_topics": "Cours Terminés",
    "profile_screen_achievements": "Réalisations",
    "settings_screen_app_bar": "Paramètres",
    "settings_screen_theme_description":
        "Choisissez un thème pour définir l'apparence et l'expérience de l'interface de l'application.",
    "settings_screen_interface_header": "Langue de l'Interface",
    "settings_screen_interface_description":
        "Utilisez cette option pour changer la langue de l'interface.",
    "settings_screen_choose_interface_language":
        "Choisissez la Langue de l'Interface",
    "unexpected_error": "Quelque chose s'est mal passé",
    "quiz_settings_learn": "Apprendre",
    "quiz_settings_review": "Révision",
    "finished_topic_announcement":
        "Félicitations ! Vous avez terminé le sujet :",
    "no_words_to_review_announcement": "Vous n'avez aucun mot à réviser",
    "warning_dialog_header": "Attention !",
    "exit_dialog_description":
        "Êtes-vous sûr de vouloir quitter ? Si c'est le cas, vous perdrez votre progrès.",
    "dialog_yes": "Oui",
    "dialog_no": "Non",
    "quiz_next_button": "Question Suivante",
    "quiz_finish_header": "Résumé",
    "quiz_finish_your_score": "Votre Score",
    "quiz_finish_percentage": "Pourcentage de Réponses Correctes :",
    "quiz_finish_repeat": "Répéter le Quiz",
    "quiz_finish_home": "Terminer",
    "no_achievements":
        "Les réalisations ne viennent pas facilement, mais c'est ce qui les rend précieuses. Ne renoncez pas, bientôt vous aurez une étagère pleine de trophées et de réussites !",
  }
};
