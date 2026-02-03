import '../database.dart';

class DailyChallengesTable extends SupabaseTable<DailyChallengesRow> {
  @override
  String get tableName => 'daily_challenges';

  @override
  DailyChallengesRow createRow(Map<String, dynamic> data) =>
      DailyChallengesRow(data);
}

class DailyChallengesRow extends SupabaseDataRow {
  DailyChallengesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DailyChallengesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get challengeId => getField<int>('challenge_id');
  set challengeId(int? value) => setField<int>('challenge_id', value);

  DateTime? get challengeDate => getField<DateTime>('challenge_date');
  set challengeDate(DateTime? value) =>
      setField<DateTime>('challenge_date', value);

  int? get currentCount => getField<int>('current_count');
  set currentCount(int? value) => setField<int>('current_count', value);

  bool? get isRewarded => getField<bool>('is_rewarded');
  set isRewarded(bool? value) => setField<bool>('is_rewarded', value);
}
