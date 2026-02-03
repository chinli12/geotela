import '../database.dart';

class BadgesTable extends SupabaseTable<BadgesRow> {
  @override
  String get tableName => 'badges';

  @override
  BadgesRow createRow(Map<String, dynamic> data) => BadgesRow(data);
}

class BadgesRow extends SupabaseDataRow {
  BadgesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BadgesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get iconUrl => getField<String>('icon_url');
  set iconUrl(String? value) => setField<String>('icon_url', value);
}
