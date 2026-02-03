import '../database.dart';

class CommentsTable extends SupabaseTable<CommentsRow> {
  @override
  String get tableName => 'comments';

  @override
  CommentsRow createRow(Map<String, dynamic> data) => CommentsRow(data);
}

class CommentsRow extends SupabaseDataRow {
  CommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  String? get parentCommentId => getField<String>('parent_comment_id');
  set parentCommentId(String? value) =>
      setField<String>('parent_comment_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get commentCount => getField<int>('comment_count');
  set commentCount(int? value) => setField<int>('comment_count', value);

  int? get likeCount => getField<int>('like_count');
  set likeCount(int? value) => setField<int>('like_count', value);
}
