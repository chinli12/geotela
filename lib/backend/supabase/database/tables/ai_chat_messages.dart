import '../database.dart';

class AiChatMessagesTable extends SupabaseTable<AiChatMessagesRow> {
  @override
  String get tableName => 'Ai_chat_messages';

  @override
  AiChatMessagesRow createRow(Map<String, dynamic> data) =>
      AiChatMessagesRow(data);
}

class AiChatMessagesRow extends SupabaseDataRow {
  AiChatMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiChatMessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  bool? get isAi => getField<bool>('is_ai');
  set isAi(bool? value) => setField<bool>('is_ai', value);

  String? get achat => getField<String>('Achat');
  set achat(String? value) => setField<String>('Achat', value);
}
