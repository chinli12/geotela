import '../database.dart';

class EventAttendeesWithProfilesTable
    extends SupabaseTable<EventAttendeesWithProfilesRow> {
  @override
  String get tableName => 'event_attendees_with_profiles';

  @override
  EventAttendeesWithProfilesRow createRow(Map<String, dynamic> data) =>
      EventAttendeesWithProfilesRow(data);
}

class EventAttendeesWithProfilesRow extends SupabaseDataRow {
  EventAttendeesWithProfilesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EventAttendeesWithProfilesTable();

  String? get attendeeId => getField<String>('attendee_id');
  set attendeeId(String? value) => setField<String>('attendee_id', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get profileId => getField<String>('profile_id');
  set profileId(String? value) => setField<String>('profile_id', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  DateTime? get joinedAt => getField<DateTime>('joined_at');
  set joinedAt(DateTime? value) => setField<DateTime>('joined_at', value);
}
