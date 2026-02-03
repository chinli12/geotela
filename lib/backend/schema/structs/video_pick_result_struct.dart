// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoPickResultStruct extends BaseStruct {
  VideoPickResultStruct({
    String? videoPath,
    String? thumbPath,
  })  : _videoPath = videoPath,
        _thumbPath = thumbPath;

  // "videoPath" field.
  String? _videoPath;
  String get videoPath => _videoPath ?? '';
  set videoPath(String? val) => _videoPath = val;

  bool hasVideoPath() => _videoPath != null;

  // "thumbPath" field.
  String? _thumbPath;
  String get thumbPath => _thumbPath ?? '';
  set thumbPath(String? val) => _thumbPath = val;

  bool hasThumbPath() => _thumbPath != null;

  static VideoPickResultStruct fromMap(Map<String, dynamic> data) =>
      VideoPickResultStruct(
        videoPath: data['videoPath'] as String?,
        thumbPath: data['thumbPath'] as String?,
      );

  static VideoPickResultStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoPickResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'videoPath': _videoPath,
        'thumbPath': _thumbPath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'videoPath': serializeParam(
          _videoPath,
          ParamType.String,
        ),
        'thumbPath': serializeParam(
          _thumbPath,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideoPickResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoPickResultStruct(
        videoPath: deserializeParam(
          data['videoPath'],
          ParamType.String,
          false,
        ),
        thumbPath: deserializeParam(
          data['thumbPath'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideoPickResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideoPickResultStruct &&
        videoPath == other.videoPath &&
        thumbPath == other.thumbPath;
  }

  @override
  int get hashCode => const ListEquality().hash([videoPath, thumbPath]);
}

VideoPickResultStruct createVideoPickResultStruct({
  String? videoPath,
  String? thumbPath,
}) =>
    VideoPickResultStruct(
      videoPath: videoPath,
      thumbPath: thumbPath,
    );
