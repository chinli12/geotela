import '../database.dart';

class SharesTable extends SupabaseTable<SharesRow> {
  @override
  String get tableName => 'shares';

  @override
  SharesRow createRow(Map<String, dynamic> data) => SharesRow(data);
}

class SharesRow extends SupabaseDataRow {
  SharesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SharesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
