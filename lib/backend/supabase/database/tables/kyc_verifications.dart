import '../database.dart';

class KycVerificationsTable extends SupabaseTable<KycVerificationsRow> {
  @override
  String get tableName => 'kyc_verifications';

  @override
  KycVerificationsRow createRow(Map<String, dynamic> data) =>
      KycVerificationsRow(data);
}

class KycVerificationsRow extends SupabaseDataRow {
  KycVerificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => KycVerificationsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get idType => getField<String>('id_type')!;
  set idType(String value) => setField<String>('id_type', value);

  String get idPhotoUrl => getField<String>('id_photo_url')!;
  set idPhotoUrl(String value) => setField<String>('id_photo_url', value);

  String get selfieWithIdUrl => getField<String>('selfie_with_id_url')!;
  set selfieWithIdUrl(String value) =>
      setField<String>('selfie_with_id_url', value);

  String get verificationStatus => getField<String>('verification_status')!;
  set verificationStatus(String value) =>
      setField<String>('verification_status', value);

  String? get adminNotes => getField<String>('admin_notes');
  set adminNotes(String? value) => setField<String>('admin_notes', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
