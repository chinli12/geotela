import '../database.dart';

class ProfileWithCountsTable extends SupabaseTable<ProfileWithCountsRow> {
  @override
  String get tableName => 'profile_with_counts';

  @override
  ProfileWithCountsRow createRow(Map<String, dynamic> data) =>
      ProfileWithCountsRow(data);
}

class ProfileWithCountsRow extends SupabaseDataRow {
  ProfileWithCountsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfileWithCountsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  int? get postCount => getField<int>('post_count');
  set postCount(int? value) => setField<int>('post_count', value);

  int? get followersCount => getField<int>('followers_count');
  set followersCount(int? value) => setField<int>('followers_count', value);

  int? get followingCount => getField<int>('following_count');
  set followingCount(int? value) => setField<int>('following_count', value);

  bool? get isFollowing => getField<bool>('is_following');
  set isFollowing(bool? value) => setField<bool>('is_following', value);
}
