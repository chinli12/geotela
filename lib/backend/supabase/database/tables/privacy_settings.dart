import '../database.dart';

class PrivacySettingsTable extends SupabaseTable<PrivacySettingsRow> {
  @override
  String get tableName => 'privacy_settings';

  @override
  PrivacySettingsRow createRow(Map<String, dynamic> data) =>
      PrivacySettingsRow(data);
}

class PrivacySettingsRow extends SupabaseDataRow {
  PrivacySettingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PrivacySettingsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get profileVisibility => getField<String>('profile_visibility');
  set profileVisibility(String? value) =>
      setField<String>('profile_visibility', value);

  bool? get locationSharing => getField<bool>('location_sharing');
  set locationSharing(bool? value) => setField<bool>('location_sharing', value);

  bool? get activityStatus => getField<bool>('activity_status');
  set activityStatus(bool? value) => setField<bool>('activity_status', value);

  bool? get messageRequests => getField<bool>('message_requests');
  set messageRequests(bool? value) => setField<bool>('message_requests', value);

  bool? get photoTagging => getField<bool>('photo_tagging');
  set photoTagging(bool? value) => setField<bool>('photo_tagging', value);

  bool? get searchVisibility => getField<bool>('search_visibility');
  set searchVisibility(bool? value) =>
      setField<bool>('search_visibility', value);

  bool? get analyticsSharing => getField<bool>('analytics_sharing');
  set analyticsSharing(bool? value) =>
      setField<bool>('analytics_sharing', value);

  bool? get pushNotifications => getField<bool>('push_notifications');
  set pushNotifications(bool? value) =>
      setField<bool>('push_notifications', value);

  bool? get emailNotifications => getField<bool>('email_notifications');
  set emailNotifications(bool? value) =>
      setField<bool>('email_notifications', value);

  bool? get marketingEmails => getField<bool>('marketing_emails');
  set marketingEmails(bool? value) => setField<bool>('marketing_emails', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
