import '../database.dart';

class ActivityLogsTable extends SupabaseTable<ActivityLogsRow> {
  @override
  String get tableName => 'activity_logs';

  @override
  ActivityLogsRow createRow(Map<String, dynamic> data) => ActivityLogsRow(data);
}

class ActivityLogsRow extends SupabaseDataRow {
  ActivityLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ActivityLogsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime get activityDate => getField<DateTime>('activity_date')!;
  set activityDate(DateTime value) =>
      setField<DateTime>('activity_date', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
