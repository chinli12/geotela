import '../database.dart';

class MatviewRefreshQueueTable extends SupabaseTable<MatviewRefreshQueueRow> {
  @override
  String get tableName => 'matview_refresh_queue';

  @override
  MatviewRefreshQueueRow createRow(Map<String, dynamic> data) =>
      MatviewRefreshQueueRow(data);
}

class MatviewRefreshQueueRow extends SupabaseDataRow {
  MatviewRefreshQueueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MatviewRefreshQueueTable();

  String get matviewName => getField<String>('matview_name')!;
  set matviewName(String value) => setField<String>('matview_name', value);

  bool get pending => getField<bool>('pending')!;
  set pending(bool value) => setField<bool>('pending', value);

  DateTime get requestedAt => getField<DateTime>('requested_at')!;
  set requestedAt(DateTime value) => setField<DateTime>('requested_at', value);
}
