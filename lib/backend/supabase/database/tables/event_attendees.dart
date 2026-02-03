import '../database.dart';

class EventAttendeesTable extends SupabaseTable<EventAttendeesRow> {
  @override
  String get tableName => 'event_attendees';

  @override
  EventAttendeesRow createRow(Map<String, dynamic> data) =>
      EventAttendeesRow(data);
}

class EventAttendeesRow extends SupabaseDataRow {
  EventAttendeesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventAttendeesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
