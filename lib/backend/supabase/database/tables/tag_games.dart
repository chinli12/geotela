import '../database.dart';

class TagGamesTable extends SupabaseTable<TagGamesRow> {
  @override
  String get tableName => 'tag_games';

  @override
  TagGamesRow createRow(Map<String, dynamic> data) => TagGamesRow(data);
}

class TagGamesRow extends SupabaseDataRow {
  TagGamesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TagGamesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get createdBy => getField<String>('created_by')!;
  set createdBy(String value) => setField<String>('created_by', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  int? get targetStartHp => getField<int>('target_start_hp');
  set targetStartHp(int? value) => setField<int>('target_start_hp', value);

  int? get hpDrainPerSecond => getField<int>('hp_drain_per_second');
  set hpDrainPerSecond(int? value) =>
      setField<int>('hp_drain_per_second', value);

  int? get chaseRadiusMeters => getField<int>('chase_radius_meters');
  set chaseRadiusMeters(int? value) =>
      setField<int>('chase_radius_meters', value);

  int? get maxParticipants => getField<int>('max_participants');
  set maxParticipants(int? value) => setField<int>('max_participants', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get currentTargetHp => getField<int>('current_target_hp');
  set currentTargetHp(int? value) => setField<int>('current_target_hp', value);

  DateTime? get startedAt => getField<DateTime>('started_at');
  set startedAt(DateTime? value) => setField<DateTime>('started_at', value);

  DateTime? get endedAt => getField<DateTime>('ended_at');
  set endedAt(DateTime? value) => setField<DateTime>('ended_at', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
