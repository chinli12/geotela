import '../database.dart';

class PostsWithMetaTable extends SupabaseTable<PostsWithMetaRow> {
  @override
  String get tableName => 'posts_with_meta';

  @override
  PostsWithMetaRow createRow(Map<String, dynamic> data) =>
      PostsWithMetaRow(data);
}

class PostsWithMetaRow extends SupabaseDataRow {
  PostsWithMetaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostsWithMetaTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  String? get mediaUrl => getField<String>('media_url');
  set mediaUrl(String? value) => setField<String>('media_url', value);

  String? get mediaType => getField<String>('media_type');
  set mediaType(String? value) => setField<String>('media_type', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get groupId => getField<String>('group_id');
  set groupId(String? value) => setField<String>('group_id', value);

  dynamic? get author => getField<dynamic>('author');
  set author(dynamic? value) => setField<dynamic>('author', value);

  int? get likesCount => getField<int>('likes_count');
  set likesCount(int? value) => setField<int>('likes_count', value);

  bool? get likedByCurrentUser => getField<bool>('liked_by_current_user');
  set likedByCurrentUser(bool? value) =>
      setField<bool>('liked_by_current_user', value);

  dynamic? get comments => getField<dynamic>('comments');
  set comments(dynamic? value) => setField<dynamic>('comments', value);
}
