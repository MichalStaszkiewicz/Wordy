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
      width: 390,
      child: Container(
        child: Stack(
          children: [
            Positioned(
              top:180,
            child: Container(
              
             
                width: 390,
                child: Text(
                  "Choose your native language",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Positioned(
                left: 0,
                top: 50,
                child: Container(
                  width: 390,
                  child: Center(
                    child: Text(
                      "Learning Profile",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                )),
            Positioned(
              top: 70,
              left: 0,
              child: StepperEntry(step: 1, label: "Native Language"),
            ),
            Positioned(
              top: 107,
              left: 65, // entry width
              child: StepperConnector(
                width: 115,
              ),
            ),
            Positioned(
              top: 70,
              left: 145,
              child: StepperEntry(step: 1, label: "Language To Learn"),
            ),
            Positioned(
              top: 107,
              left: 210, // entry width
              child: StepperConnector(
                width: 115,
              ),
            ),
            Positioned(
              top: 70,
              left: 290,
              child: StepperEntry(step: 2, label: "Finish!"),
            ),
          ],
        ),
      ),
    );
  }
}
