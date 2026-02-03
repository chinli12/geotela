import '../database.dart';

class RoloProfilesTable extends SupabaseTable<RoloProfilesRow> {
  @override
  String get tableName => 'rolo_profiles';

  @override
  RoloProfilesRow createRow(Map<String, dynamic> data) => RoloProfilesRow(data);
}

class RoloProfilesRow extends SupabaseDataRow {
  RoloProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoloProfilesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get coverPhotoUrl => getField<String>('cover_photo_url');
  set coverPhotoUrl(String? value) =>
      setField<String>('cover_photo_url', value);

  List<String> get licenseTypes => getListField<String>('license_types');
  set licenseTypes(List<String>? value) =>
      setListField<String>('license_types', value);

  int? get ridingExperienceYears => getField<int>('riding_experience_years');
  set ridingExperienceYears(int? value) =>
      setField<int>('riding_experience_years', value);

  String? get preferredRidingStyle =>
      getField<String>('preferred_riding_style');
  set preferredRidingStyle(String? value) =>
      setField<String>('preferred_riding_style', value);

  String? get instagramHandle => getField<String>('instagram_handle');
  set instagramHandle(String? value) =>
      setField<String>('instagram_handle', value);

  String? get youtubeChannel => getField<String>('youtube_channel');
  set youtubeChannel(String? value) =>
      setField<String>('youtube_channel', value);

  String? get websiteUrl => getField<String>('website_url');
  set websiteUrl(String? value) => setField<String>('website_url', value);

  double? get currentLatitude => getField<double>('current_latitude');
  set currentLatitude(double? value) =>
      setField<double>('current_latitude', value);

  double? get currentLongitude => getField<double>('current_longitude');
  set currentLongitude(double? value) =>
      setField<double>('current_longitude', value);

  DateTime? get lastLocationUpdate =>
      getField<DateTime>('last_location_update');
  set lastLocationUpdate(DateTime? value) =>
      setField<DateTime>('last_location_update', value);

  bool? get locationSharingEnabled =>
      getField<bool>('location_sharing_enabled');
  set locationSharingEnabled(bool? value) =>
      setField<bool>('location_sharing_enabled', value);

  String? get profileVisibility => getField<String>('profile_visibility');
  set profileVisibility(String? value) =>
      setField<String>('profile_visibility', value);

  bool? get pushNotificationsEnabled =>
      getField<bool>('push_notifications_enabled');
  set pushNotificationsEnabled(bool? value) =>
      setField<bool>('push_notifications_enabled', value);

  bool? get emailNotificationsEnabled =>
      getField<bool>('email_notifications_enabled');
  set emailNotificationsEnabled(bool? value) =>
      setField<bool>('email_notifications_enabled', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
