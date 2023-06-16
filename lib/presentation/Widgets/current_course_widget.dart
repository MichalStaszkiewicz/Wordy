import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/presentation/widgets/progression_bar.dart';

import '../../const/app_router.dart';
import '../../domain/models/active_course.dart';
import 'difficulty_level_widget.dart';

class CurrentCourseWidget extends StatelessWidget {
  CurrentCourseWidget(
      {super.key, required this.currentCourse, required this.label});
  ActiveCourse currentCourse;
  String label;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 230,
        width: 380,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.orange,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Stack(children: [
          Positioned(
            left: 270,
            top: 10,
            child: DifficultyLevelWidget(
              textColor: Colors.white,
              label: label,
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: Center(
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          child: Image(
                            image: NetworkImage(Urls.kImageUrl +
                                currentCourse.userCourse.course.circularImage),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            child: Text(
                              textAlign: TextAlign.left,
                              currentCourse.userCourse.course.name.capitalize!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              width: double.infinity,
                              alignment: Alignment.bottomLeft,
                              child: GestureDetector(
                                  onTap: () {
                                    context.pushNamed(AppRouter.selectedCourse);
                                  },
                                  child: _buildContinueButton(context))),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "${currentCourse.finishedTopics} / ${currentCourse.topicsCount} Topics completed",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  child: ProgressionBar(
                                    progress: currentCourse.totalProgress,
                                    width: 270,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ]));
  }

  Container _buildContinueButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      width: 110,
      height: 40,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 99, 155, 252),
              Color.fromRGBO(158, 149, 248, 1),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Continue',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.white),
            ),
            const Icon(Icons.arrow_right_alt_rounded, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
