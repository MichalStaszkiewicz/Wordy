import 'package:json_annotation/json_annotation.dart';
import 'package:wordy/data/dto/flash_card_dto.dart';
part 'flash_card_list_response.g.dart';

@JsonSerializable()
class FlashCardListResponse {
  FlashCardListResponse({required this.wordList});
  List<FlashCardDto> wordList;

  factory FlashCardListResponse.fromJson(Map<String, dynamic> json) =>
      _$FlashCardListResponseFromJson(json);
}
