import '../database.dart';

class CallsTable extends SupabaseTable<CallsRow> {
  @override
  String get tableName => 'calls';

  @override
  CallsRow createRow(Map<String, dynamic> data) => CallsRow(data);
}

class CallsRow extends SupabaseDataRow {
  CallsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CallsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get conversationId => getField<String>('conversation_id');
  set conversationId(String? value) =>
      setField<String>('conversation_id', value);

  String? get callerId => getField<String>('caller_id');
  set callerId(String? value) => setField<String>('caller_id', value);

  String? get calleeId => getField<String>('callee_id');
  set calleeId(String? value) => setField<String>('callee_id', value);

  String? get callType => getField<String>('call_type');
  set callType(String? value) => setField<String>('call_type', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get startedAt => getField<DateTime>('started_at');
  set startedAt(DateTime? value) => setField<DateTime>('started_at', value);

  DateTime? get endedAt => getField<DateTime>('ended_at');
  set endedAt(DateTime? value) => setField<DateTime>('ended_at', value);

  int? get durationSeconds => getField<int>('duration_seconds');
  set durationSeconds(int? value) => setField<int>('duration_seconds', value);

  String? get dailyRoomUrl => getField<String>('daily_room_url');
  set dailyRoomUrl(String? value) => setField<String>('daily_room_url', value);
}
