import '../database.dart';

class PrivacyZonesTable extends SupabaseTable<PrivacyZonesRow> {
  @override
  String get tableName => 'privacy_zones';

  @override
  PrivacyZonesRow createRow(Map<String, dynamic> data) => PrivacyZonesRow(data);
}

class PrivacyZonesRow extends SupabaseDataRow {
  PrivacyZonesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PrivacyZonesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  double get centerLatitude => getField<double>('center_latitude')!;
  set centerLatitude(double value) =>
      setField<double>('center_latitude', value);

  double get centerLongitude => getField<double>('center_longitude')!;
  set centerLongitude(double value) =>
      setField<double>('center_longitude', value);

  int get radiusMeters => getField<int>('radius_meters')!;
  set radiusMeters(int value) => setField<int>('radius_meters', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
