import '../database.dart';

class PlacesVisitedTable extends SupabaseTable<PlacesVisitedRow> {
  @override
  String get tableName => 'places_visited';

  @override
  PlacesVisitedRow createRow(Map<String, dynamic> data) =>
      PlacesVisitedRow(data);
}

class PlacesVisitedRow extends SupabaseDataRow {
  PlacesVisitedRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlacesVisitedTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  DateTime? get visitedAt => getField<DateTime>('visited_at');
  set visitedAt(DateTime? value) => setField<DateTime>('visited_at', value);
}
