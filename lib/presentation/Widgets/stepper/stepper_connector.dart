import 'package:flutter/material.dart';
import 'package:wordy/const/consts.dart';

class StepperConnector extends StatefulWidget {
  StepperConnector({super.key, required this.width,required this.stepFinished,required this.step});
  double width;
  int stepFinished;
  int step;

  @override
  State<StepperConnector> createState() => _StepperConnectorState();
}

class _StepperConnectorState extends State<StepperConnector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: widget.width,
      color: widget.step>widget.stepFinished?kactivestatuscolor:kdisabledcolor,
    );
  }
}
