// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TriplocationStruct extends BaseStruct {
  TriplocationStruct({
    String? id,
    String? name,
    String? address,
    String? estimatedTime,
    String? type,
  })  : _id = id,
        _name = name,
        _address = address,
        _estimatedTime = estimatedTime,
        _type = type;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "estimatedTime" field.
  String? _estimatedTime;
  String get estimatedTime => _estimatedTime ?? '';
  set estimatedTime(String? val) => _estimatedTime = val;

  bool hasEstimatedTime() => _estimatedTime != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  static TriplocationStruct fromMap(Map<String, dynamic> data) =>
      TriplocationStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        address: data['address'] as String?,
        estimatedTime: data['estimatedTime'] as String?,
        type: data['type'] as String?,
      );

  static TriplocationStruct? maybeFromMap(dynamic data) => data is Map
      ? TriplocationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'address': _address,
        'estimatedTime': _estimatedTime,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'estimatedTime': serializeParam(
          _estimatedTime,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static TriplocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      TriplocationStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        estimatedTime: deserializeParam(
          data['estimatedTime'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TriplocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TriplocationStruct &&
        id == other.id &&
        name == other.name &&
        address == other.address &&
        estimatedTime == other.estimatedTime &&
        type == other.type;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, name, address, estimatedTime, type]);
}

TriplocationStruct createTriplocationStruct({
  String? id,
  String? name,
  String? address,
  String? estimatedTime,
  String? type,
}) =>
    TriplocationStruct(
      id: id,
      name: name,
      address: address,
      estimatedTime: estimatedTime,
      type: type,
    );
