import '../database.dart';

class AIChatTable extends SupabaseTable<AIChatRow> {
  @override
  String get tableName => 'AI chat';

  @override
  AIChatRow createRow(Map<String, dynamic> data) => AIChatRow(data);
}

class AIChatRow extends SupabaseDataRow {
  AIChatRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AIChatTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
