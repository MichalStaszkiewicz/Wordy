import 'package:wordy/data/dto/course_entry_dto.dart';
import 'package:wordy/shared/consts.dart';

import '../../domain/models/course.dart';

class CourseDto {
  CourseDto(
      {required this.entries,
      required this.courseName,
      required this.maximum,
      required this.topicsMaximum,
      required this.current,
      required this.topicsCurrent});
  List<CourseEntryDto> entries;
  int maximum;
  int current;
  String courseName;
  Map<String, int> topicsMaximum;
  Map<String, int> topicsCurrent;

  Course toDomain() {
    return Course(
        entries: entries.map((e) => e.toDomain()).toList(),
        courseName: courseName,
        maximum: maximum,
        topicsMaximum: topicsMaximum,
        current: current,
        topicsCurrent: topicsCurrent);
  }
}
