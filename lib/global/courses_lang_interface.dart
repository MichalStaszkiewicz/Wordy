import 'package:flutter/material.dart';

class CoursesLangInterface with ChangeNotifier {
  bool isExpanded = false;

  void setIsExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }
}
