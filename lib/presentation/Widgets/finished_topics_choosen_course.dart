import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wordy/presentation/widgets/statistics_list.dart';

class FinishedTopicsChoosenCourse extends StatefulWidget {
   FinishedTopicsChoosenCourse({super.key, required this.choosenLanguage});
  String choosenLanguage;

  @override
  State<FinishedTopicsChoosenCourse> createState() =>
      _FinishedTopicsChoosenCourseState();
}

class _FinishedTopicsChoosenCourseState
    extends State<FinishedTopicsChoosenCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
            child: Text("Finished Topics - ${widget.choosenLanguage}",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white)),
          ),
        ),
      ),
      body: StatisticsList(
        image: 'assets/dailyusage.png',
        label: 'Basic Conversation',
        navigation: null,
      ),
    );
  }
}
