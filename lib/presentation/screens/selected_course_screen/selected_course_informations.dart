import 'package:flutter/material.dart';
import 'package:wordy/Utility/locator/service_locator.dart';
import 'package:wordy/const/consts.dart';
import 'package:wordy/domain/models/active_course.dart';
import 'package:wordy/global/global_data_manager.dart';
import 'package:wordy/presentation/widgets/circular_precentage_chart.dart';

class SelectedCourseInformations extends StatefulWidget {
  SelectedCourseInformations(
      {required this.course, required this.totalProgress});
  ActiveCourse course;
  double totalProgress;
  @override
  State<SelectedCourseInformations> createState() =>
      _SelectedCourseInformationsState();
}

class _SelectedCourseInformationsState
    extends State<SelectedCourseInformations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  translate[locator<GlobalDataManager>().interfaceLanguage]![
                      widget.course.userCourse.course.name],
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: Colors.white),
                ),
                Container(
                  height: 40,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            width: 120,
            child: CircularPercentageChart(
              strokeWidth: 2,
              progressColor: Colors.white,
              backgroundColor: Colors.white60,
              progress: widget.totalProgress,
              textStyle: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white),
              optionalWidget: SizedBox(
                height: 20,
                child: Text(
                  translate[locator<GlobalDataManager>().interfaceLanguage]![
                      'completed'],
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
