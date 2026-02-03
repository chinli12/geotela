import '../database.dart';

class AppFeedbackTable extends SupabaseTable<AppFeedbackRow> {
  @override
  String get tableName => 'app_feedback';

  @override
  AppFeedbackRow createRow(Map<String, dynamic> data) => AppFeedbackRow(data);
}

class AppFeedbackRow extends SupabaseDataRow {
  AppFeedbackRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppFeedbackTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  String? get appVersion => getField<String>('app_version');
  set appVersion(String? value) => setField<String>('app_version', value);

  dynamic? get deviceInfo => getField<dynamic>('device_info');
  set deviceInfo(dynamic? value) => setField<dynamic>('device_info', value);

  dynamic? get locationData => getField<dynamic>('location_data');
  set locationData(dynamic? value) => setField<dynamic>('location_data', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get adminNotes => getField<String>('admin_notes');
  set adminNotes(String? value) => setField<String>('admin_notes', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
