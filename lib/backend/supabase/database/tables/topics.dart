import '../database.dart';

class TopicsTable extends SupabaseTable<TopicsRow> {
  @override
  String get tableName => 'topics';

  @override
  TopicsRow createRow(Map<String, dynamic> data) => TopicsRow(data);
}

class TopicsRow extends SupabaseDataRow {
  TopicsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TopicsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get content => getField<String>('content')!;
  set content(String value) => setField<String>('content', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
