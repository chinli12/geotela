import '../database.dart';

class ProfilesTable extends SupabaseTable<ProfilesRow> {
  @override
  String get tableName => 'profiles';

  @override
  ProfilesRow createRow(Map<String, dynamic> data) => ProfilesRow(data);
}

class ProfilesRow extends SupabaseDataRow {
  ProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProfilesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  String? get coverPhotoUrl => getField<String>('cover_photo_url');
  set coverPhotoUrl(String? value) =>
      setField<String>('cover_photo_url', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  DateTime? get lastSeen => getField<DateTime>('last_seen');
  set lastSeen(DateTime? value) => setField<DateTime>('last_seen', value);

  int? get totalXp => getField<int>('total_xp');
  set totalXp(int? value) => setField<int>('total_xp', value);

  List<String> get intrests => getListField<String>('intrests');
  set intrests(List<String>? value) => setListField<String>('intrests', value);

  int? get currentStreak => getField<int>('current_streak');
  set currentStreak(int? value) => setField<int>('current_streak', value);

  int? get longestStreak => getField<int>('longest_streak');
  set longestStreak(int? value) => setField<int>('longest_streak', value);

  DateTime? get lastActiveDate => getField<DateTime>('last_active_date');
  set lastActiveDate(DateTime? value) =>
      setField<DateTime>('last_active_date', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
