import '../database.dart';

class ConversationsTable extends SupabaseTable<ConversationsRow> {
  @override
  String get tableName => 'conversations';

  @override
  ConversationsRow createRow(Map<String, dynamic> data) =>
      ConversationsRow(data);
}

class ConversationsRow extends SupabaseDataRow {
  ConversationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConversationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get lastMessageAt => getField<DateTime>('last_message_at');
  set lastMessageAt(DateTime? value) =>
      setField<DateTime>('last_message_at', value);

  String? get lastMessageId => getField<String>('last_message_id');
  set lastMessageId(String? value) =>
      setField<String>('last_message_id', value);

  List<String> get users => getListField<String>('users');
  set users(List<String>? value) => setListField<String>('users', value);

  bool? get typing => getField<bool>('typing');
  set typing(bool? value) => setField<bool>('typing', value);

  String? get typiuser => getField<String>('typiuser');
  set typiuser(String? value) => setField<String>('typiuser', value);
}
