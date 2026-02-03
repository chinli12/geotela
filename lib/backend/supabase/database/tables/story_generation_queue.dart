import '../database.dart';

class StoryGenerationQueueTable extends SupabaseTable<StoryGenerationQueueRow> {
  @override
  String get tableName => 'story_generation_queue';

  @override
  StoryGenerationQueueRow createRow(Map<String, dynamic> data) =>
      StoryGenerationQueueRow(data);
}

class StoryGenerationQueueRow extends SupabaseDataRow {
  StoryGenerationQueueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StoryGenerationQueueTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  DateTime? get requestedAt => getField<DateTime>('requested_at');
  set requestedAt(DateTime? value) => setField<DateTime>('requested_at', value);

  bool? get processed => getField<bool>('processed');
  set processed(bool? value) => setField<bool>('processed', value);

  DateTime? get processedAt => getField<DateTime>('processed_at');
  set processedAt(DateTime? value) => setField<DateTime>('processed_at', value);

  int? get attempts => getField<int>('attempts');
  set attempts(int? value) => setField<int>('attempts', value);
}
