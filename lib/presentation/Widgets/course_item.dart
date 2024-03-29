import 'package:flutter/material.dart';

import '../../Utility/locator/service_locator.dart';
import '../../const/consts.dart';
import '../../domain/models/topic.dart';
import '../../global/global_data_manager.dart';
import 'circular_precentage_chart.dart';

class CourseItem extends StatefulWidget {
  CourseItem(
      {super.key,
      required this.courseName,
      required this.progress,
      required this.topic});

  String courseName;

  Topic? topic;
  double progress;

  @override
  State<CourseItem> createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 170,
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
              offset: Offset(0, 6),
              blurRadius: 6.0,
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: const EdgeInsets.only(left: 20, top: 20),
        child: Stack(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translate[locator<GlobalDataManager>().interfaceLanguage]![
                        widget.courseName],
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                  widget.topic != null
                      ? Text(
                          translate[locator<GlobalDataManager>()
                                  .interfaceLanguage]!['topic_label']
                              [widget.topic!.name],
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.5),
                        )
                      : const Text(''),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height/10,
              left: MediaQuery.of(context).size.width/6.5,
              child: SizedBox(
                width: 100,
                height: 60,
                child: CircularPercentageChart(
                  progress: widget.progress,
                  progressColor: Colors.white,
                  backgroundColor: Colors.white54,
                  strokeWidth: 2.0,
                  textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold),
                  optionalWidget: null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
