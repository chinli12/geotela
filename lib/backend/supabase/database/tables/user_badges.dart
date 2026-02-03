import '../database.dart';

class UserBadgesTable extends SupabaseTable<UserBadgesRow> {
  @override
  String get tableName => 'user_badges';

  @override
  UserBadgesRow createRow(Map<String, dynamic> data) => UserBadgesRow(data);
}

class UserBadgesRow extends SupabaseDataRow {
  UserBadgesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserBadgesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get badgeId => getField<String>('badge_id');
  set badgeId(String? value) => setField<String>('badge_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
