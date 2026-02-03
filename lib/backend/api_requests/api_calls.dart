import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start getsupabase Group Code

class GetsupabaseGroup {
  static String getBaseUrl() =>
      'https://deycthvditigtcwtvals.supabase.co/rest/v1';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRleWN0aHZkaXRpZ3Rjd3R2YWxzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYwMjQyMjgsImV4cCI6MjA1MTYwMDIyOH0.uokijIkfv2jGMH4xWNzYiqiaBOr5UeFUQM7FA2tZZfQ',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRleWN0aHZkaXRpZ3Rjd3R2YWxzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYwMjQyMjgsImV4cCI6MjA1MTYwMDIyOH0.uokijIkfv2jGMH4xWNzYiqiaBOr5UeFUQM7FA2tZZfQ',
  };
  static ProfilesCall profilesCall = ProfilesCall();
  static GroupsCall groupsCall = GroupsCall();
  static PostsCall postsCall = PostsCall();
  static CommentsCall commentsCall = CommentsCall();
  static LikesCall likesCall = LikesCall();
  static CommentlikesCall commentlikesCall = CommentlikesCall();
  static EventsCall eventsCall = EventsCall();
  static EventattendeesCall eventattendeesCall = EventattendeesCall();
  static GroupmembersCall groupmembersCall = GroupmembersCall();
  static ThreedcommentCall threedcommentCall = ThreedcommentCall();
  static ChecklocationupdateCall checklocationupdateCall =
      ChecklocationupdateCall();
  static UpdatestreakoninsertCall updatestreakoninsertCall =
      UpdatestreakoninsertCall();
}




class ChecklocationupdateCall {
  Future<ApiCallResponse> call({
    String? fmc = '',
    String? currentLat = '',
    String? currentLng = '',
    String? locationNameText = '',
     String? key = '',
    String? autkey = '',
  }) async {
    final baseUrl = GetsupabaseGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "current_fcm_token": "${escapeStringForJson(fmc)}",
  "current_lat": "${escapeStringForJson(currentLat)}",
  "current_lng": "${escapeStringForJson(currentLng)}",
  "location_name_text": "${escapeStringForJson(locationNameText)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checklocationupdate',
      apiUrl: '${baseUrl}/rpc/update_location_and_check',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            '${key}',
        'Authorization':
            'Bearer ${autkey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdatestreakoninsertCall {
  Future<ApiCallResponse> call({
    String? key = '',
    String? autkey = '',
  }) async {
    final baseUrl = GetsupabaseGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'updatestreakoninsert',
      apiUrl: '${baseUrl}/update_streak_on_insert',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            '${key}',
        'Authorization':
            'Bearer ${autkey}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End getsupabase Group Code

class UpdatePsswordCall {
  static Future<ApiCallResponse> call({
    String? password = '',
    String? token = '',
    String? key = '',
  }) async {
    final ffApiRequestBody = '''
{
  "password": "${escapeStringForJson(password)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update pssword',
      apiUrl: 'https://deycthvditigtcwtvals.supabase.co/auth/v1/user',
      callType: ApiCallType.PUT,
      headers: {
        'apikey':'${key}',
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class HistoryplaceCall {
  static Future<ApiCallResponse> call({
    String? location = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'historyplace',
      apiUrl:
          'https://nab6wk9x0oev1u-8888.proxy.runpod.net/api/historical_places/${location}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        '[location]': location,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? historyPlace(dynamic response) => getJsonField(
        response,
        r'''$.historical_places''',
        true,
      ) as List?;
  static String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.location''',
      ));
}

class HistorysCall {
  static Future<ApiCallResponse> call({
    String? location = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Historys',
      apiUrl:
          'https://nab6wk9x0oev1u-8888.proxy.runpod.net/api/history/${location}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        '[location]': location,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? history(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.history''',
      ));
  static String? location(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.location''',
      ));
}

class GeminiGetQuestionsCall {
  static Future<ApiCallResponse> call({
    String? geminiApiKey = '',
    String? storyText = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Generate exactly 5 multiple choice questions based on this story. Return ONLY a valid JSON array with this exact structure, no additional text or markdown:\\n[\\n  {\\n    \\"question\\": \\"question text here\\",\\n    \\"options\\": [\\"option 1\\", \\"option 2\\", \\"option 3\\", \\"option 4\\"],\\n    \\"correctAnswer\\": 0,\\n    \\"explanation\\": \\"brief explanation\\"\\n  }\\n]\\n\\nStory: \\"${escapeStringForJson(storyText)}\\"\\n\\nRequirements:\\n- Return ONLY the JSON array, no other text\\n- Each question must have exactly 4 options\\n- correctAnswer is the index (0-3) of the correct option\\n- Questions should test comprehension of the story"
        }
      ]
    }
  ],
  "generationConfig": {
    "temperature": 0.7,
    "maxOutputTokens": 2500
  },
  "safetySettings": [
    {
      "category": "HARM_CATEGORY_HARASSMENT",
      "threshold": "BLOCK_NONE"
    },
    {
      "category": "HARM_CATEGORY_HATE_SPEECH",
      "threshold": "BLOCK_NONE"
    },
    {
      "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
      "threshold": "BLOCK_NONE"
    },
    {
      "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
      "threshold": "BLOCK_NONE"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'geminiGetQuestions',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent?key=${geminiApiKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? quize(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
}

class GeminigethuntCall {
  static Future<ApiCallResponse> call({
    String? geminiApiKey = '',
    String? locationName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Create an array of 8 unique and fun scavenger hunts based on the location: ${escapeStringForJson(locationName)}. Each hunt should be a JSON object with:\\n    - id: unique identifier\\n    - title: A captivating title (max 50 characters)\\n    - description: A brief 2-3 sentence description\\n    - distance: Distance from user (e.g., \\"120m away\\", \\"500m away\\")\\n    - points: Score between 300-700\\n    - category: One of \\"Sports\\", \\"Mystery\\", \\"Technology\\", or \\"History\\"\\n    - tasks: An array of 3-5 strings, where each string is a specific task, riddle, or challenge for the hunt.\\n    \\n    Format as a JSON array with these exact keys: id, title, description, distance, points, category, tasks."
        }
      ]
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'geminigethunt',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent?key=${geminiApiKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? hunt(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
}

class GeminiGenerateTripPlanCall {
  static Future<ApiCallResponse> call({
    String? title = '',
    String? locationContext = '',
    String? todayDate = '',
    String? futureDate = '',
    String? nextMonthDate = '',
    String? geminiApiKey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Create a detailed trip plan for \\"${escapeStringForJson(title)}\\". ${escapeStringForJson(locationContext)}Plan locations that are accessible from the user's location or popular destinations for this type of trip.\\n\\nIMPORTANT REQUIREMENTS:\\n- **CRITICAL LOCATION CHECK:** The trip location is defined by the \\"${escapeStringForJson(title)}\\". All 'locations', 'addresses', and 'cities' *must* be inside the country or region mentioned in the \\"${escapeStringForJson(title)}\\". For example, if the title is 'Canada Trip', all locations must be in Canada. Do not use *any* locations from other continents or countries.\\n- Date must be FUTURE date (after ${escapeStringForJson(todayDate)})\\n- Calculate realistic distance based on trip locations\\n- Use real, specific location names and addresses\\n- Include proper estimated travel times\\n\\nReturn ONLY a valid JSON object with this exact structure (no extra text, no markdown, just JSON). FOLLOW THE EXAMPLE STRUCTURE AND CONTEXT:\\n\\n{\\n  \\"title\\": \\"Example Canada Trip\\",\\n  \\"date\\": \\"${escapeStringForJson(futureDate)}\\",\\n  \\"duration\\": \\"2 days\\",\\n  \\"totalDistance\\": \\"120 km\\",\\n  \\"difficulty\\": \\"Moderate\\",\\n  \\"locations\\": [\\n    {\\n      \\"id\\": \\"1\\",\\n      \\"name\\": \\"CN Tower\\",\\n      \\"address\\": \\"290 Bremner Blvd, Toronto, ON M5V 3L9, Canada\\",\\n      \\"estimatedTime\\": \\"3 hours\\",\\n      \\"type\\": \\"Tourist Attraction\\"\\n    },\\n    {\\n      \\"id\\": \\"2\\", \\n      \\"name\\": \\"St. Lawrence Market\\", \\n      \\"address\\": \\"93 Front St E, Toronto, ON M5E 1C3, Canada\\",\\n      \\"estimatedTime\\": \\"1.5 hours\\",\\n      \\"type\\": \\"Dining\\"\\n    },\\n    {\\n      \\"id\\": \\"3\\",\\n      \\"name\\": \\"Royal Ontario Museum\\",\\n      \\"address\\": \\"100 Queens Park, Toronto, ON M5S 2C6, Canada\\", \\n      \\"estimatedTime\\": \\"2 hours\\",\\n      \\"type\\": \\"Activity\\"\\n    }\\n  ]\\n}\\n\\nGuidelines:\\n- Date: Must be between ${escapeStringForJson(futureDate)} and ${escapeStringForJson(nextMonthDate)}\\n- Distance: Calculate based on location proximity (30-200km is realistic)\\n- Locations: 3-5 real places with specific addresses\\n- Types: Tourist Attraction, Dining, Shopping, Activity, Cultural, Nature, Accommodation\\n- Make it geographically coherent and realistic"
        }
      ]
    }
  ],
  "generationConfig": {
    "temperature": 0.5,
    "topK": 40,
    "topP": 0.95,
    "maxOutputTokens": 6000
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'geminiGenerateTripPlan',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent?key=${geminiApiKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? trip(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
}

class GetFeedPostsImageCall {
  static Future<ApiCallResponse> call({
    String? apikey = '',
    int? limitVar,
    int? offsetVar,
    String? type = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFeedPostsImage',
      apiUrl:
          'https://deycthvditigtcwtvals.supabase.co/rest/v1/posts_with_meta_images',
      callType: ApiCallType.GET,
      headers: {
        'apikey': '${apikey}',
        'Authorization': 'Bearer ${apikey}',
      },
      params: {
        'select': "*",
        'order': "created_at.desc",
        'groupid': "${type}",
        'limit': limitVar,
        'offset': offsetVar,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? posts(dynamic response) => getJsonField(
        response,
        r'''$''',
        true,
      ) as List?;
}

class GetLocationimageCall {
  static Future<ApiCallResponse> call({
    String? apikey = '',
    String? location = '',
  }) async {
    final ffApiRequestBody = '''
{
  "locationName": "${escapeStringForJson(location)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetLocationimage',
      apiUrl:
          'https://deycthvditigtcwtvals.supabase.co/functions/v1/smooth-processor',
      callType: ApiCallType.POST,
      headers: {
        'apikey': '${apikey}',
        'Authorization': 'Bearer ${apikey}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.image_path''',
      ));
}

class GetFeedPostsImageUserCall {
  static Future<ApiCallResponse> call({
    String? apikey = '',
    int? limitVar,
    int? offsetVar,
    String? targetUserId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetFeedPostsImage user',
      apiUrl:
          'https://deycthvditigtcwtvals.supabase.co/rest/v1/posts_with_meta_images',
      callType: ApiCallType.GET,
      headers: {
        'apikey': '${apikey}',
        'Authorization': 'Bearer ${apikey}',
      },
      params: {
        'select': "*",
        'order': "created_at.desc",
        'limit': limitVar,
        'offset': offsetVar,
        'user_id': "eq.${targetUserId}",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GeministoriesCall {
  static Future<ApiCallResponse> call({
    String? locationName = '6.141312, 6.802949',
    String? geminiApiKey = '',
    int? number,
  }) async {
    final ffApiRequestBody = '''
{
  "contents": [
    {
      "parts": [
        {
          "text": "Generate ${number} interesting historical and cultural stories about this specific landmarks ${locationName}. or locations near it\\n\\nCRITICAL LOCATION RULE: You must provide UNIQUE and DISTINCT coordinates for each story. Do not use the same central latitude/longitude for all items. Each story corresponds to a specific physical spot (e.g., a specific shrine, a distinct river bend, a specific cave entrance, or a market square). If exact GPS is unavailable, estimate the location relative to the main landmark so they appear spread out on a map.\\n\\nFor each story, provide:\\n- title: A captivating title (max 50 characters)\\n- description: A brief 2-3 sentence description\\n- fullNarrative: A detailed narrative (4-5 paragraphs)\\n- readTime: Estimated reading time in minutes (integer)\\n- points: A score between 100-1000 based on interest level\\n- image_url: A valid public image URL representing the story (verify it is a working link)\\n- category: One of \\"Places\\", \\"History\\", \\"Mystery\\", or \\"Culture\\"\\n- location: An object containing the unique coordinates\\n- quiz: An array of exactly 5 multiple choice questions based on the fullNarrative. Each question must have 4 options, a correctAnswer (index 0-3), and a brief explanation.\\n\\nFormat the response as a VALID JSON ARRAY of objects with these exact keys:\\n[\\n  {\\n    \\"title\\": \\"String\\",\\n    \\"description\\": \\"String\\",\\n    \\"fullNarrative\\": \\"String\\",\\n    \\"readTime\\": Integer,\\n    \\"points\\": Integer,\\n    \\"image_url\\": \\"String\\",\\n    \\"category\\": \\"String\\",\\n    \\"location\\": {\\n      \\"lat\\": Double,\\n      \\"lon\\": Double\\n    },\\n    \\"quiz\\": [\\n      {\\n        \\"question\\": \\"String\\",\\n        \\"options\\": [\\"Option A\\", \\"Option B\\", \\"Option C\\", \\"Option D\\"],\\n        \\"correctAnswer\\": Integer,\\n        \\"explanation\\": \\"String\\"\\n      }\\n    ]\\n  }\\n]"
        }
      ]
    }
  ],
  "generationConfig": {
    "response_mime_type": "application/json"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'geministories',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent?key=${geminiApiKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
}

class GeminichatCall {
  static Future<ApiCallResponse> call({
    String? text = '6.141312, 6.802949',
    String? geminiApiKey = '',
    String? location = '',
  }) async {
    final ffApiRequestBody = '''
{
  "system_instruction": {
    "parts": [
      {
        "text": "Role: You are Tela, the official AI Guide and Community Manager for the Geotela app. Your goal is to help users explore historical stories, cultural landmarks, and folklore (specifically focused on ${location}).\\n\\nPersonality:\\n- Tone: Warm but direct. Friendly like a local friend.\\n- Style: EXTREMELY CONCISE. Keep greetings and help messages to MAXIMUM 2 SENTENCES. Only be detailed when telling a historical story.\\n- Vibe: Proud of ${location} heritage.\\n\\nOperational Rules:\\n1. Billing/Support: If asked about money, bugs, or discounts, say: \\"I can't handle payments or technical issues. Please email support@geotela.com.\\"\\n2. Safety: No hate speech or hallucinated locations.\\n\\nContext:\\n- Users unlock stories by visiting locations.\\n- You help with Social (replies/comments) and Events.\\n\\nExample Interaction (Short & Sweet):\\nUser: \\"Hi\\"\\nTela: \\"use slangs for the${location}! I'm Tela. Ready to explore Onitsha's history or check out some events?\\"\\n\\nUser: \\"How do I reply?\\"\\nTela: \\"Just tap the 'Reply' button under any comment to start a conversation.\\""
      }
    ]
  },
  "contents": [
    {
      "parts": [
        {
          "text": "${text}"
        }
      ]
    }
  ],
  "generationConfig": {
    "temperature": 0.5,
    "maxOutputTokens": 150
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'geminichat',
      apiUrl:
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-lite:generateContent?key=${geminiApiKey}',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? response(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.candidates[:].content.parts[:].text''',
      ));
}

class LocationCall {
  static Future<ApiCallResponse> call({
    String? lanlang = '6.1454,6.7884',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'location',
      apiUrl:
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=${lanlang}&key=${key}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? adress(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? longname(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].address_components[:].long_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? code(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.plus_code.compound_code''',
      ));
  static String? error(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error_message''',
      ));
}

class OpenstreamCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'openstream',
      apiUrl:
          'https://nominatim.openstreetmap.org/reverse?format=json&lat=6.1454&lon=6.7884&zoom=10',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
