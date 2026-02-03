import '../database.dart';

class TripPlansWithLocationCountsTable
    extends SupabaseTable<TripPlansWithLocationCountsRow> {
  @override
  String get tableName => 'trip_plans_with_location_counts';

  @override
  TripPlansWithLocationCountsRow createRow(Map<String, dynamic> data) =>
      TripPlansWithLocationCountsRow(data);
}

class TripPlansWithLocationCountsRow extends SupabaseDataRow {
  TripPlansWithLocationCountsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TripPlansWithLocationCountsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

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

  int? get tripLocationCount => getField<int>('trip_location_count');
  set tripLocationCount(int? value) =>
      setField<int>('trip_location_count', value);
}
