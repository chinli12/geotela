import '../database.dart';

class QuizTable extends SupabaseTable<QuizRow> {
  @override
  String get tableName => 'quiz';

  @override
  QuizRow createRow(Map<String, dynamic> data) => QuizRow(data);
}

class QuizRow extends SupabaseDataRow {
  QuizRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuizTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get storyId => getField<String>('story_id');
  set storyId(String? value) => setField<String>('story_id', value);

  dynamic get quiz => getField<dynamic>('quiz')!;
  set quiz(dynamic value) => setField<dynamic>('quiz', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
