import 'package:flutter/material.dart';
import 'package:wordy/shared/consts.dart';

class StepperConnector extends StatefulWidget {
  StepperConnector({required this.width});
  double width;

  @override
  State<StepperConnector> createState() => _StepperConnectorState();
}

class _StepperConnectorState extends State<StepperConnector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: widget.width,
      color: kdisabledcolor,
    );
  }
}
