import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/flash_card_data.dart';
part 'flash_card_dto.g.dart';

@JsonSerializable()
class FlashCardDto {
  FlashCardDto({required this.question, required this.answer});
  String question;
  String answer;
  factory FlashCardDto.fromJson(Map<String, dynamic> json) =>
      _$FlashCardDtoFromJson(json);

  FlashCardData toDomain() {
    
    return FlashCardData(question: question, answer: answer);
  }
}
