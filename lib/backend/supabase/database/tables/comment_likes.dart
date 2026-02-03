import '../database.dart';

class CommentLikesTable extends SupabaseTable<CommentLikesRow> {
  @override
  String get tableName => 'comment_likes';

  @override
  CommentLikesRow createRow(Map<String, dynamic> data) => CommentLikesRow(data);
}

class CommentLikesRow extends SupabaseDataRow {
  CommentLikesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentLikesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get commentId => getField<String>('comment_id')!;
  set commentId(String value) => setField<String>('comment_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);
}
