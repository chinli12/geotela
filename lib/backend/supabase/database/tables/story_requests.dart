import '../database.dart';

class StoryRequestsTable extends SupabaseTable<StoryRequestsRow> {
  @override
  String get tableName => 'story_requests';

  @override
  StoryRequestsRow createRow(Map<String, dynamic> data) =>
      StoryRequestsRow(data);
}

class StoryRequestsRow extends SupabaseDataRow {
  StoryRequestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StoryRequestsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  dynamic? get location => getField<dynamic>('location');
  set location(dynamic? value) => setField<dynamic>('location', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get locationName => getField<String>('location_name');
  set locationName(String? value) => setField<String>('location_name', value);

  String? get errorMessage => getField<String>('error_message');
  set errorMessage(String? value) => setField<String>('error_message', value);
}
