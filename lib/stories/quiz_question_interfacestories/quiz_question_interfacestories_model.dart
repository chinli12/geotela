import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'quiz_question_interfacestories_widget.dart'
    show QuizQuestionInterfacestoriesWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizQuestionInterfacestoriesModel
    extends FlutterFlowModel<QuizQuestionInterfacestoriesWidget> {
  ///  Local state fields for this page.

  int? score;

  List<String> answers = [];
  void addToAnswers(String item) => answers.add(item);
  void removeFromAnswers(String item) => answers.remove(item);
  void removeAtIndexFromAnswers(int index) => answers.removeAt(index);
  void insertAtIndexInAnswers(int index, String item) =>
      answers.insert(index, item);
  void updateAnswersAtIndex(int index, Function(String) updateFn) =>
      answers[index] = updateFn(answers[index]);

  List<QuestionStruct> quizes = [];
  void addToQuizes(QuestionStruct item) => quizes.add(item);
  void removeFromQuizes(QuestionStruct item) => quizes.remove(item);
  void removeAtIndexFromQuizes(int index) => quizes.removeAt(index);
  void insertAtIndexInQuizes(int index, QuestionStruct item) =>
      quizes.insert(index, item);
  void updateQuizesAtIndex(int index, Function(QuestionStruct) updateFn) =>
      quizes[index] = updateFn(quizes[index]);

  List<int> answrindex = [];
  void addToAnswrindex(int item) => answrindex.add(item);
  void removeFromAnswrindex(int item) => answrindex.remove(item);
  void removeAtIndexFromAnswrindex(int index) => answrindex.removeAt(index);
  void insertAtIndexInAnswrindex(int index, int item) =>
      answrindex.insert(index, item);
  void updateAnswrindexAtIndex(int index, Function(int) updateFn) =>
      answrindex[index] = updateFn(answrindex[index]);

  String playstate = 'paused';

  int? correct = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
