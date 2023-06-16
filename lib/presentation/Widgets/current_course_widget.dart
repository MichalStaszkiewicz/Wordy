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
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.indigoAccent[200],
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Stack(children: [
          /*
          Positioned(
            left: 270,
            top: 10,
            child: DifficultyLevelWidget(
              textColor: Colors.white,
              label: label,
            ),
          ),*/
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
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: ProgressionBar(
                                              height: 5,
                                              gradient: [
                                                Colors.white,
                                                Colors.white
                                              ],
                                              nonProgressionColor:
                                                  Colors.white.withOpacity(0.6),
                                              progress: 90,
                                              width: 200,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                bottom: 2,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '90%',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        fontSize: 15,
                                                        letterSpacing: 2,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
            colors: [Colors.blueAccent, Colors.blueAccent],
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
            const Icon(Icons.play_circle_outline_rounded, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
