import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordy/Utility/socket_manager.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/achievement.dart';
import 'package:wordy/domain/models/custom_error.dart';
import 'package:wordy/domain/models/progress_in_topic.dart';
import 'package:wordy/domain/repositiories/repository.dart';

import '../../../Utility/locator/service_locator.dart';
import '../../../data/network/exceptions/exception_helper.dart';
import '../../../data/network/request/quiz_summary_request.dart';
import '../../../data/network/response/achievement_list_response.dart';
import '../../../domain/logic/quiz_logic.dart';
import '../../../domain/models/beginner_question.dart';
import '../../../domain/models/user_active_courses_progress.dart';
import '../../../domain/repositiories/stream_repository.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final StreamRepository socketRepository;
  final socketManager = locator<SocketManager>();

  QuizBloc(this.socketRepository) : super(const QuizInitial()) {
    loadBeginnerQuiz();
    loadNextQuestion();
    finishQuiz();
    selectAnswer();
    checkAnswer();
  }

  void loadBeginnerQuiz() {
    on<LoadBeginnerQuiz>((event, emit) async {
      final quizLogic = locator<QuizLogic>();
      emit(const InProgress());
      var questions = await quizLogic.createBeginnerQuiz(event.topic);
      final courseName = await locator<UserService>().getUserCurrentCourse();
      if (courseName.isError) {
        emit(QuizError(
            error: ExceptionHelper.getErrorMessage(courseName.error!)));
      }

      if (questions.isData) {
        emit(BeginnerQuizLoaded(
          questions: questions.data!,
          answerChecked: false,
          currentQuestionIndex: 0,
          selectedIndex: null,
          correctAnswersWordIndexes: const [],
          courseName: courseName.data!.course.name,
        ));
      } else {
        emit(QuizError(
            error: ExceptionHelper.getErrorMessage(questions.error!)));
      }
    });
  }

  void selectAnswer() {
    on<SelectAnswer>((event, emit) {
      final state = this.state as BeginnerQuizLoaded;
      List<int> correctIndexes = List.from(state.correctAnswersWordIndexes);
      if (state.questions[state.currentQuestionIndex].correctAnswerIndex ==
          event.selectedIndex) {
        correctIndexes.add(state.questions[state.currentQuestionIndex].wordId);
      }
      emit(BeginnerQuizLoaded(
        questions: state.questions,
        answerChecked: false,
        currentQuestionIndex: state.currentQuestionIndex,
        selectedIndex: event.selectedIndex,
        correctAnswersWordIndexes: correctIndexes,
        courseName: state.courseName,
      ));
    });
  }

  void checkAnswer() {
    on<CheckAnswer>((event, emit) {
      final state = this.state as BeginnerQuizLoaded;

      emit(BeginnerQuizLoaded(
        questions: state.questions,
        answerChecked: true,
        currentQuestionIndex: state.currentQuestionIndex,
        selectedIndex: state.selectedIndex,
        correctAnswersWordIndexes: state.correctAnswersWordIndexes,
        courseName: state.courseName,
      ));
    });
  }

  void loadNextQuestion() {
    on<LoadNextQuestion>((event, emit) {
      final state = this.state as BeginnerQuizLoaded;
      if (state.questions[state.currentQuestionIndex].correctAnswerIndex ==
          state.selectedIndex) {
        emit(BeginnerQuizLoaded(
          answerChecked: false,
          questions: state.questions,
          currentQuestionIndex: state.currentQuestionIndex + 1,
          correctAnswersWordIndexes: state.correctAnswersWordIndexes,
          selectedIndex: null,
          courseName: state.courseName,
        ));
      } else {
        List<BeginnerQuestion> questions = List.from(state.questions)
          ..removeAt(state.currentQuestionIndex);
        questions.add(state.questions[state.currentQuestionIndex]);
        emit(BeginnerQuizLoaded(
          questions: questions,
          answerChecked: false,
          currentQuestionIndex: state.currentQuestionIndex,
          correctAnswersWordIndexes: state.correctAnswersWordIndexes,
          selectedIndex: null,
          courseName: state.courseName,
        ));
      }
    });
  }

  void finishQuiz() {
    on<FinishQuiz>((event, emit) async {
      final quizLogic = locator<QuizLogic>();
      final token = await locator<Repository>().getTokenAccess();
      if (token.isError) {
        emit(QuizError(error: ExceptionHelper.getErrorMessage(token.error!)));
      }

      await quizLogic.insertLearnedWords(event.wordIds).then((value) async {
        locator<SocketManager>()
            .quizSummary(QuizSummary(token: token.data!, topic: event.topic));
        var currentCourse =
            await locator<UserService>().getUserCurrentCourseProgress();
        if (currentCourse.isError) {
          emit(QuizError(
              error: ExceptionHelper.getErrorMessage(currentCourse.error!)));
        } else {
          ProgressInTopic progress = currentCourse.data!.topicProgress
              .firstWhere((element) => element.name == event.topic);
          if (progress.knownWords == progress.wordsCount) {
            emit(QuizCompleted(topicCompleted: true));
          } else {
            emit(QuizCompleted(topicCompleted: false));
          }
        }
      });
    });
  }
}
