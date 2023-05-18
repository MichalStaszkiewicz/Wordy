import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:status_change/status_change.dart';
import 'package:wordy/presentation/Bloc/user_progress/user_progress_bloc.dart';
import 'package:wordy/presentation/widgets/stepper/stepper_connector.dart';
import 'package:wordy/presentation/widgets/stepper/stepper_entry.dart';
import 'package:wordy/presentation/widgets/unexpected_error.dart';
import 'package:wordy/presentation/home_page.dart';

import '../../Utility/utility.dart';
import '../../const/consts.dart';
import '../../const/enums.dart';

class ProgressOfInitialSetup extends StatefulWidget {
  ProgressOfInitialSetup({required this.status});
  InitialSetupStatus status;

  @override
  ProgressOfInitialSetupState createState() => ProgressOfInitialSetupState();
}

class ProgressOfInitialSetupState extends State<ProgressOfInitialSetup> {
  Utility utility = Utility();
  int convertToStep() {
    if (widget.status == InitialSetupStatus.choosingNativeLanguage) {
      return 1;
    }else{
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      child: Container(
        child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 50,
                child: Container(
                  width: 390,
                  height: 30,
                  child: Center(
                    child: AutoSizeText(
                      utility.convertStepIntoTitle(convertToStep()),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ktitlecolor, fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
            Positioned(
              top: 70,
              left: 0,
              child: StepperEntry(
                step: convertToStep(),
                label: "Native Language",
                statusEntryIndex: 1,
              ),
            ),
            Positioned(
              top: 107,
              left: 65, // entry width
              child: StepperConnector(
                width: 115,
                stepFinished: 1,
                step: convertToStep(),
              ),
            ),
            Positioned(
              top: 70,
              left: 145,
              child: StepperEntry(
                step: convertToStep(),
                label: "Language To Learn",
                statusEntryIndex: 2,
              ),
            ),
            Positioned(
              top: 107,
              left: 210, // entry width
              child: StepperConnector(
                width: 115,
                stepFinished: 2,
                step: convertToStep(),
              ),
            ),
            Positioned(
              top: 70,
              left: 290,
              child: StepperEntry(
                step: convertToStep(),
                label: "Finish!",
                statusEntryIndex: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
