import '../database.dart';

class LocationAlertsTable extends SupabaseTable<LocationAlertsRow> {
  @override
  String get tableName => 'location_alerts';

  @override
  LocationAlertsRow createRow(Map<String, dynamic> data) =>
      LocationAlertsRow(data);
}

class LocationAlertsRow extends SupabaseDataRow {
  LocationAlertsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationAlertsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String get message => getField<String>('message')!;
  set message(String value) => setField<String>('message', value);

  double get latitude => getField<double>('latitude')!;
  set latitude(double value) => setField<double>('latitude', value);

  double get longitude => getField<double>('longitude')!;
  set longitude(double value) => setField<double>('longitude', value);

  int? get radius => getField<int>('radius');
  set radius(int? value) => setField<int>('radius', value);

  String? get alertType => getField<String>('alert_type');
  set alertType(String? value) => setField<String>('alert_type', value);

  bool? get isRead => getField<bool>('is_read');
  set isRead(bool? value) => setField<bool>('is_read', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get priority => getField<String>('priority');
  set priority(String? value) => setField<String>('priority', value);

  String? get source => getField<String>('source');
  set source(String? value) => setField<String>('source', value);

  DateTime? get expiresAt => getField<DateTime>('expires_at');
  set expiresAt(DateTime? value) => setField<DateTime>('expires_at', value);
}
