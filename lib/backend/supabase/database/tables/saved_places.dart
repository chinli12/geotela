import '../database.dart';

class SavedPlacesTable extends SupabaseTable<SavedPlacesRow> {
  @override
  String get tableName => 'saved_places';

  @override
  SavedPlacesRow createRow(Map<String, dynamic> data) => SavedPlacesRow(data);
}

class SavedPlacesRow extends SupabaseDataRow {
  SavedPlacesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SavedPlacesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get savedAt => getField<DateTime>('saved_at');
  set savedAt(DateTime? value) => setField<DateTime>('saved_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get fullNarrative => getField<String>('fullNarrative');
  set fullNarrative(String? value) => setField<String>('fullNarrative', value);

  int? get readTime => getField<int>('readTime');
  set readTime(int? value) => setField<int>('readTime', value);

  int? get points => getField<int>('points');
  set points(int? value) => setField<int>('points', value);

  dynamic? get stories => getField<dynamic>('stories');
  set stories(dynamic? value) => setField<dynamic>('stories', value);

  String? get storyId => getField<String>('story_id');
  set storyId(String? value) => setField<String>('story_id', value);
}
