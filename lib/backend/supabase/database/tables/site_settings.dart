import '../database.dart';

class SiteSettingsTable extends SupabaseTable<SiteSettingsRow> {
  @override
  String get tableName => 'site_settings';

  @override
  SiteSettingsRow createRow(Map<String, dynamic> data) => SiteSettingsRow(data);
}

class SiteSettingsRow extends SupabaseDataRow {
  SiteSettingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SiteSettingsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get siteName => getField<String>('site_name')!;
  set siteName(String value) => setField<String>('site_name', value);

  String get siteEmail => getField<String>('site_email')!;
  set siteEmail(String value) => setField<String>('site_email', value);

  String? get siteDescription => getField<String>('site_description');
  set siteDescription(String? value) =>
      setField<String>('site_description', value);

  String? get supportEmail => getField<String>('support_email');
  set supportEmail(String? value) => setField<String>('support_email', value);

  bool? get maintenanceMode => getField<bool>('maintenance_mode');
  set maintenanceMode(bool? value) => setField<bool>('maintenance_mode', value);

  double get minimumDeposit => getField<double>('minimum_deposit')!;
  set minimumDeposit(double value) =>
      setField<double>('minimum_deposit', value);

  double get minimumWithdrawal => getField<double>('minimum_withdrawal')!;
  set minimumWithdrawal(double value) =>
      setField<double>('minimum_withdrawal', value);

  double get referralBonus => getField<double>('referral_bonus')!;
  set referralBonus(double value) => setField<double>('referral_bonus', value);

  double get withdrawalFee => getField<double>('withdrawal_fee')!;
  set withdrawalFee(double value) => setField<double>('withdrawal_fee', value);

  double get signupBonus => getField<double>('signup_bonus')!;
  set signupBonus(double value) => setField<double>('signup_bonus', value);

  bool? get allowSignups => getField<bool>('allow_signups');
  set allowSignups(bool? value) => setField<bool>('allow_signups', value);

  bool? get allowWithdrawals => getField<bool>('allow_withdrawals');
  set allowWithdrawals(bool? value) =>
      setField<bool>('allow_withdrawals', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);
}
