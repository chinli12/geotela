// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LanguageStruct extends BaseStruct {
  LanguageStruct({
    String? name,
    String? flag,
  })  : _name = name,
        _flag = flag;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "flag" field.
  String? _flag;
  String get flag => _flag ?? '';
  set flag(String? val) => _flag = val;

  bool hasFlag() => _flag != null;

  static LanguageStruct fromMap(Map<String, dynamic> data) => LanguageStruct(
        name: data['name'] as String?,
        flag: data['flag'] as String?,
      );

  static LanguageStruct? maybeFromMap(dynamic data) =>
      data is Map ? LanguageStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'flag': _flag,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'flag': serializeParam(
          _flag,
          ParamType.String,
        ),
      }.withoutNulls;

  static LanguageStruct fromSerializableMap(Map<String, dynamic> data) =>
      LanguageStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        flag: deserializeParam(
          data['flag'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LanguageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LanguageStruct && name == other.name && flag == other.flag;
  }

  @override
  int get hashCode => const ListEquality().hash([name, flag]);
}

LanguageStruct createLanguageStruct({
  String? name,
  String? flag,
}) =>
    LanguageStruct(
      name: name,
      flag: flag,
    );
