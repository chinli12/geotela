import '../database.dart';

class SupportTicketRepliesTable extends SupabaseTable<SupportTicketRepliesRow> {
  @override
  String get tableName => 'support_ticket_replies';

  @override
  SupportTicketRepliesRow createRow(Map<String, dynamic> data) =>
      SupportTicketRepliesRow(data);
}

class SupportTicketRepliesRow extends SupabaseDataRow {
  SupportTicketRepliesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SupportTicketRepliesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get ticketId => getField<String>('ticket_id');
  set ticketId(String? value) => setField<String>('ticket_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  String? get attachmentUrl => getField<String>('attachment_url');
  set attachmentUrl(String? value) => setField<String>('attachment_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
