// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// T
class TripStruct extends BaseStruct {
  TripStruct({
    String? title,
    String? date,
    String? duration,
    String? totalDistance,
    String? difficulty,
    List<TriplocationStruct>? locations,
  })  : _title = title,
        _date = date,
        _duration = duration,
        _totalDistance = totalDistance,
        _difficulty = difficulty,
        _locations = locations;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;

  bool hasDuration() => _duration != null;

  // "totalDistance" field.
  String? _totalDistance;
  String get totalDistance => _totalDistance ?? '';
  set totalDistance(String? val) => _totalDistance = val;

  bool hasTotalDistance() => _totalDistance != null;

  // "difficulty" field.
  String? _difficulty;
  String get difficulty => _difficulty ?? '';
  set difficulty(String? val) => _difficulty = val;

  bool hasDifficulty() => _difficulty != null;

  // "locations" field.
  List<TriplocationStruct>? _locations;
  List<TriplocationStruct> get locations => _locations ?? const [];
  set locations(List<TriplocationStruct>? val) => _locations = val;

  void updateLocations(Function(List<TriplocationStruct>) updateFn) {
    updateFn(_locations ??= []);
  }

  bool hasLocations() => _locations != null;

  static TripStruct fromMap(Map<String, dynamic> data) => TripStruct(
        title: data['title'] as String?,
        date: data['date'] as String?,
        duration: data['duration'] as String?,
        totalDistance: data['totalDistance'] as String?,
        difficulty: data['difficulty'] as String?,
        locations: getStructList(
          data['locations'],
          TriplocationStruct.fromMap,
        ),
      );

  static TripStruct? maybeFromMap(dynamic data) =>
      data is Map ? TripStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'date': _date,
        'duration': _duration,
        'totalDistance': _totalDistance,
        'difficulty': _difficulty,
        'locations': _locations?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
        'totalDistance': serializeParam(
          _totalDistance,
          ParamType.String,
        ),
        'difficulty': serializeParam(
          _difficulty,
          ParamType.String,
        ),
        'locations': serializeParam(
          _locations,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static TripStruct fromSerializableMap(Map<String, dynamic> data) =>
      TripStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
        totalDistance: deserializeParam(
          data['totalDistance'],
          ParamType.String,
          false,
        ),
        difficulty: deserializeParam(
          data['difficulty'],
          ParamType.String,
          false,
        ),
        locations: deserializeStructParam<TriplocationStruct>(
          data['locations'],
          ParamType.DataStruct,
          true,
          structBuilder: TriplocationStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TripStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TripStruct &&
        title == other.title &&
        date == other.date &&
        duration == other.duration &&
        totalDistance == other.totalDistance &&
        difficulty == other.difficulty &&
        listEquality.equals(locations, other.locations);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, date, duration, totalDistance, difficulty, locations]);
}

TripStruct createTripStruct({
  String? title,
  String? date,
  String? duration,
  String? totalDistance,
  String? difficulty,
}) =>
    TripStruct(
      title: title,
      date: date,
      duration: duration,
      totalDistance: totalDistance,
      difficulty: difficulty,
    );
