import 'course_entry.dart';

class Course{
Course({required this.entries,required this.courseName,required this.maximum,required this.topicsMaximum,required this.current,required this.topicsCurrent});
List<CourseEntry> entries;
int maximum;
int current;
String courseName;
Map<String,int> topicsMaximum;
Map<String,int> topicsCurrent;

}