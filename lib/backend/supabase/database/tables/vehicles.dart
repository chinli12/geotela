import '../database.dart';

class VehiclesTable extends SupabaseTable<VehiclesRow> {
  @override
  String get tableName => 'vehicles';

  @override
  VehiclesRow createRow(Map<String, dynamic> data) => VehiclesRow(data);
}

class VehiclesRow extends SupabaseDataRow {
  VehiclesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VehiclesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get make => getField<String>('make')!;
  set make(String value) => setField<String>('make', value);

  String get model => getField<String>('model')!;
  set model(String value) => setField<String>('model', value);

  int? get year => getField<int>('year');
  set year(int? value) => setField<int>('year', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  String? get licensePlate => getField<String>('license_plate');
  set licensePlate(String? value) => setField<String>('license_plate', value);

  String? get nickname => getField<String>('nickname');
  set nickname(String? value) => setField<String>('nickname', value);

  int? get engineSize => getField<int>('engine_size');
  set engineSize(int? value) => setField<int>('engine_size', value);

  String? get bikeType => getField<String>('bike_type');
  set bikeType(String? value) => setField<String>('bike_type', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  bool? get isPrimary => getField<bool>('is_primary');
  set isPrimary(bool? value) => setField<bool>('is_primary', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
