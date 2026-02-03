import '../database.dart';

class QuizResultsTable extends SupabaseTable<QuizResultsRow> {
  @override
  String get tableName => 'quiz_results';

  @override
  QuizResultsRow createRow(Map<String, dynamic> data) => QuizResultsRow(data);
}

class QuizResultsRow extends SupabaseDataRow {
  QuizResultsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => QuizResultsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get storyTitle => getField<String>('story_title');
  set storyTitle(String? value) => setField<String>('story_title', value);

  int get score => getField<int>('score')!;
  set score(int value) => setField<int>('score', value);

  int get totalQuestions => getField<int>('total_questions')!;
  set totalQuestions(int value) => setField<int>('total_questions', value);

  int get xpEarned => getField<int>('xp_earned')!;
  set xpEarned(int value) => setField<int>('xp_earned', value);

  DateTime? get completedAt => getField<DateTime>('completed_at');
  set completedAt(DateTime? value) => setField<DateTime>('completed_at', value);
}
