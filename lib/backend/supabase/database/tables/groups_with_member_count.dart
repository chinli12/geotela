import '../database.dart';

class GroupsWithMemberCountTable
    extends SupabaseTable<GroupsWithMemberCountRow> {
  @override
  String get tableName => 'groups_with_member_count';

  @override
  GroupsWithMemberCountRow createRow(Map<String, dynamic> data) =>
      GroupsWithMemberCountRow(data);
}

class GroupsWithMemberCountRow extends SupabaseDataRow {
  GroupsWithMemberCountRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GroupsWithMemberCountTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

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

  int? get memberCount => getField<int>('member_count');
  set memberCount(int? value) => setField<int>('member_count', value);

  bool? get isMember => getField<bool>('is_member');
  set isMember(bool? value) => setField<bool>('is_member', value);
}
