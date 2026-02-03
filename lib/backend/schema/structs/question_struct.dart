// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends BaseStruct {
  QuestionStruct({
    String? question,
    List<String>? options,
    int? correctAnswer,
    String? explanation,
  })  : _question = question,
        _options = options,
        _correctAnswer = correctAnswer,
        _explanation = explanation;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  // "correctAnswer" field.
  int? _correctAnswer;
  int get correctAnswer => _correctAnswer ?? 0;
  set correctAnswer(int? val) => _correctAnswer = val;

  void incrementCorrectAnswer(int amount) =>
      correctAnswer = correctAnswer + amount;

  bool hasCorrectAnswer() => _correctAnswer != null;

  // "explanation" field.
  String? _explanation;
  String get explanation => _explanation ?? '';
  set explanation(String? val) => _explanation = val;

  bool hasExplanation() => _explanation != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        question: data['question'] as String?,
        options: getDataList(data['options']),
        correctAnswer: castToType<int>(data['correctAnswer']),
        explanation: data['explanation'] as String?,
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuestionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'options': _options,
        'correctAnswer': _correctAnswer,
        'explanation': _explanation,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
        'correctAnswer': serializeParam(
          _correctAnswer,
          ParamType.int,
        ),
        'explanation': serializeParam(
          _explanation,
          ParamType.String,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        correctAnswer: deserializeParam(
          data['correctAnswer'],
          ParamType.int,
          false,
        ),
        explanation: deserializeParam(
          data['explanation'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'QuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionStruct &&
        question == other.question &&
        listEquality.equals(options, other.options) &&
        correctAnswer == other.correctAnswer &&
        explanation == other.explanation;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([question, options, correctAnswer, explanation]);
}

QuestionStruct createQuestionStruct({
  String? question,
  int? correctAnswer,
  String? explanation,
}) =>
    QuestionStruct(
      question: question,
      correctAnswer: correctAnswer,
      explanation: explanation,
    );
