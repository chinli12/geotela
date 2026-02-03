import '../database.dart';

class AllChallengesViewTable extends SupabaseTable<AllChallengesViewRow> {
  @override
  String get tableName => 'all_challenges_view';

  @override
  AllChallengesViewRow createRow(Map<String, dynamic> data) =>
      AllChallengesViewRow(data);
}

class AllChallengesViewRow extends SupabaseDataRow {
  AllChallengesViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AllChallengesViewTable();

  int? get dailyChallengeId => getField<int>('daily_challenge_id');
  set dailyChallengeId(int? value) =>
      setField<int>('daily_challenge_id', value);

  DateTime? get challengeDate => getField<DateTime>('challenge_date');
  set challengeDate(DateTime? value) =>
      setField<DateTime>('challenge_date', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  int? get xpReward => getField<int>('xp_reward');
  set xpReward(int? value) => setField<int>('xp_reward', value);

  int? get targetCount => getField<int>('target_count');
  set targetCount(int? value) => setField<int>('target_count', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get actionKey => getField<String>('action_key');
  set actionKey(String? value) => setField<String>('action_key', value);

  int? get currentCount => getField<int>('current_count');
  set currentCount(int? value) => setField<int>('current_count', value);

  bool? get isCompleted => getField<bool>('is_completed');
  set isCompleted(bool? value) => setField<bool>('is_completed', value);

  bool? get isRewarded => getField<bool>('is_rewarded');
  set isRewarded(bool? value) => setField<bool>('is_rewarded', value);

  bool? get hasJoined => getField<bool>('has_joined');
  set hasJoined(bool? value) => setField<bool>('has_joined', value);

  bool? get isPast => getField<bool>('is_past');
  set isPast(bool? value) => setField<bool>('is_past', value);

  bool? get isToday => getField<bool>('is_today');
  set isToday(bool? value) => setField<bool>('is_today', value);
}
