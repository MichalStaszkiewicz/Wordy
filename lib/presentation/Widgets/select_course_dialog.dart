import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/domain/repositiories/stream_repository.dart';
import 'package:wordy/presentation/widgets/bouncing_widget.dart';
import 'package:wordy/presentation/widgets/quiz_next_button.dart';

import '../../Utility/dialog_manager.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/consts.dart';
import '../../data/network/exceptions/exception_helper.dart';
import '../../data/network/exceptions/unexpected_error.dart';

import '../../domain/models/course.dart';
import '../../global/global_data_manager.dart';
import '../bloc/courses_update/courses_update_bloc.dart';
import 'language_tile.dart';
import 'loading_data.dart';

class SelectCourseDialog extends StatefulWidget {
  SelectCourseDialog({super.key, required this.availableCourses});
  List<Course> availableCourses;

  @override
  State<SelectCourseDialog> createState() => _SelectCourseDialogState();
}

class _SelectCourseDialogState extends State<SelectCourseDialog> {
  String selectedCourse = '';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoursesUpdateBloc(locator<StreamRepository>())
        ..add(const LoadAvailableCourses()),
      child: Dialog(child: BlocBuilder<CoursesUpdateBloc, CoursesUpdateState>(
        builder: (context, state) {
          if (state is AvailableCoursesLoaded) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                        'select_course'],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        itemCount: widget.availableCourses.length,
                        itemBuilder: (context, index) => LanguageTile(
                              imagePath: widget.availableCourses[index].image,
                              language: ui_lang['english']![
                                  widget.availableCourses[index].name],
                              onSelect: () {
                            
                                context.read<CoursesUpdateBloc>().add(
                                    UpdateSelectedCourse(
                                        courseName: widget
                                            .availableCourses[index].name));
                              },
                              selectedLangauge: state.selectedCourse,
                            )),
                  ),
                  const SizedBox(height: 40),
                  BouncingWidget(
                    onPress: () {},
                    child: CustomAnimatedButton(
                      height: 40,
                      label: ui_lang[locator<GlobalDataManager>()
                          .interfaceLanguage]!['start'],
                      margin: EdgeInsets.zero,
                      onTap: () {
                        if (state.selectedCourse != '') {
                          context.read<CoursesUpdateBloc>().add(AddNewCourse(
                              selectedCourse: state.selectedCourse));

                          context.pop();
                        } else {
                          context.pop();
                        }
                      },
                      filled: state.selectedCourse != '' ? true : false,
                      width: 300,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is CourseUpdateError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              DialogManager.showErrorDialog(
                ExceptionHelper.getErrorMessage(UnexpectedError()),
                context,
                () {},
              );
            });
            return Container();
          } else {
            return const LoadingData();
          }
        },
      )),
    );
  }
}
