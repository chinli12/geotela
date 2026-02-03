import '../database.dart';

class RulesTable extends SupabaseTable<RulesRow> {
  @override
  String get tableName => 'rules';

  @override
  RulesRow createRow(Map<String, dynamic> data) => RulesRow(data);
}

class RulesRow extends SupabaseDataRow {
  RulesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RulesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get groupId => getField<String>('group_id');
  set groupId(String? value) => setField<String>('group_id', value);
}
