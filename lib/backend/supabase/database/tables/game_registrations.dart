import '../database.dart';

class GameRegistrationsTable extends SupabaseTable<GameRegistrationsRow> {
  @override
  String get tableName => 'game_registrations';

  @override
  GameRegistrationsRow createRow(Map<String, dynamic> data) =>
      GameRegistrationsRow(data);
}

class GameRegistrationsRow extends SupabaseDataRow {
  GameRegistrationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GameRegistrationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get gameUserId => getField<String>('game_user_id');
  set gameUserId(String? value) => setField<String>('game_user_id', value);

  String? get loginHash => getField<String>('login_hash');
  set loginHash(String? value) => setField<String>('login_hash', value);

  DateTime? get registeredAt => getField<DateTime>('registered_at');
  set registeredAt(DateTime? value) =>
      setField<DateTime>('registered_at', value);

  DateTime? get lastAccessedAt => getField<DateTime>('last_accessed_at');
  set lastAccessedAt(DateTime? value) =>
      setField<DateTime>('last_accessed_at', value);
}
