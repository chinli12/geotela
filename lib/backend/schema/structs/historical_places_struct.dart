// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoricalPlacesStruct extends BaseStruct {
  HistoricalPlacesStruct({
    String? description,
    String? name,
  })  : _description = description,
        _name = name;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static HistoricalPlacesStruct fromMap(Map<String, dynamic> data) =>
      HistoricalPlacesStruct(
        description: data['description'] as String?,
        name: data['name'] as String?,
      );

  static HistoricalPlacesStruct? maybeFromMap(dynamic data) => data is Map
      ? HistoricalPlacesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'description': _description,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static HistoricalPlacesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      HistoricalPlacesStruct(
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HistoricalPlacesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is HistoricalPlacesStruct &&
        description == other.description &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([description, name]);
}

HistoricalPlacesStruct createHistoricalPlacesStruct({
  String? description,
  String? name,
}) =>
    HistoricalPlacesStruct(
      description: description,
      name: name,
    );
