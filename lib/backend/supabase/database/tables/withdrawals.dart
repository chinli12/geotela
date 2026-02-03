import '../database.dart';

class WithdrawalsTable extends SupabaseTable<WithdrawalsRow> {
  @override
  String get tableName => 'withdrawals';

  @override
  WithdrawalsRow createRow(Map<String, dynamic> data) => WithdrawalsRow(data);
}

class WithdrawalsRow extends SupabaseDataRow {
  WithdrawalsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WithdrawalsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double get amount => getField<double>('amount')!;
  set amount(double value) => setField<double>('amount', value);

  double? get charge => getField<double>('charge');
  set charge(double? value) => setField<double>('charge', value);

  String? get method => getField<String>('method');
  set method(String? value) => setField<String>('method', value);

  double? get conversionRate => getField<double>('conversion_rate');
  set conversionRate(double? value) =>
      setField<double>('conversion_rate', value);

  String? get currency => getField<String>('currency');
  set currency(String? value) => setField<String>('currency', value);

  String? get referenceId => getField<String>('reference_id');
  set referenceId(String? value) => setField<String>('reference_id', value);

  dynamic? get accountDetails => getField<dynamic>('account_details');
  set accountDetails(dynamic? value) =>
      setField<dynamic>('account_details', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
