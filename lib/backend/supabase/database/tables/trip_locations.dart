import '../database.dart';

class TripLocationsTable extends SupabaseTable<TripLocationsRow> {
  @override
  String get tableName => 'trip_locations';

  @override
  TripLocationsRow createRow(Map<String, dynamic> data) =>
      TripLocationsRow(data);
}

class TripLocationsRow extends SupabaseDataRow {
  TripLocationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TripLocationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get tripPlanId => getField<String>('trip_plan_id');
  set tripPlanId(String? value) => setField<String>('trip_plan_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get estimatedTime => getField<String>('estimated_time');
  set estimatedTime(String? value) => setField<String>('estimated_time', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  int? get orderIndex => getField<int>('order_index');
  set orderIndex(int? value) => setField<int>('order_index', value);

  bool? get completed => getField<bool>('completed');
  set completed(bool? value) => setField<bool>('completed', value);
}
