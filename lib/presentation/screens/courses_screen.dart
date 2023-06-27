import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/global/notification_provider.dart';
import 'package:wordy/presentation/widgets/bouncing_widget.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/app_router.dart';
import '../../const/consts.dart';
import '../../domain/repositiories/stream_repository.dart';
import '../../global/course_progress_tracker.dart';
import '../../global/global_data_manager.dart';
import '../bloc/courses_update/courses_update_bloc.dart';
import '../widgets/add_new_course_item.dart';
import '../widgets/course_item.dart';
import '../widgets/current_course_widget.dart';
import '../widgets/loading_data.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool isListExpanded = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (BuildContext context) => NotificationProvider(),
        child: BlocProvider<CoursesUpdateBloc>(
          create: (context) => CoursesUpdateBloc(locator<StreamRepository>())
            ..add(const InitialCourses()),
          child: BlocListener<CoursesUpdateBloc, CoursesUpdateState>(
            listener: (context, state) {
              if (state is UserNoCoursesInSelectedInterfaceLanguage) {
                context.go(AppRouter.initialSettings);
              }
            },
            child: BlocBuilder<CoursesUpdateBloc, CoursesUpdateState>(
              builder: (context, state) {
                if (state is CoursesLoaded) {
                  return Stack(
                    children: [
                      Container(
                          color: Colors.white,
                          child: CustomScrollView(
                            slivers: [
                              SliverAppBar(
                                primary: false,
                                flexibleSpace: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                                pinned: true,
                                automaticallyImplyLeading: false,
                                title: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.topLeft,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.logout_rounded,
                                              color: Colors.black,
                                            ),
                                            onPressed: () {
                                              DialogManager.showQuestionDialog(
                                                  "",
                                                  ui_lang[locator<
                                                              GlobalDataManager>()
                                                          .interfaceLanguage]![
                                                      'log_out'],
                                                  context, () async {
                                                await locator<UserService>()
                                                    .cleanUpLocalStorage();
                                                await locator<UserService>()
                                                    .logOut()
                                                    .then((value) {
                                                  context
                                                      .go(AppRouter.authScreen);
                                                });
                                              }, () {});
                                            },
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: GestureDetector(
                                            onTap: () {
                                              isListExpanded = !isListExpanded;
                                              setState(() {});
                                            },
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    height: 35,
                                                    child: Image.network(Urls
                                                            .kImageUrl +
                                                        state
                                                            .courses
                                                            .currentCourse
                                                            .userCourse
                                                            .interfaceLanguage
                                                            .image),
                                                  ),
                                                  Text(
                                                      ui_lang[locator<
                                                                  GlobalDataManager>()
                                                              .interfaceLanguage]![
                                                          state
                                                              .courses
                                                              .currentCourse
                                                              .userCourse
                                                              .interfaceLanguage
                                                              .name],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium!
                                                          .copyWith(
                                                              color: Colors
                                                                  .black)),
                                                  Container(
                                                      height: 20,
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      child: const Icon(
                                                          Icons
                                                              .keyboard_arrow_down_outlined,
                                                          color: Colors.black))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: CurrentCourseWidget(
                                  currentCourse: state.courses.currentCourse,
                                ),
                              ),
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
                                    ui_lang[locator<GlobalDataManager>()
                                        .interfaceLanguage]!['your_courses'],
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
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
                                      itemCount:
                                          state.availableCourses.isNotEmpty
                                              ? state.courses.activeCourses
                                                      .length +
                                                  1
                                              : state
                                                  .courses.activeCourses.length,
                                      itemBuilder: (context, index) {
                                        if (index ==
                                            state
                                                .courses.activeCourses.length) {
                                          return GestureDetector(
                                              onTap: () {
                                                DialogManager
                                                    .showSelectNewCourseDialog(
                                                        context,
                                                        state.availableCourses);
                                              },
                                              child: const AddNewCourseItem());
                                        } else {
                                          return AnimationConfiguration
                                              .staggeredGrid(
                                            position: index,
                                            columnCount: 2,
                                            child: GestureDetector(
                                                onTap: () async {
                                                  locator<CourseProgressTracker>()
                                                      .quizType = 'Learning';
                                                  await locator<UserService>()
                                                      .updateUserCurrentCourse(
                                                          state
                                                              .courses
                                                              .activeCourses[
                                                                  index]
                                                              .userCourse
                                                              .course
                                                              .name)
                                                      .then((value) {
                                                    context.go(
                                                      AppRouter.selectedCourse,
                                                    );
                                                  });
                                                },
                                                child: ScaleAnimation(
                                                  scale: 0.1,
                                                  child: BouncingWidget(
                                                    onPress: () {},
                                                    child: CourseItem(
                                                        courseName: state
                                                            .courses
                                                            .activeCourses[
                                                                index]
                                                            .userCourse
                                                            .course
                                                            .name,
                                                        progress: state
                                                            .courses
                                                            .activeCourses[
                                                                index]
                                                            .totalProgress,
                                                        topic: state
                                                            .courses
                                                            .activeCourses[
                                                                index]
                                                            .userCourse
                                                            .lastTopic),
                                                  ),
                                                )),
                                          );
                                        }
                                      },
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                    )),
                              ),
                            ],
                          )),
                      _buildSwitchInterfaceLanguageMenu(context, state),
                    ],
                  );
                } else if (state is CourseUpdateError) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    DialogManager.showErrorDialog(state.error, context, () {
                      context.go(AppRouter.authScreen);
                    });
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

  Positioned _buildSwitchInterfaceLanguageMenu(
      BuildContext context, CoursesLoaded state) {
    return Positioned(
      left: MediaQuery.of(context).size.width / 1.8,
      top: MediaQuery.of(context).size.height / 16,
      child: AnimatedContainer(
        height: isListExpanded ? 100 : 0,
        width: 153,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  DialogManager.showQuestionDialog(
                      ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                          'asking_for_change_interface_language'],
                      ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                          'are_you_sure'],
                      context, () {
                    context.read<CoursesUpdateBloc>().add(
                        SwitchInterfaceLanguage(
                            languageName: state.interfaceLanguages[0].name));
                  }, () {});
                  isListExpanded = false;
                });
              },
              child: AnimatedOpacity(
                opacity: isListExpanded ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  margin: const EdgeInsets.only(top: 0, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          width: 30,
                          child: Image.network(Urls.kImageUrl +
                              state.interfaceLanguages[0].image),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Text(
                            ui_lang[locator<GlobalDataManager>()
                                .interfaceLanguage]!['english'],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  DialogManager.showQuestionDialog(
                      ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                          'asking_for_change_interface_language'],
                      ui_lang[locator<GlobalDataManager>().interfaceLanguage]![
                          'are_you_sure'],
                      context, () {
                    context.read<CoursesUpdateBloc>().add(
                        SwitchInterfaceLanguage(
                            languageName: state.interfaceLanguages[1].name));
                  }, () {});
                  isListExpanded = false;
                });
              },
              child: AnimatedOpacity(
                opacity: isListExpanded ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          width: 30,
                          child: Image.network(Urls.kImageUrl +
                              state.interfaceLanguages[1].image),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Text(
                            ui_lang[locator<GlobalDataManager>()
                                .interfaceLanguage]!['polish'],
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
