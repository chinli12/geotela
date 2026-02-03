import '../database.dart';

class XpLeaderboardTable extends SupabaseTable<XpLeaderboardRow> {
  @override
  String get tableName => 'xp_leaderboard';

  @override
  XpLeaderboardRow createRow(Map<String, dynamic> data) =>
      XpLeaderboardRow(data);
}

class XpLeaderboardRow extends SupabaseDataRow {
  XpLeaderboardRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => XpLeaderboardTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  int? get totalXp => getField<int>('total_xp');
  set totalXp(int? value) => setField<int>('total_xp', value);

  int? get rank => getField<int>('rank');
  set rank(int? value) => setField<int>('rank', value);
}
