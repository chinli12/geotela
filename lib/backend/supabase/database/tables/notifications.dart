import '../database.dart';

class NotificationsTable extends SupabaseTable<NotificationsRow> {
  @override
  String get tableName => 'notifications';

  @override
  NotificationsRow createRow(Map<String, dynamic> data) =>
      NotificationsRow(data);
}

class NotificationsRow extends SupabaseDataRow {
  NotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get sentAt => getField<DateTime>('sent_at');
  set sentAt(DateTime? value) => setField<DateTime>('sent_at', value);

  String get sender => getField<String>('sender')!;
  set sender(String value) => setField<String>('sender', value);

  String get subject => getField<String>('subject')!;
  set subject(String value) => setField<String>('subject', value);

  String? get via => getField<String>('via');
  set via(String? value) => setField<String>('via', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  bool? get reead => getField<bool>('reead');
  set reead(bool? value) => setField<bool>('reead', value);

  String? get post => getField<String>('post');
  set post(String? value) => setField<String>('post', value);

  String? get converstaion => getField<String>('converstaion');
  set converstaion(String? value) => setField<String>('converstaion', value);

  String? get senderUsername => getField<String>('sender_username');
  set senderUsername(String? value) =>
      setField<String>('sender_username', value);

  String? get senderAvatar => getField<String>('sender_avatar');
  set senderAvatar(String? value) => setField<String>('sender_avatar', value);

  int? get msgCount => getField<int>('msg_count');
  set msgCount(int? value) => setField<int>('msg_count', value);
}
