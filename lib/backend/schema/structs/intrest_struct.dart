// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntrestStruct extends BaseStruct {
  IntrestStruct({
    String? name,
  }) : _name = name;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static IntrestStruct fromMap(Map<String, dynamic> data) => IntrestStruct(
        name: data['name'] as String?,
      );

  static IntrestStruct? maybeFromMap(dynamic data) =>
      data is Map ? IntrestStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static IntrestStruct fromSerializableMap(Map<String, dynamic> data) =>
      IntrestStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IntrestStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IntrestStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

IntrestStruct createIntrestStruct({
  String? name,
}) =>
    IntrestStruct(
      name: name,
    );
