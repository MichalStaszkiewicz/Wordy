import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/domain/logic/user_service.dart';

import '../../Utility/dialog_manager.dart';
import '../../Utility/locator/api_locator.dart';
import '../../data/network/exceptions/exception_helper.dart';
import '../../data/network/exceptions/unexpected_error.dart';
import '../../data/network/request/models/update_user_current_course_request_model.dart';

import '../bloc/courses_update/courses_update_bloc.dart';
import 'language_tile.dart';
import 'loading_data.dart';

class SelectCourseDialog extends StatefulWidget {
  const SelectCourseDialog({super.key});

  @override
  State<SelectCourseDialog> createState() => _SelectCourseDialogState();
}

class _SelectCourseDialogState extends State<SelectCourseDialog> {
  String selectedCourse = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursesUpdateBloc()..add(LoadAvailableCourses()),
      child: Dialog(child: BlocBuilder<CoursesUpdateBloc, CoursesUpdateState>(
        builder: (context, state) {
          if (state is AvailableCoursesLoaded) {
            return Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Select Course',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                        itemCount: state.courses.length,
                        itemBuilder: (context, index) => LanguageTile(
                              imagePath: state.courses[index].image,
                              language: state.courses[index].name,
                              onSelect: () {
                                context.read<CoursesUpdateBloc>().add(
                                    UpdateSelectedCourse(
                                        courseName: state.courses[index].name));
                              },
                              selectedLangauge: state.selectedCourse,
                            )),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (state.selectedCourse != '') {
                        locator<UserService>().updateUserCurrentCourse(
                            UpdateUserCurrentCourseModel(
                                userId: '', courseName: state.selectedCourse));
                      } else {
                        context.pop();
                      }
                    },
                    child: Text('Start'),
                  ),
                ],
              ),
            );
          } else if (state is CourseUpdateError) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              DialogManager.showErrorDialog(
                ExceptionHelper.getErrorMessage(UnexpectedError()),
                context,
                () {},
              );
            });
            return Container();
          } else {
            return LoadingData();
          }
        },
      )),
    );
  }
}
