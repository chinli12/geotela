import '../database.dart';

class ChallengePoolTable extends SupabaseTable<ChallengePoolRow> {
  @override
  String get tableName => 'challenge_pool';

  @override
  ChallengePoolRow createRow(Map<String, dynamic> data) =>
      ChallengePoolRow(data);
}

class ChallengePoolRow extends SupabaseDataRow {
  ChallengePoolRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChallengePoolTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get xpReward => getField<int>('xp_reward');
  set xpReward(int? value) => setField<int>('xp_reward', value);

  String? get actionKey => getField<String>('action_key');
  set actionKey(String? value) => setField<String>('action_key', value);

  int? get targetCount => getField<int>('target_count');
  set targetCount(int? value) => setField<int>('target_count', value);

  int? get rewardAmount => getField<int>('reward_amount');
  set rewardAmount(int? value) => setField<int>('reward_amount', value);
}
