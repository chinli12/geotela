import '../database.dart';

class SupportTicketsTable extends SupabaseTable<SupportTicketsRow> {
  @override
  String get tableName => 'support_tickets';

  @override
  SupportTicketsRow createRow(Map<String, dynamic> data) =>
      SupportTicketsRow(data);
}

class SupportTicketsRow extends SupabaseDataRow {
  SupportTicketsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SupportTicketsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get subject => getField<String>('subject')!;
  set subject(String value) => setField<String>('subject', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get priority => getField<String>('priority');
  set priority(String? value) => setField<String>('priority', value);

  DateTime? get lastReply => getField<DateTime>('last_reply');
  set lastReply(DateTime? value) => setField<DateTime>('last_reply', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);
}
