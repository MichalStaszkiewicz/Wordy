// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class InsertLearnedWordsModel {
  String userId;
  List<int> wordIdList;
  InsertLearnedWordsModel({
    required this.userId,
    required this.wordIdList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'wordIdList': wordIdList,
    };
  }
}
