// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryStoriesStruct extends BaseStruct {
  HistoryStoriesStruct({
    String? history,
    String? location,
    String? source,
    LatLng? latlong,
    String? title,
    int? id,
    String? readTime,
    double? points,
    String? description,
    String? fullNarrative,
    String? imageUrl,
    double? latitude,
    double? longitude,
    List<String>? catigory,
    String? distance,
  })  : _history = history,
        _location = location,
        _source = source,
        _latlong = latlong,
        _title = title,
        _id = id,
        _readTime = readTime,
        _points = points,
        _description = description,
        _fullNarrative = fullNarrative,
        _imageUrl = imageUrl,
        _latitude = latitude,
        _longitude = longitude,
        _catigory = catigory,
        _distance = distance;

  // "history" field.
  String? _history;
  String get history => _history ?? '';
  set history(String? val) => _history = val;

  bool hasHistory() => _history != null;

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

  // "latlong" field.
  LatLng? _latlong;
  LatLng? get latlong => _latlong;
  set latlong(LatLng? val) => _latlong = val;

  bool hasLatlong() => _latlong != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "readTime" field.
  String? _readTime;
  String get readTime => _readTime ?? '';
  set readTime(String? val) => _readTime = val;

  bool hasReadTime() => _readTime != null;

  // "points" field.
  double? _points;
  double get points => _points ?? 0.0;
  set points(double? val) => _points = val;

  void incrementPoints(double amount) => points = points + amount;

  bool hasPoints() => _points != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "fullNarrative" field.
  String? _fullNarrative;
  String get fullNarrative => _fullNarrative ?? '';
  set fullNarrative(String? val) => _fullNarrative = val;

  bool hasFullNarrative() => _fullNarrative != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;

  void incrementLatitude(double amount) => latitude = latitude + amount;

  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;

  void incrementLongitude(double amount) => longitude = longitude + amount;

  bool hasLongitude() => _longitude != null;

  // "catigory" field.
  List<String>? _catigory;
  List<String> get catigory => _catigory ?? const [];
  set catigory(List<String>? val) => _catigory = val;

  void updateCatigory(Function(List<String>) updateFn) {
    updateFn(_catigory ??= []);
  }

  bool hasCatigory() => _catigory != null;

  // "distance" field.
  String? _distance;
  String get distance => _distance ?? '';
  set distance(String? val) => _distance = val;

  bool hasDistance() => _distance != null;

  static HistoryStoriesStruct fromMap(Map<String, dynamic> data) =>
      HistoryStoriesStruct(
        history: data['history'] as String?,
        location: data['location'] as String?,
        source: data['source'] as String?,
        latlong: data['latlong'] as LatLng?,
        title: data['title'] as String?,
        id: castToType<int>(data['id']),
        readTime: data['readTime'] as String?,
        points: castToType<double>(data['points']),
        description: data['description'] as String?,
        fullNarrative: data['fullNarrative'] as String?,
        imageUrl: data['image_url'] as String?,
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
        catigory: getDataList(data['catigory']),
        distance: data['distance'] as String?,
      );

  static HistoryStoriesStruct? maybeFromMap(dynamic data) => data is Map
      ? HistoryStoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'history': _history,
        'location': _location,
        'source': _source,
        'latlong': _latlong,
        'title': _title,
        'id': _id,
        'readTime': _readTime,
        'points': _points,
        'description': _description,
        'fullNarrative': _fullNarrative,
        'image_url': _imageUrl,
        'latitude': _latitude,
        'longitude': _longitude,
        'catigory': _catigory,
        'distance': _distance,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'history': serializeParam(
          _history,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'source': serializeParam(
          _source,
          ParamType.String,
        ),
        'latlong': serializeParam(
          _latlong,
          ParamType.LatLng,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'readTime': serializeParam(
          _readTime,
          ParamType.String,
        ),
        'points': serializeParam(
          _points,
          ParamType.double,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'fullNarrative': serializeParam(
          _fullNarrative,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
        'catigory': serializeParam(
          _catigory,
          ParamType.String,
          isList: true,
        ),
        'distance': serializeParam(
          _distance,
          ParamType.String,
        ),
      }.withoutNulls;

  static HistoryStoriesStruct fromSerializableMap(Map<String, dynamic> data) =>
      HistoryStoriesStruct(
        history: deserializeParam(
          data['history'],
          ParamType.String,
          false,
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
        latlong: deserializeParam(
          data['latlong'],
          ParamType.LatLng,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        readTime: deserializeParam(
          data['readTime'],
          ParamType.String,
          false,
        ),
        points: deserializeParam(
          data['points'],
          ParamType.double,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        fullNarrative: deserializeParam(
          data['fullNarrative'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
        catigory: deserializeParam<String>(
          data['catigory'],
          ParamType.String,
          true,
        ),
        distance: deserializeParam(
          data['distance'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'HistoryStoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HistoryStoriesStruct &&
        history == other.history &&
        location == other.location &&
        source == other.source &&
        latlong == other.latlong &&
        title == other.title &&
        id == other.id &&
        readTime == other.readTime &&
        points == other.points &&
        description == other.description &&
        fullNarrative == other.fullNarrative &&
        imageUrl == other.imageUrl &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        listEquality.equals(catigory, other.catigory) &&
        distance == other.distance;
  }

  @override
  int get hashCode => const ListEquality().hash([
        history,
        location,
        source,
        latlong,
        title,
        id,
        readTime,
        points,
        description,
        fullNarrative,
        imageUrl,
        latitude,
        longitude,
        catigory,
        distance
      ]);
}

HistoryStoriesStruct createHistoryStoriesStruct({
  String? history,
  String? location,
  String? source,
  LatLng? latlong,
  String? title,
  int? id,
  String? readTime,
  double? points,
  String? description,
  String? fullNarrative,
  String? imageUrl,
  double? latitude,
  double? longitude,
  String? distance,
}) =>
    HistoryStoriesStruct(
      history: history,
      location: location,
      source: source,
      latlong: latlong,
      title: title,
      id: id,
      readTime: readTime,
      points: points,
      description: description,
      fullNarrative: fullNarrative,
      imageUrl: imageUrl,
      latitude: latitude,
      longitude: longitude,
      distance: distance,
    );
