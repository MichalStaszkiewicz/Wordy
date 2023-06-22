import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/global/notification_provider.dart';
import 'package:wordy/utility/socket_manager.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/app_router.dart';
import '../../domain/repositiories/stream_repository.dart';
import '../bloc/courses_update/courses_update_bloc.dart';
import '../widgets/add_new_course_item.dart';
import '../widgets/course_item.dart';
import '../widgets/current_course_widget.dart';
import '../widgets/daily_challange_widget.dart';
import '../widgets/loading_data.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({super.key});

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen>
    with TickerProviderStateMixin {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (BuildContext context) => NotificationProvider(),
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              child: BlocProvider<CoursesUpdateBloc>(
                  create: (context) =>
                      CoursesUpdateBloc(locator<StreamRepository>())
                        ..add(InitialCourses()),
                  child: BlocBuilder<CoursesUpdateBloc, CoursesUpdateState>(
                    builder: (context, state) {
                      if (state is CoursesLoaded) {
                        return CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              centerTitle: true,
                              primary: false,
                              flexibleSpace: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                              ),
                              pinned: true,
                              title: Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.logout_rounded,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        DialogManager.showQuestionDialog(
                                            "",
                                            'Do you want to log out ?',
                                            context, () async {
                                          await locator<UserService>()
                                              .logOut()
                                              .then((value) => context
                                                  .go(AppRouter.authScreen));
                                        }, () {});
                                      },
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 35,
                                            child: Image.network(
                                                Urls.kImageUrl +
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
                                                  .copyWith(
                                                      color: Colors.black)),
                                          Container(
                                              height: 20,
                                              alignment: Alignment.bottomCenter,
                                              child: const Icon(
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
                            /*
                            SliverToBoxAdapter(
                              child: DailyChallangeWidget(
                                difficultyLevel: "Expert",
                              ),
                            ),
                            */
                            const SliverToBoxAdapter(
                              child: SizedBox(
                                height: 20,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(left: 25),
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
                                  height: 400,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: GridView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: state.availableCourses.isNotEmpty
                                        ? state.courses.activeCourses.length + 1
                                        : state.courses.activeCourses.length,
                                    itemBuilder: (context, index) {
                                      if (index ==
                                          state.courses.activeCourses.length) {
                                        return GestureDetector(
                                            onTap: () {
                                              DialogManager
                                                  .showSelectNewCourseDialog(
                                                      context,
                                                      state.availableCourses);
                                            },
                                            child: const AddNewCourseItem());
                                      } else {
                                        return GestureDetector(
                                            onTap: () async {
                                              await locator<UserService>()
                                                  .updateUserCurrentCourse(state
                                                      .courses
                                                      .activeCourses[index]
                                                      .userCourse
                                                      .course
                                                      .name)
                                                  .then((value) {
                                                context.go(
                                                    AppRouter.selectedCourse);
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
                                                topic: state
                                                    .courses
                                                    .activeCourses[index]
                                                    .userCourse
                                                    .lastTopic));
                                      }
                                    },
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                  )),
                            ),
                          ],
                        );
                      } else if (state is CourseUpdateError) {
                        WidgetsBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          DialogManager.showErrorDialog(state.error, context,
                              () {
                            context.go(AppRouter.authScreen);
                          });
                        });

                        return Container();
                      } else {
                        return const LoadingData();
                      }
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
//TODO rename ExceptionHelper to ExceptionHandler