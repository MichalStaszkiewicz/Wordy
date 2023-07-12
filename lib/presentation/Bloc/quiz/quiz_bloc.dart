import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/Utility/socket_manager.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/achievement.dart';
import 'package:wordy/domain/models/custom_error.dart';
import 'package:wordy/domain/models/progress_in_topic.dart';
import 'package:wordy/domain/models/question.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../../Utility/locator/service_locator.dart';
import '../../../const/enums.dart';
import '../../../data/network/exceptions/exception_helper.dart';
import '../../../data/network/request/quiz_summary_request.dart';
import '../../../data/network/response/achievement_list_response.dart';
import '../../../domain/logic/quiz_logic.dart';

import '../../../domain/models/user_active_courses_progress.dart';
import '../../../domain/models/vocabulary_question.dart';
import '../../../domain/repositiories/stream_repository.dart';
import '../../../global/course_progress_tracker.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final StreamRepository socketRepository;
  final socketManager = locator<SocketManager>();
  final userService = locator<UserService>();
  final quizLogic = locator<QuizLogic>();

  List<int> correctAnswersCount = [];
  List<int> incorrectAnsersCount = [];
  int currentQuestionIndex = 0;
  late final String courseName;
  late List<VocabularyQuestion> questions;
  final List<int> learnedWordsIds = [];
  QuizBloc(
    this.socketRepository,
  ) : super(const QuizInitial()) {
    loadBeginnerQuiz();
    loadNextQuestion();
    finishQuiz();
    selectAnswer();
    checkAnswer();
  }

  void loadBeginnerQuiz() {
    on<LoadBeginnerQuiz>((event, emit) async {
      emit(const InProgress());
      var questionsData;
      QuizType quizType = locator<CourseProgressTracker>().quizType;

      if (quizType == QuizType.learning) {
        questionsData = await quizLogic.createLearningQuiz(event.topic);
      }
      if (quizType == QuizType.review) {
        questionsData = await quizLogic.createReviewQuiz(event.topic);
      }

      final courseNameData = await userService.getUserCurrentCourse();
      if (courseNameData.isError) {
        emit(QuizError(
            error: ExceptionHelper.getErrorMessage(courseNameData.error!)));
      }

      if (questionsData.isData) {
        courseName = courseNameData.data!.course.name;
        questions = questionsData.data!;
        emit(QuizQuestionState(
            question: questions[currentQuestionIndex],
            selectedIndex: null,
            answerChecked: false));
      } else {
        emit(QuizError(
            error: ExceptionHelper.getErrorMessage(questionsData.error!)));
      }
    });
  }

  void selectAnswer() {
    on<SelectAnswer>((event, emit) {
      final state = this.state as QuizQuestionState;

      emit(QuizQuestionState(
        question: state.question,
        selectedIndex: event.selectedIndex,
        answerChecked: false,
      ));
    });
  }

  void checkAnswer() {
    on<CheckAnswer>((event, emit) {
      final state = this.state as QuizQuestionState;
      emit(QuizQuestionState(
          question: questions[currentQuestionIndex],
          selectedIndex: state.selectedIndex,
          answerChecked: true));
    });
  }

  void loadNextQuestion() {
    on<LoadNextQuestion>((event, emit) {
      final state = this.state as QuizQuestionState;
      if (questions[currentQuestionIndex].correctAnswerIndex ==
          state.selectedIndex) {
        currentQuestionIndex++;
        emit(QuizQuestionState(
            question: questions[currentQuestionIndex],
            selectedIndex: null,
            answerChecked: false));
      } else {
        VocabularyQuestion question = questions.elementAt(currentQuestionIndex);

        questions = List.from(questions)..removeAt(currentQuestionIndex);
        questions.add(question);

        emit(QuizQuestionState(
            question: questions[currentQuestionIndex],
            selectedIndex: null,
            answerChecked: false));
      }
    });
  }

  void finishQuiz() {
    on<FinishQuiz>((event, emit) async {
      emit(InProgress());
      final token = await userService.getTokenAccess();
      var quizType = locator<CourseProgressTracker>().quizType;
      if (token.isError) {
        emit(QuizError(error: ExceptionHelper.getErrorMessage(token.error!)));
      }
      if (quizType == "Learning") {
        await quizLogic.insertLearnedWords(event.wordIds).then((value) async {
          socketManager
              .quizSummary(QuizSummary(token: token.data!, topic: event.topic));
          var currentCourse = await userService.getUserCurrentCourseProgress();

          if (currentCourse.isError) {
            emit(QuizError(
                error: ExceptionHelper.getErrorMessage(currentCourse.error!)));
          } else {
            locator<CourseProgressTracker>().afterQuiz = currentCourse.data;

            ProgressInTopic progress = currentCourse.data!.topicProgress
                .firstWhere((element) => element.name == event.topic);
            if (progress.knownWords == progress.wordsCount) {
              emit(QuizCompleted(
                topicCompleted: true,
              ));
            } else {
              emit(QuizCompleted(
                topicCompleted: false,
              ));
            }
          }
        });
      } else {
        emit(QuizCompleted(topicCompleted: false));
      }
    });
  }
}
