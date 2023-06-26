import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_collection.freezed.dart';
part 'word_collection.g.dart';

@freezed
class WordCollection with _$WordCollection {
  factory WordCollection({required String topic, required String image}) =
      _WordCollection;

  factory WordCollection.fromJson(Map<String, dynamic> json) =>
      _$WordCollectionFromJson(json);
}
