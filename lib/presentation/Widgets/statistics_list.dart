import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordy/presentation/Bloc/user_settings_and_preferences/user_settings_and_preferences_bloc.dart';
import 'package:wordy/presentation/Widgets/statistics_card.dart';

class StatisticsList extends StatelessWidget {
  StatisticsList(
      {required this.navigation, required this.image, required this.label});
  Widget? navigation;
  String image;
  String label;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSettingsAndPreferencesBloc,
        UserSettingsAndPreferencesState>(
      builder: (context, state) {
        if (state is UserLearnedWordsSpecificCourse) {
          return ListView.builder(
              itemCount: state.course.topicsCurrent.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (navigation != null) {
                       
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) =>
                                      UserSettingsAndPreferencesBloc(),
                                  child: navigation!,
                                )));
                      }
                    },
                    child: Container(
                      height: 100,
                      child: StatisticsCard(
                        current: state.course.topicsCurrent[label]!,
                        image: image,
                        label: state.course.entries[index].topic,
                        max: state.course.topicsMaximum[label]!,
                      ),
                    ),
                  ));
        }
        if (state is UserLearnedWordsLoaded) {
          return ListView.builder(
              itemCount: state.courses.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (navigation != null) {
                        
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) =>
                                      UserSettingsAndPreferencesBloc()..add(LoadLearnedWorsdWithSpecificCourse(course:state.courses[index])),
                                  child: navigation!,
                                )));
                      }
                    },
                    child: Container(
                      height: 100,
                      child: StatisticsCard(
                        current: state.courses[index].entries.length,
                        image: image,
                        label: state.courses[index].courseName,
                        max: state.courses[index].maximum,
                      ),
                    ),
                  ));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
