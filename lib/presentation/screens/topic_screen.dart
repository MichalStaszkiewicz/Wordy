import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/domain/logic/user_service.dart';

import '../../data/network/request/models/update_user_current_course_request_model.dart';
import '../../utility/locator/api_locator.dart';

import '../bloc/courses_update/courses_update_bloc.dart';
import '../widgets/add_new_course_item.dart';
import '../widgets/circular_precentage_chart.dart';
import '../widgets/course_item.dart';
import '../widgets/current_course_widget.dart';
import '../widgets/daily_challange_widget.dart';
import '../widgets/difficulty_level_widget.dart';
import '../widgets/language_tile.dart';
import '../widgets/loading_data.dart';

class TopicScreen extends StatefulWidget {
  TopicScreen();

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  var dialogShowed = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            child: BlocProvider<CoursesUpdateBloc>(
                create: (context) => CoursesUpdateBloc()..add(LoadCourses()),
                child: BlocBuilder<CoursesUpdateBloc, CoursesUpdateState>(
                  builder: (context, state) {
                    if (state is CoursesLoaded) {
                      return CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            primary: false,
                            flexibleSpace: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                            ),
                            pinned: true,
                            title: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.format_align_left_sharp,
                                      color: Colors.black),
                                  Container(
                                    width: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 35,
                                          child: Image.network(Urls.kImageUrl +
                                              state
                                                  .courses
                                                  .currentCourse
                                                  .userCourse
                                                  .interfaceLanguage
                                                  .image),
                                        ),
                                        Text(
                                            state
                                                .courses
                                                .currentCourse
                                                .userCourse
                                                .interfaceLanguage
                                                .name
                                                .capitalize!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(color: Colors.black)),
                                        Container(
                                            height: 20,
                                            alignment: Alignment.bottomCenter,
                                            child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                color: Colors.black))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: CurrentCourseWidget(
                              currentCourse: state.courses.currentCourse,
                              label: state.courses.currentCourse.userCourse
                                  .difficulty.beginner.name.capitalize!,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: DailyChallangeWidget(
                              difficultyLevel: "Expert",
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: const SizedBox(
                              height: 30,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(left: 25),
                              child: Text(
                                'Your courses',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ),
                          const SliverToBoxAdapter(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 170,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.availablCoursesCount > 0
                                        ? state.courses.activeCourses.length + 1
                                        : 0,
                                    itemBuilder: (context, index) {
                                      if (index ==
                                          state.courses.activeCourses.length) {
                                        return GestureDetector(
                                            onTap: () {
                                              DialogManager
                                                  .showSelectNewCourseDialog(
                                                      context);
                                            },
                                            child: AddNewCourseItem());
                                      } else {
                                        return GestureDetector(
                                            onTap: () async {
                                              await locator<UserService>()
                                                  .updateUserCurrentCourse(
                                                      UpdateUserCurrentCourseModel(
                                                          userId: '',
                                                          courseName: state
                                                              .courses
                                                              .activeCourses[
                                                                  index]
                                                              .userCourse
                                                              .course
                                                              .name))
                                                  .then((value) {
                                                context.go('/selected_course');
                                              });
                                            },
                                            child: CourseItem(
                                              courseLevel: state
                                                  .courses
                                                  .activeCourses[index]
                                                  .userCourse
                                                  .difficulty
                                                  .beginner
                                                  .name,
                                              courseName: state
                                                  .courses
                                                  .activeCourses[index]
                                                  .userCourse
                                                  .course
                                                  .name,
                                              progress: state
                                                  .courses
                                                  .activeCourses[index]
                                                  .totalProgress,
                                            ));
                                      }
                                    })),
                          ),
                        ],
                      );
                    } else if (state is CourseUpdateError) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        DialogManager.showErrorDialog(state.error, context, () {
                          context.go('/');
                        });
                      });

                      return Container();
                    } else {
                      return LoadingData();
                    }
                  },
                )),
          ),
        ],
      ),
    );
  }
}
//TODO rename ExceptionHelper to ExceptionHandler