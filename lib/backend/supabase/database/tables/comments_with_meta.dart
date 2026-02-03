import '../database.dart';

class CommentsWithMetaTable extends SupabaseTable<CommentsWithMetaRow> {
  @override
  String get tableName => 'comments_with_meta';

  @override
  CommentsWithMetaRow createRow(Map<String, dynamic> data) =>
      CommentsWithMetaRow(data);
}

class CommentsWithMetaRow extends SupabaseDataRow {
  CommentsWithMetaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentsWithMetaTable();

  String? get commentId => getField<String>('comment_id');
  set commentId(String? value) => setField<String>('comment_id', value);

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get parentCommentId => getField<String>('parent_comment_id');
  set parentCommentId(String? value) =>
      setField<String>('parent_comment_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get profileImage => getField<String>('profile_image');
  set profileImage(String? value) => setField<String>('profile_image', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get commentLikeCount => getField<int>('comment_like_count');
  set commentLikeCount(int? value) =>
      setField<int>('comment_like_count', value);

  int? get replyCount => getField<int>('reply_count');
  set replyCount(int? value) => setField<int>('reply_count', value);
}
