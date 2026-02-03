import '../database.dart';

class BeaconsTable extends SupabaseTable<BeaconsRow> {
  @override
  String get tableName => 'beacons';

  @override
  BeaconsRow createRow(Map<String, dynamic> data) => BeaconsRow(data);
}

class BeaconsRow extends SupabaseDataRow {
  BeaconsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BeaconsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double get latitude => getField<double>('latitude')!;
  set latitude(double value) => setField<double>('latitude', value);

  double get longitude => getField<double>('longitude')!;
  set longitude(double value) => setField<double>('longitude', value);

  DateTime get expiresAt => getField<DateTime>('expires_at')!;
  set expiresAt(DateTime value) => setField<DateTime>('expires_at', value);

  int? get maxParticipants => getField<int>('max_participants');
  set maxParticipants(int? value) => setField<int>('max_participants', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
