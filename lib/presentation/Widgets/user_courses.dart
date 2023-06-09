import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/course_basic.dart';
import '../Bloc/user_progress/user_progress_bloc.dart';

class UserCourses extends StatelessWidget {
  const UserCourses({super.key});
  List<Widget> create_list_of_active_courses(
      List<CourseBasic> activeCoursesData) {
    List<Widget> result = [];
    for (CourseBasic active_course in activeCoursesData) {
      result.add(
        SizedBox(
          width: 100,
          child:  Image(
            image: AssetImage('assets/${active_course.flag}.png'),
          ),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProgressBloc, UserProgressState>(
      builder: (context, qstate) {
        final state = qstate as UserProgressLoaded;
        return Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          height: 80,
          child: Container(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   ...create_list_of_active_courses(state.courses),
                  ],
                ),
              )),
        );
      },
    );
  }
}
