import '../database.dart';

class UserChallengeProgressTable
    extends SupabaseTable<UserChallengeProgressRow> {
  @override
  String get tableName => 'user_challenge_progress';

  @override
  UserChallengeProgressRow createRow(Map<String, dynamic> data) =>
      UserChallengeProgressRow(data);
}

class UserChallengeProgressRow extends SupabaseDataRow {
  UserChallengeProgressRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserChallengeProgressTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool? get isCompleted => getField<bool>('is_completed');
  set isCompleted(bool? value) => setField<bool>('is_completed', value);

  int? get dailyChallengeId => getField<int>('daily_challenge_id');
  set dailyChallengeId(int? value) =>
      setField<int>('daily_challenge_id', value);

  int? get currentCount => getField<int>('current_count');
  set currentCount(int? value) => setField<int>('current_count', value);

  bool? get isRewarded => getField<bool>('is_rewarded');
  set isRewarded(bool? value) => setField<bool>('is_rewarded', value);
}
