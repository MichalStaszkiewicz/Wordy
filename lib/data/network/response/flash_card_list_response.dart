import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/word.dart';

part 'flash_card_list_response.freezed.dart';
part 'flash_card_list_response.g.dart';

@freezed
class FlashCardListResponse with _$FlashCardListResponse {
  const factory FlashCardListResponse({
    required List<Word> wordList,
  }) = _FlashCardListResponse;

  factory FlashCardListResponse.fromJson(Map<String, dynamic> json) =>
      _$FlashCardListResponseFromJson(json);
}
