import '../database.dart';

class PostsWithMetaImagesTable extends SupabaseTable<PostsWithMetaImagesRow> {
  @override
  String get tableName => 'posts_with_meta_images';

  @override
  PostsWithMetaImagesRow createRow(Map<String, dynamic> data) =>
      PostsWithMetaImagesRow(data);
}

class PostsWithMetaImagesRow extends SupabaseDataRow {
  PostsWithMetaImagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostsWithMetaImagesTable();

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

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get thumbnails => getField<String>('thumbnails');
  set thumbnails(String? value) => setField<String>('thumbnails', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get groupid => getField<String>('groupid');
  set groupid(String? value) => setField<String>('groupid', value);

  int? get commentCount => getField<int>('comment_count');
  set commentCount(int? value) => setField<int>('comment_count', value);

  int? get likeCount => getField<int>('like_count');
  set likeCount(int? value) => setField<int>('like_count', value);

  List<String> get likedUserIds => getListField<String>('liked_user_ids');
  set likedUserIds(List<String>? value) =>
      setListField<String>('liked_user_ids', value);
}
