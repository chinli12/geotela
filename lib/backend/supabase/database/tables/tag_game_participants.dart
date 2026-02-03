import '../database.dart';

class TagGameParticipantsTable extends SupabaseTable<TagGameParticipantsRow> {
  @override
  String get tableName => 'tag_game_participants';

  @override
  TagGameParticipantsRow createRow(Map<String, dynamic> data) =>
      TagGameParticipantsRow(data);
}

class TagGameParticipantsRow extends SupabaseDataRow {
  TagGameParticipantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TagGameParticipantsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get gameId => getField<String>('game_id')!;
  set gameId(String value) => setField<String>('game_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get role => getField<String>('role')!;
  set role(String value) => setField<String>('role', value);

  int? get damageDealt => getField<int>('damage_dealt');
  set damageDealt(int? value) => setField<int>('damage_dealt', value);

  int? get timeInRadiusSeconds => getField<int>('time_in_radius_seconds');
  set timeInRadiusSeconds(int? value) =>
      setField<int>('time_in_radius_seconds', value);

  DateTime get joinedAt => getField<DateTime>('joined_at')!;
  set joinedAt(DateTime value) => setField<DateTime>('joined_at', value);

  DateTime? get leftAt => getField<DateTime>('left_at');
  set leftAt(DateTime? value) => setField<DateTime>('left_at', value);
}
