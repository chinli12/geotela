import '../database.dart';

class TripPlansTable extends SupabaseTable<TripPlansRow> {
  @override
  String get tableName => 'trip_plans';

  @override
  TripPlansRow createRow(Map<String, dynamic> data) => TripPlansRow(data);
}

class TripPlansRow extends SupabaseDataRow {
  TripPlansRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TripPlansTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get date => getField<String>('date');
  set date(String? value) => setField<String>('date', value);

  String? get duration => getField<String>('duration');
  set duration(String? value) => setField<String>('duration', value);

  String? get totalDistance => getField<String>('total_distance');
  set totalDistance(String? value) => setField<String>('total_distance', value);

  String? get difficulty => getField<String>('difficulty');
  set difficulty(String? value) => setField<String>('difficulty', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get public => getField<bool>('public');
  set public(bool? value) => setField<bool>('public', value);
}
