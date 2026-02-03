import '../database.dart';

class RoloEventsTable extends SupabaseTable<RoloEventsRow> {
  @override
  String get tableName => 'rolo_events';

  @override
  RoloEventsRow createRow(Map<String, dynamic> data) => RoloEventsRow(data);
}

class RoloEventsRow extends SupabaseDataRow {
  RoloEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoloEventsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get createdBy => getField<String>('created_by')!;
  set createdBy(String value) => setField<String>('created_by', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get locationName => getField<String>('location_name');
  set locationName(String? value) => setField<String>('location_name', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  DateTime get startTime => getField<DateTime>('start_time')!;
  set startTime(DateTime value) => setField<DateTime>('start_time', value);

  DateTime? get endTime => getField<DateTime>('end_time');
  set endTime(DateTime? value) => setField<DateTime>('end_time', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  int? get maxAttendees => getField<int>('max_attendees');
  set maxAttendees(int? value) => setField<int>('max_attendees', value);

  bool? get isPublic => getField<bool>('is_public');
  set isPublic(bool? value) => setField<bool>('is_public', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
