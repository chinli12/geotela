// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsStruct extends BaseStruct {
  CommentsStruct({
    String? id,
    String? parentCommentId,
    String? content,
    String? createdAt,
    int? likeCount,
    int? replyCount,
    int? depth,
    String? userId,
    String? username,
    String? avatarUrl,
  })  : _id = id,
        _parentCommentId = parentCommentId,
        _content = content,
        _createdAt = createdAt,
        _likeCount = likeCount,
        _replyCount = replyCount,
        _depth = depth,
        _userId = userId,
        _username = username,
        _avatarUrl = avatarUrl;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "parent_comment_id" field.
  String? _parentCommentId;
  String get parentCommentId => _parentCommentId ?? '';
  set parentCommentId(String? val) => _parentCommentId = val;

  bool hasParentCommentId() => _parentCommentId != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "like_count" field.
  int? _likeCount;
  int get likeCount => _likeCount ?? 0;
  set likeCount(int? val) => _likeCount = val;

  void incrementLikeCount(int amount) => likeCount = likeCount + amount;

  bool hasLikeCount() => _likeCount != null;

  // "reply_count" field.
  int? _replyCount;
  int get replyCount => _replyCount ?? 0;
  set replyCount(int? val) => _replyCount = val;

  void incrementReplyCount(int amount) => replyCount = replyCount + amount;

  bool hasReplyCount() => _replyCount != null;

  // "depth" field.
  int? _depth;
  int get depth => _depth ?? 0;
  set depth(int? val) => _depth = val;

  void incrementDepth(int amount) => depth = depth + amount;

  bool hasDepth() => _depth != null;

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

  static CommentsStruct fromMap(Map<String, dynamic> data) => CommentsStruct(
        id: data['id'] as String?,
        parentCommentId: data['parent_comment_id'] as String?,
        content: data['content'] as String?,
        createdAt: data['created_at'] as String?,
        likeCount: castToType<int>(data['like_count']),
        replyCount: castToType<int>(data['reply_count']),
        depth: castToType<int>(data['depth']),
        userId: data['user_id'] as String?,
        username: data['username'] as String?,
        avatarUrl: data['avatar_url'] as String?,
      );

  static CommentsStruct? maybeFromMap(dynamic data) =>
      data is Map ? CommentsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'parent_comment_id': _parentCommentId,
        'content': _content,
        'created_at': _createdAt,
        'like_count': _likeCount,
        'reply_count': _replyCount,
        'depth': _depth,
        'user_id': _userId,
        'username': _username,
        'avatar_url': _avatarUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'parent_comment_id': serializeParam(
          _parentCommentId,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'like_count': serializeParam(
          _likeCount,
          ParamType.int,
        ),
        'reply_count': serializeParam(
          _replyCount,
          ParamType.int,
        ),
        'depth': serializeParam(
          _depth,
          ParamType.int,
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
      }.withoutNulls;

  static CommentsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        parentCommentId: deserializeParam(
          data['parent_comment_id'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        likeCount: deserializeParam(
          data['like_count'],
          ParamType.int,
          false,
        ),
        replyCount: deserializeParam(
          data['reply_count'],
          ParamType.int,
          false,
        ),
        depth: deserializeParam(
          data['depth'],
          ParamType.int,
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
      );

  @override
  String toString() => 'CommentsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentsStruct &&
        id == other.id &&
        parentCommentId == other.parentCommentId &&
        content == other.content &&
        createdAt == other.createdAt &&
        likeCount == other.likeCount &&
        replyCount == other.replyCount &&
        depth == other.depth &&
        userId == other.userId &&
        username == other.username &&
        avatarUrl == other.avatarUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        parentCommentId,
        content,
        createdAt,
        likeCount,
        replyCount,
        depth,
        userId,
        username,
        avatarUrl
      ]);
}

CommentsStruct createCommentsStruct({
  String? id,
  String? parentCommentId,
  String? content,
  String? createdAt,
  int? likeCount,
  int? replyCount,
  int? depth,
  String? userId,
  String? username,
  String? avatarUrl,
}) =>
    CommentsStruct(
      id: id,
      parentCommentId: parentCommentId,
      content: content,
      createdAt: createdAt,
      likeCount: likeCount,
      replyCount: replyCount,
      depth: depth,
      userId: userId,
      username: username,
      avatarUrl: avatarUrl,
    );
