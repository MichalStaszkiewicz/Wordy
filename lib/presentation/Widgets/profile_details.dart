import 'package:flutter/material.dart';
import 'package:wordy/presentation/Widgets/header_in_profile.dart';
import 'package:wordy/presentation/Widgets/statistics_item.dart';
import 'package:wordy/presentation/Widgets/users_courses.dart';
class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    Key? key,
    required ScrollController scrollStatisticsController,
    required List<StatisticsItem> statItems,
  }) : _scrollStatisticsController = scrollStatisticsController, _statItems = statItems, super(key: key);

  final ScrollController _scrollStatisticsController;
  final List<StatisticsItem> _statItems;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderInProfile(
            label: "My Courses",
          ),
          const UsersCourses(),
          HeaderInProfile(
            label: "Statistics",
          ),
          Container(
            height: 400,
            child: GridView.builder(
              controller: _scrollStatisticsController,
              itemCount: 4,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
              itemBuilder: (context, index) => _statItems[index],
            ),
          )
        ],
      ),
    );
  }
}
