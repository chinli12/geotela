import '../database.dart';

class ProfilesWithCountsTable extends SupabaseTable<ProfilesWithCountsRow> {
  @override
  String get tableName => 'profiles_with_counts';

  @override
  ProfilesWithCountsRow createRow(Map<String, dynamic> data) =>
      ProfilesWithCountsRow(data);
}

class ProfilesWithCountsRow extends SupabaseDataRow {
  ProfilesWithCountsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilesWithCountsTable();

  String? get profileId => getField<String>('profile_id');
  set profileId(String? value) => setField<String>('profile_id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  int? get totalFollowers => getField<int>('total_followers');
  set totalFollowers(int? value) => setField<int>('total_followers', value);

  int? get totalFollowing => getField<int>('total_following');
  set totalFollowing(int? value) => setField<int>('total_following', value);

  int? get totalPosts => getField<int>('total_posts');
  set totalPosts(int? value) => setField<int>('total_posts', value);
}
