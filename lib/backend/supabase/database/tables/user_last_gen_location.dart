import '../database.dart';

class UserLastGenLocationTable extends SupabaseTable<UserLastGenLocationRow> {
  @override
  String get tableName => 'user_last_gen_location';

  @override
  UserLastGenLocationRow createRow(Map<String, dynamic> data) =>
      UserLastGenLocationRow(data);
}

class UserLastGenLocationRow extends SupabaseDataRow {
  UserLastGenLocationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserLastGenLocationTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  double get latitude => getField<double>('latitude')!;
  set latitude(double value) => setField<double>('latitude', value);

  double get longitude => getField<double>('longitude')!;
  set longitude(double value) => setField<double>('longitude', value);

  double? get lastGeneratedLatitude =>
      getField<double>('last_generated_latitude');
  set lastGeneratedLatitude(double? value) =>
      setField<double>('last_generated_latitude', value);

  double? get lastGeneratedLongitude =>
      getField<double>('last_generated_longitude');
  set lastGeneratedLongitude(double? value) =>
      setField<double>('last_generated_longitude', value);

  DateTime? get lastGeneratedAt => getField<DateTime>('last_generated_at');
  set lastGeneratedAt(DateTime? value) =>
      setField<DateTime>('last_generated_at', value);

  DateTime? get lastUpdated => getField<DateTime>('last_updated');
  set lastUpdated(DateTime? value) => setField<DateTime>('last_updated', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);
}
