import '../database.dart';

class InvestmentPlansTable extends SupabaseTable<InvestmentPlansRow> {
  @override
  String get tableName => 'investment_plans';

  @override
  InvestmentPlansRow createRow(Map<String, dynamic> data) =>
      InvestmentPlansRow(data);
}

class InvestmentPlansRow extends SupabaseDataRow {
  InvestmentPlansRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => InvestmentPlansTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  double get returnRate => getField<double>('return_rate')!;
  set returnRate(double value) => setField<double>('return_rate', value);

  String get returnInterval => getField<String>('return_interval')!;
  set returnInterval(String value) =>
      setField<String>('return_interval', value);

  String get period => getField<String>('period')!;
  set period(String value) => setField<String>('period', value);

  double get minAmount => getField<double>('min_amount')!;
  set minAmount(double value) => setField<double>('min_amount', value);

  double? get maxAmount => getField<double>('max_amount');
  set maxAmount(double? value) => setField<double>('max_amount', value);

  String get totalReturn => getField<String>('total_return')!;
  set totalReturn(String value) => setField<String>('total_return', value);

  List<String> get features => getListField<String>('features');
  set features(List<String>? value) => setListField<String>('features', value);

  bool? get isFeatured => getField<bool>('is_featured');
  set isFeatured(bool? value) => setField<bool>('is_featured', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
