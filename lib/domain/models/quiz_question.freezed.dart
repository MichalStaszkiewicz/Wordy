// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) {
  return _QuizQuestion.fromJson(json);
}

/// @nodoc
mixin _$QuizQuestion {
  List<String> get questionOptions => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  int get correctAnswerIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizQuestionCopyWith<QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizQuestionCopyWith<$Res> {
  factory $QuizQuestionCopyWith(
          QuizQuestion value, $Res Function(QuizQuestion) then) =
      _$QuizQuestionCopyWithImpl<$Res, QuizQuestion>;
  @useResult
  $Res call(
      {List<String> questionOptions,
      String answer,
      String question,
      int correctAnswerIndex});
}

/// @nodoc
class _$QuizQuestionCopyWithImpl<$Res, $Val extends QuizQuestion>
    implements $QuizQuestionCopyWith<$Res> {
  _$QuizQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionOptions = null,
    Object? answer = null,
    Object? question = null,
    Object? correctAnswerIndex = null,
  }) {
    return _then(_value.copyWith(
      questionOptions: null == questionOptions
          ? _value.questionOptions
          : questionOptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswerIndex: null == correctAnswerIndex
          ? _value.correctAnswerIndex
          : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuizQuestionCopyWith<$Res>
    implements $QuizQuestionCopyWith<$Res> {
  factory _$$_QuizQuestionCopyWith(
          _$_QuizQuestion value, $Res Function(_$_QuizQuestion) then) =
      __$$_QuizQuestionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> questionOptions,
      String answer,
      String question,
      int correctAnswerIndex});
}

/// @nodoc
class __$$_QuizQuestionCopyWithImpl<$Res>
    extends _$QuizQuestionCopyWithImpl<$Res, _$_QuizQuestion>
    implements _$$_QuizQuestionCopyWith<$Res> {
  __$$_QuizQuestionCopyWithImpl(
      _$_QuizQuestion _value, $Res Function(_$_QuizQuestion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionOptions = null,
    Object? answer = null,
    Object? question = null,
    Object? correctAnswerIndex = null,
  }) {
    return _then(_$_QuizQuestion(
      questionOptions: null == questionOptions
          ? _value._questionOptions
          : questionOptions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      correctAnswerIndex: null == correctAnswerIndex
          ? _value.correctAnswerIndex
          : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuizQuestion implements _QuizQuestion {
  _$_QuizQuestion(
      {required final List<String> questionOptions,
      required this.answer,
      required this.question,
      required this.correctAnswerIndex})
      : _questionOptions = questionOptions;

  factory _$_QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$$_QuizQuestionFromJson(json);

  final List<String> _questionOptions;
  @override
  List<String> get questionOptions {
    if (_questionOptions is EqualUnmodifiableListView) return _questionOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionOptions);
  }

  @override
  final String answer;
  @override
  final String question;
  @override
  final int correctAnswerIndex;

  @override
  String toString() {
    return 'QuizQuestion(questionOptions: $questionOptions, answer: $answer, question: $question, correctAnswerIndex: $correctAnswerIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuizQuestion &&
            const DeepCollectionEquality()
                .equals(other._questionOptions, _questionOptions) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.correctAnswerIndex, correctAnswerIndex) ||
                other.correctAnswerIndex == correctAnswerIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_questionOptions),
      answer,
      question,
      correctAnswerIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuizQuestionCopyWith<_$_QuizQuestion> get copyWith =>
      __$$_QuizQuestionCopyWithImpl<_$_QuizQuestion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuizQuestionToJson(
      this,
    );
  }
}

abstract class _QuizQuestion implements QuizQuestion {
  factory _QuizQuestion(
      {required final List<String> questionOptions,
      required final String answer,
      required final String question,
      required final int correctAnswerIndex}) = _$_QuizQuestion;

  factory _QuizQuestion.fromJson(Map<String, dynamic> json) =
      _$_QuizQuestion.fromJson;

  @override
  List<String> get questionOptions;
  @override
  String get answer;
  @override
  String get question;
  @override
  int get correctAnswerIndex;
  @override
  @JsonKey(ignore: true)
  _$$_QuizQuestionCopyWith<_$_QuizQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
