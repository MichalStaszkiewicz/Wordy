import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:status_change/status_change.dart';
import 'package:wordy/presentation/Widgets/stepper/stepper_connector.dart';
import 'package:wordy/presentation/Widgets/stepper/stepper_entry.dart';
import 'package:wordy/presentation/home_page.dart';

class ProgressOfNewUserConfiguration extends StatefulWidget {
  ProgressOfNewUserConfiguration();

  @override
  ProgressOfNewUserConfigurationState createState() =>
      ProgressOfNewUserConfigurationState();
}

class ProgressOfNewUserConfigurationState
    extends State<ProgressOfNewUserConfiguration> {
  int _processIndex = 0;

  Color getColor(int index) {
    if (index == _processIndex) {
      return Colors.grey;
    } else if (index < _processIndex) {
      return Colors.teal;
    } else {
      return Colors.blue;
    }
  }

  final _processes = [
    'Order Signed',
    'Order Processed',
    'Shipped ',
    'Out for delivery ',
    'Delivered ',
  ];

  final _content = [
    '23/12',
    '23/12',
    '23/12',
    '23/12',
    '23/12',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        color: Colors.amber,
        width: 400,
        child: Row(
          children: [
            StepperEntry(step: 1, label: "Native Language"),
            Expanded(child: StepperConnector()),
            StepperEntry(step: 2, label: "Language To Learn"),
            Expanded(child: StepperConnector()),
            StepperEntry(step: 3, label: "Finish!"),
          ],
        ));
  }
}
