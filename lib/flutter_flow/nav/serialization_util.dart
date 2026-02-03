import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';

import '../../flutter_flow/lat_lng.dart';
import '../../flutter_flow/place.dart';
import '../../flutter_flow/uploaded_file.dart';

/// SERIALIZATION HELPERS

String dateTimeRangeToString(DateTimeRange dateTimeRange) {
  final startStr = dateTimeRange.start.millisecondsSinceEpoch.toString();
  final endStr = dateTimeRange.end.millisecondsSinceEpoch.toString();
  return '$startStr|$endStr';
}

String placeToString(FFPlace place) => jsonEncode({
      'latLng': place.latLng.serialize(),
      'name': place.name,
      'address': place.address,
      'city': place.city,
      'state': place.state,
      'country': place.country,
      'zipCode': place.zipCode,
    });

String uploadedFileToString(FFUploadedFile uploadedFile) =>
    uploadedFile.serialize();

String? serializeParam(
  dynamic param,
  ParamType paramType, {
  bool isList = false,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final serializedValues = (param as Iterable)
          .map((p) => serializeParam(p, paramType, isList: false))
          .where((p) => p != null)
          .map((p) => p!)
          .toList();
      return json.encode(serializedValues);
    }
    String? data;
    switch (paramType) {
      case ParamType.int:
        data = param.toString();
      case ParamType.double:
        data = param.toString();
      case ParamType.String:
        data = param;
      case ParamType.bool:
        data = param ? 'true' : 'false';
      case ParamType.DateTime:
        data = (param as DateTime).millisecondsSinceEpoch.toString();
      case ParamType.DateTimeRange:
        data = dateTimeRangeToString(param as DateTimeRange);
      case ParamType.LatLng:
        data = (param as LatLng).serialize();
      case ParamType.Color:
        data = (param as Color).toCssString();
      case ParamType.FFPlace:
        data = placeToString(param as FFPlace);
      case ParamType.FFUploadedFile:
        data = uploadedFileToString(param as FFUploadedFile);
      case ParamType.JSON:
        data = json.encode(param);

      case ParamType.DataStruct:
        data = param is BaseStruct ? param.serialize() : null;

      case ParamType.Enum:
        data = (param is Enum) ? param.serialize() : null;

      case ParamType.SupabaseRow:
        return json.encode((param as SupabaseDataRow).data);

      default:
        data = null;
    }
    return data;
  } catch (e) {
    print('Error serializing parameter: $e');
    return null;
  }
}

/// END SERIALIZATION HELPERS

/// DESERIALIZATION HELPERS

DateTimeRange? dateTimeRangeFromString(String dateTimeRangeStr) {
  final pieces = dateTimeRangeStr.split('|');
  if (pieces.length != 2) {
    return null;
  }
  return DateTimeRange(
    start: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.first)),
    end: DateTime.fromMillisecondsSinceEpoch(int.parse(pieces.last)),
  );
}

LatLng? latLngFromString(String? latLngStr) {
  final pieces = latLngStr?.split(',');
  if (pieces == null || pieces.length != 2) {
    return null;
  }
  return LatLng(
    double.parse(pieces.first.trim()),
    double.parse(pieces.last.trim()),
  );
}

FFPlace placeFromString(String placeStr) {
  final serializedData = jsonDecode(placeStr) as Map<String, dynamic>;
  final data = {
    'latLng': serializedData.containsKey('latLng')
        ? latLngFromString(serializedData['latLng'] as String)
        : const LatLng(0.0, 0.0),
    'name': serializedData['name'] ?? '',
    'address': serializedData['address'] ?? '',
    'city': serializedData['city'] ?? '',
    'state': serializedData['state'] ?? '',
    'country': serializedData['country'] ?? '',
    'zipCode': serializedData['zipCode'] ?? '',
  };
  return FFPlace(
    latLng: data['latLng'] as LatLng,
    name: data['name'] as String,
    address: data['address'] as String,
    city: data['city'] as String,
    state: data['state'] as String,
    country: data['country'] as String,
    zipCode: data['zipCode'] as String,
  );
}

FFUploadedFile uploadedFileFromString(String uploadedFileStr) =>
    FFUploadedFile.deserialize(uploadedFileStr);

enum ParamType {
  int,
  double,
  String,
  bool,
  DateTime,
  DateTimeRange,
  LatLng,
  Color,
  FFPlace,
  FFUploadedFile,
  JSON,

  DataStruct,
  Enum,
  SupabaseRow,

  CustomClass,
  CustomEnum,
}

dynamic deserializeParam<T>(
  String? param,
  ParamType paramType,
  bool isList, {
  StructBuilder<T>? structBuilder,
}) {
  try {
    if (param == null) {
      return null;
    }
    if (isList) {
      final paramValues = json.decode(param);
      if (paramValues is! Iterable || paramValues.isEmpty) {
        return null;
      }
      return paramValues
          .where((p) => p is String)
          .map((p) => p as String)
          .map((p) => deserializeParam<T>(
                p,
                paramType,
                false,
                structBuilder: structBuilder,
              ))
          .where((p) => p != null)
          .map((p) => p! as T)
          .toList();
    }
    switch (paramType) {
      case ParamType.int:
        return int.tryParse(param);
      case ParamType.double:
        return double.tryParse(param);
      case ParamType.String:
        return param;
      case ParamType.bool:
        return param == 'true';
      case ParamType.DateTime:
        final milliseconds = int.tryParse(param);
        return milliseconds != null
            ? DateTime.fromMillisecondsSinceEpoch(milliseconds)
            : null;
      case ParamType.DateTimeRange:
        return dateTimeRangeFromString(param);
      case ParamType.LatLng:
        return latLngFromString(param);
      case ParamType.Color:
        return fromCssColor(param);
      case ParamType.FFPlace:
        return placeFromString(param);
      case ParamType.FFUploadedFile:
        return uploadedFileFromString(param);
      case ParamType.JSON:
        return json.decode(param);

      case ParamType.SupabaseRow:
        final data = json.decode(param) as Map<String, dynamic>;
        switch (T) {
          case RoloProfilesRow:
            return RoloProfilesRow(data);
          case QuizResultsRow:
            return QuizResultsRow(data);
          case AppFeedbackRow:
            return AppFeedbackRow(data);
          case GroupsRow:
            return GroupsRow(data);
          case GeneratedStoriesRow:
            return GeneratedStoriesRow(data);
          case StoryGenerationQueueRow:
            return StoryGenerationQueueRow(data);
          case SupportTicketsRow:
            return SupportTicketsRow(data);
          case EventAttendeesWithProfilesRow:
            return EventAttendeesWithProfilesRow(data);
          case MessageReadStatusRow:
            return MessageReadStatusRow(data);
          case ConversationParticipantsRow:
            return ConversationParticipantsRow(data);
          case UserBadgesRow:
            return UserBadgesRow(data);
          case AIChatRow:
            return AIChatRow(data);
          case FollowersRow:
            return FollowersRow(data);
          case RulesRow:
            return RulesRow(data);
          case PoisRow:
            return PoisRow(data);
          case AllChallengesViewRow:
            return AllChallengesViewRow(data);
          case NotificationQueueRow:
            return NotificationQueueRow(data);
          case VehiclesRow:
            return VehiclesRow(data);
          case TagGamesRow:
            return TagGamesRow(data);
          case RoloEventsRow:
            return RoloEventsRow(data);
          case ProfileWithCountsRow:
            return ProfileWithCountsRow(data);
          case CheckinsRow:
            return CheckinsRow(data);
          case CallsRow:
            return CallsRow(data);
          case LocationAlertsRow:
            return LocationAlertsRow(data);
          case TripPlansWithLocationCountsAndCompletedRow:
            return TripPlansWithLocationCountsAndCompletedRow(data);
          case DepositsRow:
            return DepositsRow(data);
          case CommentsWithMetaRow:
            return CommentsWithMetaRow(data);
          case ProfilesRow:
            return ProfilesRow(data);
          case StoriesRow:
            return StoriesRow(data);
          case TopicsRow:
            return TopicsRow(data);
          case GameRegistrationsRow:
            return GameRegistrationsRow(data);
          case TransactionsRow:
            return TransactionsRow(data);
          case PrivacyZonesRow:
            return PrivacyZonesRow(data);
          case ActivityLogsRow:
            return ActivityLogsRow(data);
          case LoginHistoryRow:
            return LoginHistoryRow(data);
          case UserLastGenLocationRow:
            return UserLastGenLocationRow(data);
          case BeaconsRow:
            return BeaconsRow(data);
          case PostsRow:
            return PostsRow(data);
          case TodayChallengesViewRow:
            return TodayChallengesViewRow(data);
          case KycVerificationsRow:
            return KycVerificationsRow(data);
          case CommentLikesRow:
            return CommentLikesRow(data);
          case MatviewRefreshQueueRow:
            return MatviewRefreshQueueRow(data);
          case XpLeaderboardRow:
            return XpLeaderboardRow(data);
          case TripPlansRow:
            return TripPlansRow(data);
          case QuizRow:
            return QuizRow(data);
          case PrivacySettingsRow:
            return PrivacySettingsRow(data);
          case SavedPlacesRow:
            return SavedPlacesRow(data);
          case ProfilesWithCountsRow:
            return ProfilesWithCountsRow(data);
          case TagGameParticipantsRow:
            return TagGameParticipantsRow(data);
          case PlacesVisitedRow:
            return PlacesVisitedRow(data);
          case PostsWithMetaRow:
            return PostsWithMetaRow(data);
          case SharesRow:
            return SharesRow(data);
          case BadgesRow:
            return BadgesRow(data);
          case UserChallengeProgressRow:
            return UserChallengeProgressRow(data);
          case TagGameEventsRow:
            return TagGameEventsRow(data);
          case TripPlansWithLocationCountsRow:
            return TripPlansWithLocationCountsRow(data);
          case PostsWithMetaVideoRow:
            return PostsWithMetaVideoRow(data);
          case MessagesRow:
            return MessagesRow(data);
          case SiteSettingsRow:
            return SiteSettingsRow(data);
          case GroupMembersWithProfilesRow:
            return GroupMembersWithProfilesRow(data);
          case WithdrawalsRow:
            return WithdrawalsRow(data);
          case EventAttendeesRow:
            return EventAttendeesRow(data);
          case AdminSettingsRow:
            return AdminSettingsRow(data);
          case EventsRow:
            return EventsRow(data);
          case CommentsRow:
            return CommentsRow(data);
          case AiChatMessagesRow:
            return AiChatMessagesRow(data);
          case InvestmentPlansRow:
            return InvestmentPlansRow(data);
          case ChallengePoolRow:
            return ChallengePoolRow(data);
          case PostsWithMetaImagesRow:
            return PostsWithMetaImagesRow(data);
          case LikesRow:
            return LikesRow(data);
          case GroupsWithMemberCountRow:
            return GroupsWithMemberCountRow(data);
          case DailyChallengesRow:
            return DailyChallengesRow(data);
          case StoryRequestsRow:
            return StoryRequestsRow(data);
          case GroupMembersRow:
            return GroupMembersRow(data);
          case TripLocationsRow:
            return TripLocationsRow(data);
          case NotificationsRow:
            return NotificationsRow(data);
          case ConversationsRow:
            return ConversationsRow(data);
          case RoloEventAttendeesRow:
            return RoloEventAttendeesRow(data);
          case InvestmentsRow:
            return InvestmentsRow(data);
          case SupportTicketRepliesRow:
            return SupportTicketRepliesRow(data);
          default:
            return null;
        }

      case ParamType.DataStruct:
        final data = json.decode(param) as Map<String, dynamic>? ?? {};
        return structBuilder != null ? structBuilder(data) : null;

      case ParamType.Enum:
        return deserializeEnum<T>(param);

      default:
        return null;
    }
  } catch (e) {
    print('Error deserializing parameter: $e');
    return null;
  }
}
