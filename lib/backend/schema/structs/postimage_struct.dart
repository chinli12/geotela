// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostimageStruct extends BaseStruct {
  PostimageStruct({
    String? id,
    String? content,
    String? mediaUrl,
    String? mediaType,
    String? location,
    String? createdAt,
    String? userId,
    String? username,
    String? avatarUrl,
    String? groupid,
    int? commentCount,
    int? likeCount,
    List<String>? likedUserIds,
    String? title,
  })  : _id = id,
        _content = content,
        _mediaUrl = mediaUrl,
        _mediaType = mediaType,
        _location = location,
        _createdAt = createdAt,
        _userId = userId,
        _username = username,
        _avatarUrl = avatarUrl,
        _groupid = groupid,
        _commentCount = commentCount,
        _likeCount = likeCount,
        _likedUserIds = likedUserIds,
        _title = title;

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

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

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

  // "groupid" field.
  String? _groupid;
  String get groupid => _groupid ?? '';
  set groupid(String? val) => _groupid = val;

  bool hasGroupid() => _groupid != null;

  // "comment_count" field.
  int? _commentCount;
  int get commentCount => _commentCount ?? 0;
  set commentCount(int? val) => _commentCount = val;

  void incrementCommentCount(int amount) =>
      commentCount = commentCount + amount;

  bool hasCommentCount() => _commentCount != null;

  // "like_count" field.
  int? _likeCount;
  int get likeCount => _likeCount ?? 0;
  set likeCount(int? val) => _likeCount = val;

  void incrementLikeCount(int amount) => likeCount = likeCount + amount;

  bool hasLikeCount() => _likeCount != null;

  // "liked_user_ids" field.
  List<String>? _likedUserIds;
  List<String> get likedUserIds => _likedUserIds ?? const [];
  set likedUserIds(List<String>? val) => _likedUserIds = val;

  void updateLikedUserIds(Function(List<String>) updateFn) {
    updateFn(_likedUserIds ??= []);
  }

  bool hasLikedUserIds() => _likedUserIds != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  static PostimageStruct fromMap(Map<String, dynamic> data) => PostimageStruct(
        id: data['id'] as String?,
        content: data['content'] as String?,
        mediaUrl: data['media_url'] as String?,
        mediaType: data['media_type'] as String?,
        location: data['location'] as String?,
        createdAt: data['created_at'] as String?,
        userId: data['user_id'] as String?,
        username: data['username'] as String?,
        avatarUrl: data['avatar_url'] as String?,
        groupid: data['groupid'] as String?,
        commentCount: castToType<int>(data['comment_count']),
        likeCount: castToType<int>(data['like_count']),
        likedUserIds: getDataList(data['liked_user_ids']),
        title: data['title'] as String?,
      );

  static PostimageStruct? maybeFromMap(dynamic data) => data is Map
      ? PostimageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'content': _content,
        'media_url': _mediaUrl,
        'media_type': _mediaType,
        'location': _location,
        'created_at': _createdAt,
        'user_id': _userId,
        'username': _username,
        'avatar_url': _avatarUrl,
        'groupid': _groupid,
        'comment_count': _commentCount,
        'like_count': _likeCount,
        'liked_user_ids': _likedUserIds,
        'title': _title,
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
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
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
        'groupid': serializeParam(
          _groupid,
          ParamType.String,
        ),
        'comment_count': serializeParam(
          _commentCount,
          ParamType.int,
        ),
        'like_count': serializeParam(
          _likeCount,
          ParamType.int,
        ),
        'liked_user_ids': serializeParam(
          _likedUserIds,
          ParamType.String,
          isList: true,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static PostimageStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostimageStruct(
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
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
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
        groupid: deserializeParam(
          data['groupid'],
          ParamType.String,
          false,
        ),
        commentCount: deserializeParam(
          data['comment_count'],
          ParamType.int,
          false,
        ),
        likeCount: deserializeParam(
          data['like_count'],
          ParamType.int,
          false,
        ),
        likedUserIds: deserializeParam<String>(
          data['liked_user_ids'],
          ParamType.String,
          true,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PostimageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PostimageStruct &&
        id == other.id &&
        content == other.content &&
        mediaUrl == other.mediaUrl &&
        mediaType == other.mediaType &&
        location == other.location &&
        createdAt == other.createdAt &&
        userId == other.userId &&
        username == other.username &&
        avatarUrl == other.avatarUrl &&
        groupid == other.groupid &&
        commentCount == other.commentCount &&
        likeCount == other.likeCount &&
        listEquality.equals(likedUserIds, other.likedUserIds) &&
        title == other.title;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        content,
        mediaUrl,
        mediaType,
        location,
        createdAt,
        userId,
        username,
        avatarUrl,
        groupid,
        commentCount,
        likeCount,
        likedUserIds,
        title
      ]);
}

PostimageStruct createPostimageStruct({
  String? id,
  String? content,
  String? mediaUrl,
  String? mediaType,
  String? location,
  String? createdAt,
  String? userId,
  String? username,
  String? avatarUrl,
  String? groupid,
  int? commentCount,
  int? likeCount,
  String? title,
}) =>
    PostimageStruct(
      id: id,
      content: content,
      mediaUrl: mediaUrl,
      mediaType: mediaType,
      location: location,
      createdAt: createdAt,
      userId: userId,
      username: username,
      avatarUrl: avatarUrl,
      groupid: groupid,
      commentCount: commentCount,
      likeCount: likeCount,
      title: title,
    );
