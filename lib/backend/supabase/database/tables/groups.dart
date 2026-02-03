import '../database.dart';

class GroupsTable extends SupabaseTable<GroupsRow> {
  @override
  String get tableName => 'groups';

  @override
  GroupsRow createRow(Map<String, dynamic> data) => GroupsRow(data);
}

class GroupsRow extends SupabaseDataRow {
  GroupsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GroupsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get privacy => getField<String>('privacy');
  set privacy(String? value) => setField<String>('privacy', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  List<String> get permision => getListField<String>('permision');
  set permision(List<String>? value) =>
      setListField<String>('permision', value);

  String? get catigoris => getField<String>('catigoris');
  set catigoris(String? value) => setField<String>('catigoris', value);

  dynamic? get rules => getField<dynamic>('rules');
  set rules(dynamic? value) => setField<dynamic>('rules', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
