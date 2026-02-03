import '../database.dart';

class AdminSettingsTable extends SupabaseTable<AdminSettingsRow> {
  @override
  String get tableName => 'admin_settings';

  @override
  AdminSettingsRow createRow(Map<String, dynamic> data) =>
      AdminSettingsRow(data);
}

class AdminSettingsRow extends SupabaseDataRow {
  AdminSettingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AdminSettingsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  int? get defaultChaseRadiusMeters =>
      getField<int>('default_chase_radius_meters');
  set defaultChaseRadiusMeters(int? value) =>
      setField<int>('default_chase_radius_meters', value);

  int? get defaultHpDrainPerSecond =>
      getField<int>('default_hp_drain_per_second');
  set defaultHpDrainPerSecond(int? value) =>
      setField<int>('default_hp_drain_per_second', value);

  int? get maxGameParticipants => getField<int>('max_game_participants');
  set maxGameParticipants(int? value) =>
      setField<int>('max_game_participants', value);

  bool? get maintenanceMode => getField<bool>('maintenance_mode');
  set maintenanceMode(bool? value) => setField<bool>('maintenance_mode', value);

  String? get minAppVersion => getField<String>('min_app_version');
  set minAppVersion(String? value) =>
      setField<String>('min_app_version', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);
}
