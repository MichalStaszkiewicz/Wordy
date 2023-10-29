import 'package:flutter/material.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/const/urls.dart';
import 'package:wordy/presentation/widgets/bouncing_widget.dart';
import 'package:wordy/presentation/widgets/continue_button.dart';
import 'package:wordy/presentation/widgets/progression_bar.dart';

import '../../Utility/locator/service_locator.dart';
import '../../domain/models/active_course.dart';
import '../../global/global_data_manager.dart';

class CurrentCourseWidget extends StatelessWidget {
  CurrentCourseWidget({
    super.key,
    required this.currentCourse,
  });
  ActiveCourse currentCourse;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 230,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.indigo.shade300,
                Colors.indigo.shade700,
              ],
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
                              ui_lang[locator<GlobalDataManager>()
                                      .interfaceLanguage]![
                                  currentCourse.userCourse.course.name],
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: BouncingWidget(
                            onPress: () {},
                            child: Container(
                                width: double.infinity,
                                alignment: Alignment.bottomLeft,
                                child: ContinueButton()),
                          ),
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
                                          ProgressionBar(
                                            height: 5,
                                            gradient: const [
                                              Colors.white,
                                              Colors.white
                                            ],
                                            nonProgressionColor:
                                                Colors.white.withOpacity(0.6),
                                            progress:
                                                currentCourse.totalProgress,
                                            width: 200,
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                bottom: 2,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${currentCourse.totalProgress.round()}%",
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
}
