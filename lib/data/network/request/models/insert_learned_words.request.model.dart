// ignore_for_file: public_member_api_docs, sort_constructors_first

class InsertLearnedWordsModel {
  List<int> wordIdList;
  InsertLearnedWordsModel({
    required this.wordIdList,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wordIdList': wordIdList,
    };
  }
}
