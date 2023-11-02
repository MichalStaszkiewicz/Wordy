import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/domain/models/active_course.dart';
import 'package:wordy/domain/repositiories/stream_repository.dart';
import 'package:wordy/presentation/Bloc/courses_update/courses_update_bloc.dart';
import 'package:wordy/presentation/widgets/loading_data.dart';
import 'package:wordy/presentation/screens/selected_course_screen/selected_course_ready.dart';

import '../../../global/course_progress_tracker.dart';
import '../../../utility/locator/service_locator.dart';

class SelectedCourseScreen extends StatefulWidget {
  const SelectedCourseScreen({super.key});

  @override
  State<SelectedCourseScreen> createState() => _SelectedCourseScreenState();
}

class _SelectedCourseScreenState extends State<SelectedCourseScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => CourseProgressTracker(),
        child: Consumer<CourseProgressTracker>(
          builder: (context, model, child) => BlocProvider(
            create: (context) => CoursesUpdateBloc(locator<StreamRepository>())
              ..add(const CurrentCourseInitial()),
            child: BlocBuilder<CoursesUpdateBloc, CoursesUpdateState>(
              builder: (context, state) {
                if (state is CourseTopicsLoaded) {
                  ActiveCourse? beforeQuizCopy;
                  if (model.beforeQuiz == null) {
                    model.beforeQuiz = state.course;
                    beforeQuizCopy = model.beforeQuiz;
                  } else {
                    beforeQuizCopy =
                       model.beforeQuiz;
                    locator<CourseProgressTracker>().beforeQuiz = state.course;
                  }

                  return SelectedCourseReady(
                    beforeQuizCopy: beforeQuizCopy,
                  );
                } else if (state is CourseUpdateError) {
                  DialogManager.showErrorDialog(state.error, context, () {
                    context.pop();
                  });
                  return Container();
                } else {
                  return const LoadingData();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
