import '../database.dart';

class StoriesTable extends SupabaseTable<StoriesRow> {
  @override
  String get tableName => 'stories';

  @override
  StoriesRow createRow(Map<String, dynamic> data) => StoriesRow(data);
}

class StoriesRow extends SupabaseDataRow {
  StoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StoriesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  List<dynamic> get stories => getListField<dynamic>('stories');
  set stories(List<dynamic>? value) => setListField<dynamic>('stories', value);
}
