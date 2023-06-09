import 'package:flutter/material.dart';

import 'circular_precentage_chart.dart';

class CourseItem extends StatefulWidget {
  CourseItem(
      {super.key, required this.courseLevel,
      required this.courseName,
      required this.progress});

  String courseName;
  String courseLevel;
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
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 6),
          blurRadius: 6.0,
        )
      ], color: Colors.green, borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: const EdgeInsets.only(left: 20, top: 20),
        child: Stack(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.courseName,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                  Text(
                    widget.courseLevel,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 60,
              left: 60,
              child: SizedBox(
                width: 100,
                height: 60,
                child: CircularPercentageChart(
                  progress: widget.progress,
                  progressColor: Colors.white,
                  backgroundColor: Colors.white54,
                  strokeWidth: 2.0,
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
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
