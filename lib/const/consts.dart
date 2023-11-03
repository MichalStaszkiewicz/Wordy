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
final Map<String, Map<String, dynamic>> translate = {
  "polish": {
    'server_messages': {
      'session': {
        'title': "Błąd sesji",
        'message':
            'Nie mogliśmy zweryfikować Twojej sesji. Teraz zostaniesz wylogowany. Przepraszamy za trudności.'
      },
      'unexpected_error': {
        'title': "Ups",
        'message':
            "Niespodziewany błąd. Zostaniesz wylogowany. Przepraszamy za trudności."
      },
      'unknown_error': "Nieznany błąd",
      'error': "Błąd",
      'server_loading_data_error':
          "Wystąpił błąd podczas próby ładowania danych z serwera.",
      'request_canceled': "Żądanie zostało anulowane",
      'timeout':
          "Wygląda na to, że serwer zbyt długo nie odpowiada, może to być spowodowane słabym połączeniem lub błędem na naszych serwerach. Spróbuj ponownie za chwilę",
      'lost_connection':
          "Wystąpił błąd z Twoim połączeniem. Sprawdź swoją sieć",
      "user_exists": "Użytkownik o podanym adresie e-mail już istnieje",
      "user_does_not_exists":
          "Użytkownik o podanym adresie e-mail nie istnieje",
      "invalid_password": "Nieprawidłowe hasło",
    },
    'error_messages': {
      'validation': {
        'fill_fields': "Wypełnij wszystkie pola",
        'error': "Błąd walidacji",
        'bad_email_format': "Nieprawidłowy format adresu email",
        'short_password': "Hasło musi mieć co najmniej 5 znaków",
        'required_field': "To pole jest wymagane",
      },
      'interface_language_not_set': 'Nie ustawiono języka interfejsu',
    },
    'messages': {
      'app_prepare':
          "Przygotowujemy aplikację do pracy dla ciebie! Dziękujemy za cierpliwość",
      'loading': "Ładowanie",
      'language_conflict':
          "Ta czynność zmieni język interfejsu. Czy chcesz kontynuować?",
      'are_you_sure': "Jesteś pewien?",
      "select_language": "Musisz wybrać język, który chcesz się nauczyć",
    },
    'auth_form': {
      'messages': {
        'verified_token': "Token zweryfikowany pomyślnie",
        'sended_token':
            "Wysłaliśmy ci e-mail z tokenem. Sprawdź również folder spam",
        'updated_password': "Hasło zaktualizowane pomyślnie",
        'creating_account_progress': "Tworzenie twojego konta, prosimy czekać",
        'loading_in_progress': "Trwa ładowanie",
        'register_account_success': "Zarejestrowałeś konto pomyślnie",
        'requried_field': "To pole jest wymagane"
      },
      'full_name': "Imię i Nazwisko",
      'login': "Zaloguj się",
      'register': "Zarejestruj się",
      'email': "E-mail",
      'password': "Hasło",
      'submit': "Wyślij",
      'reset_password': "Zresetuj hasło",
      'forgot_password': "Zapomniałeś hasła?",
      'first_time_user': "Nie masz konta? Stwórz je",
      'create_account': "Stwórz konto",
      'already_registered': "Masz już konto? Zaloguj się",
      'type_reset_password_token': "Wprowadź kod resetowania hasła",
      'new_password': "Wprowadź nowe hasło",
      'back_to_login': "Powrót do logowania"
    },
    'in': 'w',
    'known_words': "Znane słowa",
    'choose_correct_translation': "Wybierz poprawne tłumaczenie",
    'learning': "Nauka",
    'polish': "Polski",
    'btn_cancel': 'Anuluj',
    'btn_ok': 'OK',
    'english_quiz': "Angielski",
    'french_quiz': "Francuski",
    'spanish_quiz': "Hiszpański",
    'polish_quiz': "Polski",
    'english': "Angielski",
    'french': "Francuski",
    'spanish': "Hiszpański",
    'achieved': "Osiągnięto",
    'course': "Kurs",
    'select_course': "Wybierz kurs",
    'incorrect_answer': "Nieprawidłowa odpowiedź",
    'correct_answer': "Prawidłowa odpowiedź",
    'locked': "Zablokowane",
    'completed': "Ukończono",
    'review': "Powtórka",
    'start': 'Rozpocznij',
    'achievements': {
      'beginner': {'name': 'Początkujący', 'description': 'Naucz się 10 słów'},
      'intermediate': {
        'name': 'Średniozaawansowany',
        'description': 'Naucz się 50 słów'
      },
      'advanced': {'name': 'Zaawansowany', 'description': 'Naucz się 100 słów'},
      'expert': {'name': 'Ekspert', 'description': 'Naucz się 200 słów'},
      'master': {'name': 'Mistrz', 'description': 'Naucz się 300 słów'},
      'grandmaster': {
        'name': 'Wielki Mistrz',
        'description': 'Naucz się 500 słów'
      },
      'legend': {'name': 'Legenda', 'description': 'Naucz się 1000 słów'},
      'language_master': {
        'name': 'Mistrz Języka',
        'description': 'Naucz się 5000 słów'
      },
      'language_guru': {
        'name': 'Guru Języka',
        'description': 'Naucz się 10000 słów'
      },
      'linguistics_master': {
        'name': 'Mistrz Lingwistyki',
        'description': 'Naucz się 25000 słów'
      }
    },
    'finish': 'Zakończ',
    'check': 'Sprawdź',
    'confirm': "Potwierdź",
    'continue': 'Kontynuuj',
    'congratulations': 'Gratulacje!',
    'quiting_quiz': "Jeśli teraz zrezygnujesz, utracisz cały postęp",
    'completed_topic': "Ukończyłeś ten temat pomyślnie",
    'learned_words': "Nauczone słowa",
    'new_learned_words': 'Nowo Nauczone Słowa',
    'achievements_everything': "Osiągnięcia - Wszystko",
    'achievements_only_achieved': "Osiągnięcia - Osiągnięte",
    'achievements_locked': "Osiągnięcia - Zablokowane",
    'choose_your_course': "Wybierz swój kurs",
    'are_you_sure': 'Jesteś pewien?',
    'vocabulary': 'Słownictwo',
    'your_courses': 'Twoje Kursy',
    'log_out': "Czy chcesz się wylogować?",
    'asking_for_change_interface_language':
        "Czy chcesz zmienić język interfejsu?",
    "theme": "Motyw",
    "register_account_is_ready": "Twoje konto jest gotowe!",
    "language_menu_information": "Wybierz język, który chcesz się nauczyć",
    "register_finish_text":
        "Gratulacje! Jesteś o krok bliżej do osiągnięcia swoich celów językowych. Rozpocznij swoją przygodę z nauką z nami!",
    "dialog_change_native_language_to_english":
        "Ten język jest dostępny tylko, jeśli już znasz angielski. Czy chcesz zmienić swój język ojczysty na angielski?",
    "dialog_change_native_language_to_polish":
        "Ten język jest dostępny tylko, jeśli już znasz polski. Czy chcesz zmienić swój język ojczysty na polski?",
    "home_screen_app_bar": "Kursy",
    "vocabulary_screen_app_bar": "Słownictwo",
    "vocabulary_screen_search_hint": "Szukaj kategorii",
    "topic_label": {
      'food': "Jedzenie",
      "animals": "Zwierzęta",
      'conversation': "Rozmowa",
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
        "Wybierz motyw, aby zdefiniować wygląd interfejsu aplikacji.",
    "settings_screen_interface_header": "Język interfejsu",
    "settings_screen_interface_description":
        "Użyj tej opcji, aby zmienić język interfejsu.",
    "settings_screen_choose_interface_language": "Wybierz język interfejsu",
    "unexpected_error": "Coś poszło nie tak",
    "quiz_settings_learn": "Nauka",
    "quiz_settings_review": "Powtórka",
    "finished_topic_announcement": "Gratulacje! Ukończyłeś temat:",
    "no_words_to_review_announcement": "Nie masz słów do powtórki",
    "warning_dialog_header": "Ostrzeżenie!",
    "exit_dialog_description":
        "Czy na pewno chcesz wyjść? Jeśli tak, utracisz swój postęp.",
    "dialog_yes": "Tak",
    "dialog_no": "Nie",
    "quiz_next_button": "Następne pytanie",
    "quiz_finish_header": "Podsumowanie",
    "quiz_finish_your_score": "Twój wynik",
    "quiz_finish_percentage": "Procent poprawnych odpowiedzi:",
    "quiz_finish_repeat": "Powtórz quiz",
    "quiz_finish_home": "Zakończ",
    "no_achievements":
        "Osiągnięcia nie przychodzą łatwo, ale to sprawia, że są warte zachodu. Nie poddawaj się, a niedługo będziesz miał pełną półkę trofeów i osiągnięć!"
  },
  "english": {
    'server_messages': {
      'session': {
        'title': "Session Error",
        'message':
            'We couldn\'t verify your session. You will be logged out now. Sorry for the difficulties.'
      },
      'unexpected_error': {
        'title': "Wops",
        'message':
            "Unexpected error you will be logged out. sorry for difficulties"
      },
      'unknown_error': "Unknown Error",
      'error': "error",
      'server_loading_data_error':
          "The error occurred when trying to load data from the server.",
      'request_canceled': "Request has been cancelled",
      'timeout':
          "Looks like the server is taking to long to respond, this can be caused by either poor connectivity or an error with our servers. Please try again in a while",
      'lost_connection':
          "There was an error with your connection. Please check your network",
      "user_exists": "The user with the provided email address already exists",
      "user_does_not_exists":
          "The user with the provided email address does not exist",
      "invalid_password": "Invalid password",
    },
    'error_messages': {
      'validation': {
        'fill_fields': "Fill all fields",
        'error': "Validation Error",
        'bad_email_format': "Invalid email format",
        'short_password': "Password must be at least 5 characters long",
        'required_field': "This field is required",
      },
      'interface_language_not_set': 'Interface Language Not Set',
    },
    'messages': {
      'app_prepare':
          "We are preparing app to work for you ! Thank you for patience",
      'loading': "Loading",
      'language_conflict':
          "This action will change your interface language. Do you want to continue?",
      'are_you_sure': "Are you sure ?",
      "select_language": "You have to select a language you want to learn",
    },
    'auth_form': {
      'messages': {
        'verified_token': "Successfully verified your token",
        'sended_token':
            "We sended you email with token . Please check your also spam",
        'updated_password': "Successfully updated password",
        'creating_account_progress': "Creating your account please Wait",
        'loading_in_progress': "Loading in progress",
        'register_account_success': "You successfully registered an account",
        'requried_field': "This field is required"
      },
      'full_name': "Full Name",
      'login': "Log In",
      'register': "Register",
      'email': "Email",
      'password': "Password",
      'submit': "Submit",
      'reset_password': "Reset Password",
      'forgot_password': "Forgot Password ?",
      'first_time_user': "Don't have an account? Create one",
      'create_account': "Create Account",
      'already_registered': "Already have an account? Log in",
      'type_reset_password_token': "Enter reset password code",
      'new_password': "Enter new password",
      'back_to_login': "Back to login"
    },
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
    'server_messages': {
      'session': {
        'title': "Error de sesión",
        'message':
            'No pudimos verificar su sesión. Ahora será desconectado. Disculpe las dificultades.'
      },
      'unexpected_error': {
        'title': "Ups",
        'message':
            "Error inesperado. Será desconectado. Disculpe las dificultades."
      },
      'unknown_error': "Error desconocido",
      'error': "error",
      'server_loading_data_error':
          "Se produjo un error al intentar cargar datos desde el servidor.",
      'request_canceled': "La solicitud ha sido cancelada",
      'timeout':
          "Parece que el servidor está tardando demasiado en responder, esto puede deberse a una mala conectividad o un error en nuestros servidores. Por favor, inténtelo de nuevo más tarde",
      'lost_connection':
          "Hubo un error con su conexión. Por favor, verifique su red",
      "user_exists":
          "El usuario con la dirección de correo electrónico proporcionada ya existe",
      "user_does_not_exists":
          "El usuario con la dirección de correo electrónico proporcionada no existe",
      "invalid_password": "Contraseña no válida",
    },
    'error_messages': {
      'validation': {
        'fill_fields': "Rellene todos los campos",
        'error': "Error de validación",
        'bad_email_format': "Formato de correo electrónico no válido",
        'short_password': "La contraseña debe tener al menos 5 caracteres",
        'required_field': "Este campo es obligatorio",
      },
      'interface_language_not_set': 'Idioma de interfaz no configurado',
    },
    "messages": {
      "app_prepare":
          "¡Estamos preparando la aplicación para que funcione para ti! Gracias por tu paciencia",
      "loading": "Cargando",
      "language_conflict":
          "Esta acción cambiará el idioma de tu interfaz. ¿Deseas continuar?",
      "are_you_sure": "¿Estás seguro?",
      "select_language": "Debes seleccionar un idioma que desees aprender"
    },
    "auth_form": {
      "messages": {
        "verified_token": "Token verificado exitosamente",
        "sended_token":
            "Te hemos enviado un correo electrónico con el token. Por favor, revisa también la carpeta de spam",
        "updated_password": "Contraseña actualizada con éxito",
        "creating_account_progress": "Creando tu cuenta. Por favor, espera",
        "loading_in_progress": "Cargando en progreso",
        "register_account_success": "Te has registrado exitosamente",
        "requried_field": "Este campo es obligatorio"
      },
      "full_name": "Nombre completo",
      "login": "Iniciar sesión",
      "register": "Registrarse",
      "email": "Correo electrónico",
      "password": "Contraseña",
      "submit": "Enviar",
      "reset_password": "Restablecer contraseña",
      "forgot_password": "¿Olvidaste tu contraseña?",
      "first_time_user": "¿No tienes una cuenta? Crea una",
      "create_account": "Crear cuenta",
      "already_registered": "¿Ya tienes una cuenta? Inicia sesión",
      "type_reset_password_token":
          "Ingresa el código de restablecimiento de contraseña",
      "new_password": "Ingresa una nueva contraseña",
      "back_to_login": "Volver a iniciar sesión"
    },
    "in": "en",
    "known_words": "Palabras Conocidas",
    "choose_correct_translation": "Elige la Traducción Correcta",
    "learning": "Aprendizaje",
    "polish": "Polaco",
    "btn_cancel": "Cancelar",
    "btn_ok": "Aceptar",
    "english_quiz": "Inglés",
    "french_quiz": "Francés",
    "spanish_quiz": "Español",
    "polish_quiz": "Polaco",
    "english": "Inglés",
    "french": "Francés",
    "spanish": "Español",
    "achieved": "Logrado",
    "course": "Curso",
    "select_course": "Selecciona un Curso",
    "incorrect_answer": "Respuesta Incorrecta",
    "correct_answer": "Respuesta Correcta",
    "locked": "Bloqueado",
    "completed": "Completado",
    "review": "Revisión",
    "start": "Comenzar",
    "achievements": {
      "beginner": {
        "name": "Principiante",
        "description": "Aprende 10 palabras"
      },
      "intermediate": {
        "name": "Intermedio",
        "description": "Aprende 50 palabras"
      },
      "advanced": {"name": "Avanzado", "description": "Aprende 100 palabras"},
      "expert": {"name": "Experto", "description": "Aprende 200 palabras"},
      "master": {"name": "Maestro", "description": "Aprende 300 palabras"},
      "grandmaster": {
        "name": "Gran Maestro",
        "description": "Aprende 500 palabras"
      },
      "legend": {"name": "Leyenda", "description": "Aprende 1000 palabras"},
      "language_master": {
        "name": "Maestro del Idioma",
        "description": "Aprende 5000 palabras"
      },
      "language_guru": {
        "name": "Gurú del Idioma",
        "description": "Aprende 10000 palabras"
      },
      "linguistics_master": {
        "name": "Maestro de Lingüística",
        "description": "Aprende 25000 palabras"
      }
    },
    "finish": "Finalizar",
    "check": "Verificar",
    "confirm": "Confirmar",
    "continue": "Continuar",
    "congratulations": "¡Felicidades!",
    "quiting_quiz": "Si sales ahora, perderás todo tu progreso",
    "completed_topic": "Has completado con éxito este tema",
    "learned_words": "Palabras Aprendidas",
    "new_learned_words": "Palabras Nuevas Aprendidas",
    "achievements_everything": "Logros - Todo",
    "achievements_only_achieved": "Logros - Logrados",
    "achievements_locked": "Logros - Bloqueados",
    "choose_your_course": "¿Estás seguro?",
    "vocabulary": "Vocabulario",
    "your_courses": "Tus Cursos",
    "log_out": "¿Deseas cerrar sesión?",
    "asking_for_change_interface_language":
        "¿Deseas cambiar el idioma de tu interfaz?",
    "theme": "Tema",
    "register_account_is_ready": "¡Tu cuenta está lista!",
    "language_menu_information": "Elige el idioma que deseas aprender",
    "register_finish_text":
        "¡Felicidades! Estás un paso más cerca de alcanzar tus objetivos de aprendizaje de idiomas. ¡Comienza tu aventura de aprendizaje con nosotros!",
    "dialog_change_native_language_to_english":
        "Este idioma solo está disponible si ya conoces el inglés. ¿Deseas cambiar tu idioma nativo al inglés?",
    "dialog_change_native_language_to_polish":
        "Este idioma solo está disponible si ya conoces el polaco. ¿Deseas cambiar tu idioma nativo al polaco?",
    "home_screen_app_bar": "Cursos",
    "vocabulary_screen_app_bar": "Vocabulario",
    "vocabulary_screen_search_hint": "Buscar categorías",
    "topic_label": {
      "food": "Comida",
      "animals": "Animales",
      "conversation": "Conversación",
      "colors": "Colores"
    },
    "profile_screen_app_bar": "Perfil",
    "profile_screen_courses_header": "Cursos",
    "profile_screen_statistics_header": "Estadísticas",
    "profile_screen_days_in_a_row": "Días seguidos",
    "profile_screen_learned_words": "Palabras aprendidas",
    "profile_screen_finished_topics": "Cursos completados",
    "profile_screen_achievements": "Logros",
    "settings_screen_app_bar": "Ajustes",
    "settings_screen_theme_description":
        "Elige un tema para definir el aspecto y la sensación de la interfaz de la aplicación.",
    "settings_screen_interface_header": "Idioma de interfaz",
    "settings_screen_interface_description":
        "Usa esta opción para cambiar el idioma de la interfaz.",
    "settings_screen_choose_interface_language": "Elegir Idioma de Interfaz",
    "unexpected_error": "Algo salió mal",
    "quiz_settings_learn": "Aprender",
    "quiz_settings_review": "Revisar",
    "finished_topic_announcement": "¡Felicidades! Has completado el tema:",
    "no_words_to_review_announcement": "No tienes palabras para revisar",
    "warning_dialog_header": "¡Advertencia!",
    "exit_dialog_description":
        "¿Estás seguro de que deseas salir? Si lo haces, perderás tu progreso.",
    "dialog_yes": "Sí",
    "dialog_no": "No",
    "quiz_next_button": "Siguiente Pregunta",
    "quiz_finish_header": "Resumen",
    "quiz_finish_your_score": "Tu Puntuación",
    "quiz_finish_percentage": "Porcentaje de Respuestas Correctas:",
    "quiz_finish_repeat": "Repetir Cuestionario",
    "quiz_finish_home": "Finalizar",
    "no_achievements":
        "Los logros no son fáciles de conseguir, pero eso es lo que los hace valiosos. ¡No te rindas y pronto tendrás una estantería llena de trofeos y logros!"
  },
  "french": {
    'server_messages': {
      'session': {
        'title': "Erreur de session",
        'message':
            "Nous n'avons pas pu vérifier votre session. Vous serez maintenant déconnecté. Désolé pour les difficultés."
      },
      'unexpected_error': {
        'title': "Oups",
        'message':
            "Erreur inattendue. Vous serez déconnecté. Désolé pour les difficultés."
      },
      'unknown_error': "Erreur inconnue",
      'error': "erreur",
      'server_loading_data_error':
          "Une erreur s'est produite lors de la tentative de chargement des données depuis le serveur.",
      'request_canceled': "La demande a été annulée",
      'timeout':
          "Il semble que le serveur mette trop de temps à répondre, cela peut être dû soit à une mauvaise connectivité, soit à une erreur de nos serveurs. Veuillez réessayer plus tard",
      'lost_connection':
          "Une erreur s'est produite avec votre connexion. Veuillez vérifier votre réseau",
      "user_exists": "L'utilisateur avec l'adresse email fournie existe déjà",
      "user_does_not_exists":
          "L'utilisateur avec l'adresse email fournie n'existe pas",
      "invalid_password": "Mot de passe invalide",
    },
    'error_messages': {
      'validation': {
        'fill_fields': "Remplissez tous les champs",
        'error': "Erreur de validation",
        'bad_email_format': "Format d'e-mail invalide",
        'short_password':
            "Le mot de passe doit comporter au moins 5 caractères",
        'required_field': "Ce champ est obligatoire",
      },
      'interface_language_not_set': 'Langue de l\'interface non définie',
    },
    'messages': {
      'app_prepare':
          "Nous préparons l'application pour vous ! Merci pour votre patience",
      'loading': "Chargement",
      'language_conflict':
          "Cette action changera la langue de l'interface. Voulez-vous continuer ?",
      'are_you_sure': "Êtes-vous sûr ?",
      "select_language":
          "Vous devez choisir la langue que vous souhaitez apprendre",
    },
    'auth_form': {
      'messages': {
        'verified_token': "Token vérifié avec succès",
        'sended_token':
            "Nous vous avons envoyé un e-mail avec le token. Veuillez également vérifier votre spam",
        'updated_password': "Mot de passe mis à jour avec succès",
        'creating_account_progress':
            "Création de votre compte, veuillez patienter",
        'loading_in_progress': "Chargement en cours",
        'register_account_success': "Vous avez créé un compte avec succès",
        'requried_field': "Ce champ est requis"
      },
      'full_name': "Nom complet",
      'login': "Se connecter",
      'register': "S'enregistrer",
      'email': "E-mail",
      'password': "Mot de passe",
      'submit': "Soumettre",
      'reset_password': "Réinitialiser le mot de passe",
      'forgot_password': "Mot de passe oublié ?",
      'first_time_user': "Vous n'avez pas de compte ? Créez-en un",
      'create_account': "Créer un compte",
      'already_registered': "Déjà un compte ? Connectez-vous",
      'type_reset_password_token':
          "Entrez le code de réinitialisation du mot de passe",
      'new_password': "Entrez un nouveau mot de passe",
      'back_to_login': "Retour à la connexion"
    },
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
