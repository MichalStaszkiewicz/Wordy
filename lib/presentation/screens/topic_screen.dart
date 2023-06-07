import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/Utility/dialog_manager.dart';
import 'package:wordy/Utility/utility.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/data/network/exceptions/exception_helper.dart';
import 'package:wordy/data/network/exceptions/unexpected_error.dart';
import 'package:wordy/domain/logic/user_service.dart';

import '../../utility/locator/api_locator.dart';
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
  late AnimationController _controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = Tween<double>(
      begin: -context.height,
      end: context.height / 2,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var backgroundBarrier = false;
  var dialogShowed = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            child: FutureBuilder(
                future: locator<UserService>().getUserActiveCoursesProgress(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isRight) {
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
                                              snapshot
                                                  .data!
                                                  .right!
                                                  .currentCourse
                                                  .userCourse
                                                  .interfaceLanguage
                                                  .image),
                                        ),
                                        Text(
                                            snapshot
                                                .data!
                                                .right!
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
                              currentCourse:
                                  snapshot.data!.right!.currentCourse,
                              label: snapshot
                                  .data!
                                  .right!
                                  .currentCourse
                                  .userCourse
                                  .difficulty
                                  .beginner
                                  .name
                                  .capitalize!,
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
                          SliverToBoxAdapter(
                            child: const SizedBox(
                              height: 20,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 170,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot
                                            .data!.right!.activeCourses.length +
                                        1,
                                    itemBuilder: (context, index) {
                                      if (index ==
                                          snapshot.data!.right!.activeCourses
                                              .length) {
                                        return GestureDetector(
                                            onTap: () {
                                              _controller.forward();
                                              backgroundBarrier = true;
                                            },
                                            child: AddNewCourseItem());
                                      } else {
                                        return GestureDetector(
                                            onTap: () {
                                              context.go('/selected_course');
                                            },
                                            child: CourseItem(
                                              courseLevel: snapshot
                                                  .data!
                                                  .right!
                                                  .activeCourses[index]
                                                  .userCourse
                                                  .difficulty
                                                  .beginner
                                                  .name,
                                              courseName: snapshot
                                                  .data!
                                                  .right!
                                                  .activeCourses[index]
                                                  .userCourse
                                                  .course
                                                  .name,
                                              progress: snapshot
                                                  .data!
                                                  .right!
                                                  .activeCourses[index]
                                                  .totalProgress,
                                            ));
                                      }
                                    })),
                          ),
                        ],
                      );
                    } else {
                      if (!dialogShowed) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          DialogManager.showErrorDialog(
                              ExceptionHelper.getErrorMessage(
                                  UnexpectedError()),
                              context, () {
                            context.go('/');
                          });
                        });
                        dialogShowed = true;
                      }

                      return Container();
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return LoadingData();
                  } else if (snapshot.hasError) {
                    if (!dialogShowed) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        DialogManager.showErrorDialog(
                            ExceptionHelper.getErrorMessage(UnexpectedError()),
                            context, () {
                          context.go('/');
                        });
                      });
                      dialogShowed = true;
                    }

                    return Container();
                  } else {
                    return Container();
                  }
                }),
          ),
          backgroundBarrier == true
              ? GestureDetector(
                  onTap: () {
                    _controller.reverse();
                  },
                  child: Container(
                    color: Colors.black87.withOpacity(0.3),
                  ),
                )
              : Container(),
          Positioned(
              top: animation.value,
              child: Container(
                height: context.height / 2,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              ))
        ],
      ),
    );
  }
}
