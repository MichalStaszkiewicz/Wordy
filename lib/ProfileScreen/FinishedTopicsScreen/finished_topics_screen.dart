import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wordy/ProfileScreen/FinishedTopicsScreen/finished_topics_choosen_course.dart';
import 'package:wordy/ProfileScreen/statistics_card.dart';
import 'package:wordy/ProfileScreen/statistics_list.dart';

class FinishedTopicsScreen extends StatefulWidget {
  const FinishedTopicsScreen({super.key});

  @override
  State<FinishedTopicsScreen> createState() => _FinishedTopicsScreenState();
}

class _FinishedTopicsScreenState extends State<FinishedTopicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.only(right: 40),
          child: Center(
            child: Container(
              child: Text(
                "Finished Topics",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: StatisticsList(image: 'assets/poland.png', label: 'Polish', navigation: FinishedTopicsChoosenCourse(choosenLanguage: 'Polish',),),
    );
  }
}
