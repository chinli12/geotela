import '../database.dart';

class RoloEventAttendeesTable extends SupabaseTable<RoloEventAttendeesRow> {
  @override
  String get tableName => 'rolo_event_attendees';

  @override
  RoloEventAttendeesRow createRow(Map<String, dynamic> data) =>
      RoloEventAttendeesRow(data);
}

class RoloEventAttendeesRow extends SupabaseDataRow {
  RoloEventAttendeesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoloEventAttendeesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
