import '../database.dart';

class InvestmentsTable extends SupabaseTable<InvestmentsRow> {
  @override
  String get tableName => 'investments';

  @override
  InvestmentsRow createRow(Map<String, dynamic> data) => InvestmentsRow(data);
}

class InvestmentsRow extends SupabaseDataRow {
  InvestmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InvestmentsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);

  double get interestRate => getField<double>('interest_rate')!;
  set interestRate(double value) => setField<double>('interest_rate', value);

  double? get interestEarned => getField<double>('interest_earned');
  set interestEarned(double? value) =>
      setField<double>('interest_earned', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get investmentPlanId => getField<String>('investment_plan_id');
  set investmentPlanId(String? value) =>
      setField<String>('investment_plan_id', value);
}
