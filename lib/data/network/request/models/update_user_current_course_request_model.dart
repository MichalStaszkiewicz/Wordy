// ignore_for_file: public_member_api_docs, sort_constructors_first


class UpdateUserCurrentCourseModel {
  String userId;
  String courseName;
  UpdateUserCurrentCourseModel({
    required this.userId,
    required this.courseName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'courseName': courseName,
    };
  }
}
