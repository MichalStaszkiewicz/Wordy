import 'package:flutter/material.dart';

class CoursesLangInterface with ChangeNotifier {
  bool isExpanded = false;
  RenderBox? listRef;

  void setIsExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void setListRef(RenderBox box) {
    listRef = box;
    notifyListeners();
  }
}
