import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:wordy/const/enums.dart';
import 'package:wordy/const/shared_preferences_keys.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/domain/logic/user_service.dart';
import 'package:wordy/domain/models/interface_language.dart';
import 'package:wordy/domain/models/user_active_courses_progress.dart';
import 'package:wordy/global/courses_lang_interface.dart';
import 'package:wordy/global/notification_provider.dart';
import 'package:wordy/presentation/bloc/login/login_bloc.dart';
import 'package:wordy/presentation/widgets/bouncing_widget.dart';
import 'package:wordy/presentation/widgets/select_interface_language_button.dart';
import 'package:wordy/utility/dialog_manager.dart';
import 'package:wordy/utility/locator/service_locator.dart';
import 'package:wordy/utility/utility.dart';

import '../../const/app_router.dart';
import '../../const/consts.dart';
import '../../domain/repositiories/stream_repository.dart';
import '../../global/selected_course_notifier.dart';
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

  void onTapDetails(TapDownDetails tapData, CoursesLangInterface model) {
    if (model.listRef != null && model.isExpanded) {
      Offset listPosition = model.listRef!.globalToLocal(Offset.zero);
      Offset tapPosition = tapData.globalPosition;
      if (Utility.isTapWithinObjectBounds(
              listPosition, model.listRef!, tapPosition) &&
          model.isExpanded) {
        model.setIsExpanded();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider(
        create: (BuildContext context) => NotificationProvider(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CoursesUpdateBloc>(
              create: (context) =>
                  CoursesUpdateBloc(locator<StreamRepository>())
                    ..add(const InitialCourses()),
            ),
            BlocProvider(
              create: (context) => LoginBloc(),
            ),
          ],
          child: BlocListener<CoursesUpdateBloc, CoursesUpdateState>(
            listener: (context, state) {
              if (state is UserNoCoursesInSelectedInterfaceLanguage) {
                context.go(AppRouter.initialSettings);
              }
            },
            child: ChangeNotifierProvider(
              create: (context) => CoursesLangInterface(),
              child: Consumer<CoursesLangInterface>(
                builder: (context, model, child) =>
                    BlocBuilder<CoursesUpdateBloc, CoursesUpdateState>(
                  builder: (context, state) {
                    if (state is CoursesLoaded) {
                      return GestureDetector(
                        onTapDown: (tapData) {
                          onTapDetails(tapData, model);
                        },
                        child: Stack(
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
                                                    locator<DialogManager>()
                                                        .showQuestionDialog(
                                                            "",
                                                            translate[locator<
                                                                        GlobalDataManager>()
                                                                    .interfaceLanguage]![
                                                                'log_out'],
                                                            context, () async {
                                                      await locator<
                                                              UserService>()
                                                          .logOut()
                                                          .then((value) {
                                                        locator<UserService>()
                                                            .cleanUpLocalStorage();
                                                        context
                                                            .read<LoginBloc>()
                                                            .add(LogOut(
                                                                message: ''));
                                                        context.go(AppRouter
                                                            .loginScreen);
                                                      });
                                                    }, () {});
                                                  },
                                                ),
                                              ),
                                            ),
                                            Expanded(child: Container()),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SliverToBoxAdapter(
                                      child: CurrentCourseWidget(
                                        currentCourse:
                                            state.courses.currentCourse,
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
                                          translate[locator<GlobalDataManager>()
                                                  .interfaceLanguage]![
                                              'your_courses'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
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
                                          height: (state.courses.activeCourses
                                                      .length *
                                                  100) +
                                              200,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: GridView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            scrollDirection: Axis.vertical,
                                            itemCount: state
                                                    .availableCourses.isNotEmpty
                                                ? state.courses.activeCourses
                                                        .length +
                                                    1
                                                : state.courses.activeCourses
                                                    .length,
                                            itemBuilder: (context, index) {
                                              if (index ==
                                                  state.courses.activeCourses
                                                      .length) {
                                                return GestureDetector(
                                                    onTap: () {
                                                      locator<DialogManager>()
                                                          .showSelectNewCourseDialog(
                                                              context,
                                                              state
                                                                  .availableCourses);
                                                    },
                                                    child:
                                                        const AddNewCourseItem());
                                              } else {
                                                return AnimationConfiguration
                                                    .staggeredGrid(
                                                  position: index,
                                                  columnCount: 2,
                                                  child: GestureDetector(
                                                      onTap: () async {
                                                        locator<SelectedCourseNotifier>()
                                                                .quizType =
                                                            QuizType.learning;
                                                        await locator<
                                                                UserService>()
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
                                                            AppRouter
                                                                .selectedCourse,
                                                          );
                                                        });
                                                      },
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
                            SelectInterfaceLanguageButton(
                              courses: state.courses,
                            ),
                          ],
                        ),
                      );
                    } else if (state is CourseUpdateError) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        locator<DialogManager>()
                            .showErrorDialog(state.error, context, () {
                          context.go(AppRouter.loginScreen);
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
        ),
      ),
    );
  }
}
