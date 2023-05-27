import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wordy/presentation/widgets/progression_bar.dart';

import 'difficulty_level_widget.dart';

class CurrentCourseWidget extends StatelessWidget {
  const CurrentCourseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 230,
        width: 380,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
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
              widgetColor: Colors.blue.withOpacity(0.9),
            ),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
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
                          child: const Image(
                            image: AssetImage('assets/spain-circular.png'),
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
                              "Spanish",
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
                                    context.go('/selected_course');
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
                                    margin: EdgeInsets.only(bottom: 10),
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      "2 / 14 Topics completed",
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
                                    progress: 65,
                                    progressColor: Colors.blueAccent,
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
          color: Colors.blueAccent,
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
            Icon(Icons.arrow_right_alt_rounded, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
