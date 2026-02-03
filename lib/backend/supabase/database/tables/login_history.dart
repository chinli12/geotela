import '../database.dart';

class LoginHistoryTable extends SupabaseTable<LoginHistoryRow> {
  @override
  String get tableName => 'login_history';

  @override
  LoginHistoryRow createRow(Map<String, dynamic> data) => LoginHistoryRow(data);
}

class LoginHistoryRow extends SupabaseDataRow {
  LoginHistoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LoginHistoryTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get loginAt => getField<DateTime>('login_at');
  set loginAt(DateTime? value) => setField<DateTime>('login_at', value);

  String? get ipAddress => getField<String>('ip_address');
  set ipAddress(String? value) => setField<String>('ip_address', value);

  String? get browser => getField<String>('browser');
  set browser(String? value) => setField<String>('browser', value);

  String? get os => getField<String>('os');
  set os(String? value) => setField<String>('os', value);

  String? get deviceType => getField<String>('device_type');
  set deviceType(String? value) => setField<String>('device_type', value);

  dynamic? get location => getField<dynamic>('location');
  set location(dynamic? value) => setField<dynamic>('location', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
