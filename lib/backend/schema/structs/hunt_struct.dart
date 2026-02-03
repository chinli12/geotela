// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HuntStruct extends BaseStruct {
  HuntStruct({
    String? title,
    String? distance,
    String? points,
    String? description,
    List<String>? catigory,
    List<String>? task,
  })  : _title = title,
        _distance = distance,
        _points = points,
        _description = description,
        _catigory = catigory,
        _task = task;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "distance" field.
  String? _distance;
  String get distance => _distance ?? '';
  set distance(String? val) => _distance = val;

  bool hasDistance() => _distance != null;

  // "points" field.
  String? _points;
  String get points => _points ?? '';
  set points(String? val) => _points = val;

  bool hasPoints() => _points != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "catigory" field.
  List<String>? _catigory;
  List<String> get catigory => _catigory ?? const [];
  set catigory(List<String>? val) => _catigory = val;

  void updateCatigory(Function(List<String>) updateFn) {
    updateFn(_catigory ??= []);
  }

  bool hasCatigory() => _catigory != null;

  // "task" field.
  List<String>? _task;
  List<String> get task => _task ?? const [];
  set task(List<String>? val) => _task = val;

  void updateTask(Function(List<String>) updateFn) {
    updateFn(_task ??= []);
  }

  bool hasTask() => _task != null;

  static HuntStruct fromMap(Map<String, dynamic> data) => HuntStruct(
        title: data['title'] as String?,
        distance: data['distance'] as String?,
        points: data['points'] as String?,
        description: data['description'] as String?,
        catigory: getDataList(data['catigory']),
        task: getDataList(data['task']),
      );

  static HuntStruct? maybeFromMap(dynamic data) =>
      data is Map ? HuntStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'distance': _distance,
        'points': _points,
        'description': _description,
        'catigory': _catigory,
        'task': _task,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'distance': serializeParam(
          _distance,
          ParamType.String,
        ),
        'points': serializeParam(
          _points,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'catigory': serializeParam(
          _catigory,
          ParamType.String,
          isList: true,
        ),
        'task': serializeParam(
          _task,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static HuntStruct fromSerializableMap(Map<String, dynamic> data) =>
      HuntStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        distance: deserializeParam(
          data['distance'],
          ParamType.String,
          false,
        ),
        points: deserializeParam(
          data['points'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        catigory: deserializeParam<String>(
          data['catigory'],
          ParamType.String,
          true,
        ),
        task: deserializeParam<String>(
          data['task'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'HuntStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HuntStruct &&
        title == other.title &&
        distance == other.distance &&
        points == other.points &&
        description == other.description &&
        listEquality.equals(catigory, other.catigory) &&
        listEquality.equals(task, other.task);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, distance, points, description, catigory, task]);
}

HuntStruct createHuntStruct({
  String? title,
  String? distance,
  String? points,
  String? description,
}) =>
    HuntStruct(
      title: title,
      distance: distance,
      points: points,
      description: description,
    );
