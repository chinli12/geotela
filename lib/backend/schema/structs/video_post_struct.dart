// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoPostStruct extends BaseStruct {
  VideoPostStruct({
    String? id,
    String? content,
    String? mediaUrl,
    String? mediaType,
    String? location,
    String? userId,
    String? title,
    String? thumbnails,
    String? username,
    String? avatarUrl,
  })  : _id = id,
        _content = content,
        _mediaUrl = mediaUrl,
        _mediaType = mediaType,
        _location = location,
        _userId = userId,
        _title = title,
        _thumbnails = thumbnails,
        _username = username,
        _avatarUrl = avatarUrl;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "media_url" field.
  String? _mediaUrl;
  String get mediaUrl => _mediaUrl ?? '';
  set mediaUrl(String? val) => _mediaUrl = val;

  bool hasMediaUrl() => _mediaUrl != null;

  // "media_type" field.
  String? _mediaType;
  String get mediaType => _mediaType ?? '';
  set mediaType(String? val) => _mediaType = val;

  bool hasMediaType() => _mediaType != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "thumbnails" field.
  String? _thumbnails;
  String get thumbnails => _thumbnails ?? '';
  set thumbnails(String? val) => _thumbnails = val;

  bool hasThumbnails() => _thumbnails != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "avatar_url" field.
  String? _avatarUrl;
  String get avatarUrl => _avatarUrl ?? '';
  set avatarUrl(String? val) => _avatarUrl = val;

  bool hasAvatarUrl() => _avatarUrl != null;

  static VideoPostStruct fromMap(Map<String, dynamic> data) => VideoPostStruct(
        id: data['id'] as String?,
        content: data['content'] as String?,
        mediaUrl: data['media_url'] as String?,
        mediaType: data['media_type'] as String?,
        location: data['location'] as String?,
        userId: data['user_id'] as String?,
        title: data['title'] as String?,
        thumbnails: data['thumbnails'] as String?,
        username: data['username'] as String?,
        avatarUrl: data['avatar_url'] as String?,
      );

  static VideoPostStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoPostStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'content': _content,
        'media_url': _mediaUrl,
        'media_type': _mediaType,
        'location': _location,
        'user_id': _userId,
        'title': _title,
        'thumbnails': _thumbnails,
        'username': _username,
        'avatar_url': _avatarUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'media_url': serializeParam(
          _mediaUrl,
          ParamType.String,
        ),
        'media_type': serializeParam(
          _mediaType,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'thumbnails': serializeParam(
          _thumbnails,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'avatar_url': serializeParam(
          _avatarUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideoPostStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoPostStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        mediaUrl: deserializeParam(
          data['media_url'],
          ParamType.String,
          false,
        ),
        mediaType: deserializeParam(
          data['media_type'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        thumbnails: deserializeParam(
          data['thumbnails'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        avatarUrl: deserializeParam(
          data['avatar_url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideoPostStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideoPostStruct &&
        id == other.id &&
        content == other.content &&
        mediaUrl == other.mediaUrl &&
        mediaType == other.mediaType &&
        location == other.location &&
        userId == other.userId &&
        title == other.title &&
        thumbnails == other.thumbnails &&
        username == other.username &&
        avatarUrl == other.avatarUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        content,
        mediaUrl,
        mediaType,
        location,
        userId,
        title,
        thumbnails,
        username,
        avatarUrl
      ]);
}

VideoPostStruct createVideoPostStruct({
  String? id,
  String? content,
  String? mediaUrl,
  String? mediaType,
  String? location,
  String? userId,
  String? title,
  String? thumbnails,
  String? username,
  String? avatarUrl,
}) =>
    VideoPostStruct(
      id: id,
      content: content,
      mediaUrl: mediaUrl,
      mediaType: mediaType,
      location: location,
      userId: userId,
      title: title,
      thumbnails: thumbnails,
      username: username,
      avatarUrl: avatarUrl,
    );
