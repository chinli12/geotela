import '../database.dart';

class GroupMembersWithProfilesTable
    extends SupabaseTable<GroupMembersWithProfilesRow> {
  @override
  String get tableName => 'group_members_with_profiles';

  @override
  GroupMembersWithProfilesRow createRow(Map<String, dynamic> data) =>
      GroupMembersWithProfilesRow(data);
}

class GroupMembersWithProfilesRow extends SupabaseDataRow {
  GroupMembersWithProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GroupMembersWithProfilesTable();

  String? get membershipId => getField<String>('membership_id');
  set membershipId(String? value) => setField<String>('membership_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get profileImage => getField<String>('profile_image');
  set profileImage(String? value) => setField<String>('profile_image', value);

  String? get groupId => getField<String>('group_id');
  set groupId(String? value) => setField<String>('group_id', value);

  String? get groupName => getField<String>('group_name');
  set groupName(String? value) => setField<String>('group_name', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  DateTime? get joinedAt => getField<DateTime>('joined_at');
  set joinedAt(DateTime? value) => setField<DateTime>('joined_at', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);
}
