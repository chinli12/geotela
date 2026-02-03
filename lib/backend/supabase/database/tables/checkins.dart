import '../database.dart';

class CheckinsTable extends SupabaseTable<CheckinsRow> {
  @override
  String get tableName => 'checkins';

  @override
  CheckinsRow createRow(Map<String, dynamic> data) => CheckinsRow(data);
}

class CheckinsRow extends SupabaseDataRow {
  CheckinsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CheckinsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  double get latitude => getField<double>('latitude')!;
  set latitude(double value) => setField<double>('latitude', value);

  double get longitude => getField<double>('longitude')!;
  set longitude(double value) => setField<double>('longitude', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  DateTime get expiresAt => getField<DateTime>('expires_at')!;
  set expiresAt(DateTime value) => setField<DateTime>('expires_at', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
