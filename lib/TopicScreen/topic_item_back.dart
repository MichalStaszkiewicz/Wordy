import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TopicItemBack extends StatefulWidget {
  TopicItemBack({super.key});

  @override
  State<TopicItemBack> createState() => _TopicItemBackState();
}

class _TopicItemBackState extends State<TopicItemBack> {
  double percent = 0.3;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(10)),
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(1 * -pi),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: CircularPercentIndicator(
                  lineWidth: 10,
                  percent: percent,
                  center: Text(
                    "${(percent * 100).toInt()}",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  progressColor: Colors.red,
                  radius: 40),
            ),
            Text(
              "67 / 200",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Container(
              height: 20,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(child: Text("Start",style: Theme.of(context).textTheme.button,),),
            )
          ],
        ),
      ),
    );
  }
}
