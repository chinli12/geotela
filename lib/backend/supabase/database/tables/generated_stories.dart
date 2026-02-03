import '../database.dart';

class GeneratedStoriesTable extends SupabaseTable<GeneratedStoriesRow> {
  @override
  String get tableName => 'generated_stories';

  @override
  GeneratedStoriesRow createRow(Map<String, dynamic> data) =>
      GeneratedStoriesRow(data);
}

class GeneratedStoriesRow extends SupabaseDataRow {
  GeneratedStoriesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GeneratedStoriesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get batchId => getField<String>('batch_id');
  set batchId(String? value) => setField<String>('batch_id', value);

  int? get storyIndex => getField<int>('story_index');
  set storyIndex(int? value) => setField<int>('story_index', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get fullnarrative => getField<String>('fullnarrative');
  set fullnarrative(String? value) => setField<String>('fullnarrative', value);

  int? get readtime => getField<int>('readtime');
  set readtime(int? value) => setField<int>('readtime', value);

  int? get points => getField<int>('points');
  set points(int? value) => setField<int>('points', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  double? get latitude => getField<double>('latitude');
  set latitude(double? value) => setField<double>('latitude', value);

  double? get longitude => getField<double>('longitude');
  set longitude(double? value) => setField<double>('longitude', value);

  dynamic? get aiPayload => getField<dynamic>('ai_payload');
  set aiPayload(dynamic? value) => setField<dynamic>('ai_payload', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
