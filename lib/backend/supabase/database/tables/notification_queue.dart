import '../database.dart';

class NotificationQueueTable extends SupabaseTable<NotificationQueueRow> {
  @override
  String get tableName => 'notification_queue';

  @override
  NotificationQueueRow createRow(Map<String, dynamic> data) =>
      NotificationQueueRow(data);
}

class NotificationQueueRow extends SupabaseDataRow {
  NotificationQueueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationQueueTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  dynamic get payload => getField<dynamic>('payload')!;
  set payload(dynamic value) => setField<dynamic>('payload', value);

  String get channel => getField<String>('channel')!;
  set channel(String value) => setField<String>('channel', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get processed => getField<bool>('processed');
  set processed(bool? value) => setField<bool>('processed', value);

  DateTime? get processedAt => getField<DateTime>('processed_at');
  set processedAt(DateTime? value) => setField<DateTime>('processed_at', value);
}
