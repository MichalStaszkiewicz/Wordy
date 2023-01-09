import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:wordy/TopicScreen/progression_bar_animated_elements.dart';

class ProgressionBar extends StatefulWidget {
  ProgressionBar({required this.image, required this.percentage});
  String image;
  double percentage;

  @override
  State<ProgressionBar> createState() => _ProgressionBarState();
}

class _ProgressionBarState extends State<ProgressionBar>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(widget.image))),
              )),
          Expanded(
              flex: 10,
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return ProgressionBarAnimatedElement(parentWidth: constraints.maxWidth,percentage:widget.percentage,);
                  },
                ),
              )),
        ],
      ),
    );
  }
}
