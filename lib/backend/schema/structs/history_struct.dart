// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryStruct extends BaseStruct {
  HistoryStruct({
    List<HistoricalPlacesStruct>? historicalPlaces,
    String? location,
    String? source,
  })  : _historicalPlaces = historicalPlaces,
        _location = location,
        _source = source;

  // "historical_places" field.
  List<HistoricalPlacesStruct>? _historicalPlaces;
  List<HistoricalPlacesStruct> get historicalPlaces =>
      _historicalPlaces ?? const [];
  set historicalPlaces(List<HistoricalPlacesStruct>? val) =>
      _historicalPlaces = val;

  void updateHistoricalPlaces(Function(List<HistoricalPlacesStruct>) updateFn) {
    updateFn(_historicalPlaces ??= []);
  }

  bool hasHistoricalPlaces() => _historicalPlaces != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  set source(String? val) => _source = val;

  bool hasSource() => _source != null;

  static HistoryStruct fromMap(Map<String, dynamic> data) => HistoryStruct(
        historicalPlaces: getStructList(
          data['historical_places'],
          HistoricalPlacesStruct.fromMap,
        ),
        location: data['location'] as String?,
        source: data['source'] as String?,
      );

  static HistoryStruct? maybeFromMap(dynamic data) =>
      data is Map ? HistoryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'historical_places': _historicalPlaces?.map((e) => e.toMap()).toList(),
        'location': _location,
        'source': _source,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'historical_places': serializeParam(
          _historicalPlaces,
          ParamType.DataStruct,
          isList: true,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'source': serializeParam(
          _source,
          ParamType.String,
        ),
      }.withoutNulls;

  static HistoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      HistoryStruct(
        historicalPlaces: deserializeStructParam<HistoricalPlacesStruct>(
          data['historical_places'],
          ParamType.DataStruct,
          true,
          structBuilder: HistoricalPlacesStruct.fromSerializableMap,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        source: deserializeParam(
          data['source'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HistoryStruct &&
        listEquality.equals(historicalPlaces, other.historicalPlaces) &&
        location == other.location &&
        source == other.source;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([historicalPlaces, location, source]);
}

HistoryStruct createHistoryStruct({
  String? location,
  String? source,
}) =>
    HistoryStruct(
      location: location,
      source: source,
    );
