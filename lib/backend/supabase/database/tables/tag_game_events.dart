import '../database.dart';

class TagGameEventsTable extends SupabaseTable<TagGameEventsRow> {
  @override
  String get tableName => 'tag_game_events';

  @override
  TagGameEventsRow createRow(Map<String, dynamic> data) =>
      TagGameEventsRow(data);
}

class TagGameEventsRow extends SupabaseDataRow {
  TagGameEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TagGameEventsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get gameId => getField<String>('game_id')!;
  set gameId(String value) => setField<String>('game_id', value);

  String? get participantId => getField<String>('participant_id');
  set participantId(String? value) => setField<String>('participant_id', value);

  String get eventType => getField<String>('event_type')!;
  set eventType(String value) => setField<String>('event_type', value);

  dynamic? get eventData => getField<dynamic>('event_data');
  set eventData(dynamic? value) => setField<dynamic>('event_data', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
