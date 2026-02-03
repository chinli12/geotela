import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String? greet() {
  // write a function that return good morning if the current time is mornin etc
  final hour = DateTime.now().hour;
  if (hour >= 5 && hour < 12) {
    return 'Good morning';
  } else if (hour >= 12 && hour < 17) {
    return 'Good afternoon';
  } else if (hour >= 17 && hour < 21) {
    return 'Good evening';
  } else {
    return 'Good night';
  }
}

String? calculatedistance(
  LatLng userloaction,
  LatLng storylocation,
) {
  // Helper function defined inside to ensure scope is correct
  double _degreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

  const double earthRadius = 6371; // Radius of the Earth in kilometers

  double dLat =
      _degreesToRadians(storylocation.latitude - userloaction.latitude);
  double dLon =
      _degreesToRadians(storylocation.longitude - userloaction.longitude);

  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(_degreesToRadians(userloaction.latitude)) *
          math.cos(_degreesToRadians(storylocation.latitude)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);

  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  double distanceInKm = earthRadius * c;

  // LOGIC: Check if less than 1 km
  if (distanceInKm < 1) {
    // Convert to Meters (multiply by 1000)
    double distanceInMeters = distanceInKm * 1000;
    // Return rounded meters (e.g., "500 m")
    return '${distanceInMeters.round()} m';
  } else {
    // Return kilometers with 1 decimal place (e.g., "2.5 km")
    return '${distanceInKm.toStringAsFixed(1)} km';
  }
}

List<GroupsWithMemberCountRow> searchMyListGruop(
  List<GroupsWithMemberCountRow> originalList,
  String? searchText,
) {
  if (searchText == null || searchText.isEmpty) {
    return originalList;
  }
  return originalList.where((item) {
    return item.name!.toLowerCase().contains(searchText.toLowerCase());
  }).toList();
}

String percedntage(
  int completed,
  int total,
) {
// Check for division by zero
  if (total == 0) {
    return '0%';
  }

  // Calculate the percentage
  double percentage = (completed / total) * 100;

  // Return as a formatted string (e.g., "40%")
  return '${percentage.toInt()}%';
}

double percedntagprogress(
  int completed,
  int total,
) {
  if (total == 0) {
    return 0.0;
  }

  // Calculate the ratio (e.g., 2 / 5 = 0.4)
  double percentage = completed / total;

  return percentage;
}

DateTime? new7days() {
  final today = DateTime.now();

// Calculate next week (7 days from today)
  final nextWeek = today.add(const Duration(days: 7));

  return nextWeek;
}

DateTime? new30days() {
  final today = DateTime.now();

// Calculate next month (30 days from today)
  final nextMonth = today.add(const Duration(days: 30));

  return nextMonth;
}

LatLng? getlatlong(
  double? lat,
  double? long,
) {
  // modify this code to return latlng object
  if (lat != null && long != null) {
    return LatLng(lat, long);
  }
  return null;
}

List<LatLng> getlatlonglist(List<dynamic> stories) {
  return stories.map((e) {
    // 1. Safety Check: Ensure item is a Map
    if (e is! Map) {
      return LatLng(0.0, 0.0);
    }

    dynamic latVal;
    dynamic lngVal;

    // -----------------------------------------------------
    // PRIORITY 1: Check Root Level (If you used parseStories)
    // -----------------------------------------------------
    // Looks for $.latitude and $.longitude
    latVal = e['latitude'];
    lngVal = e['longitude'] ?? e['longtitude']; // Handle typo just in case

    // -----------------------------------------------------
    // PRIORITY 2: Check Nested Map (Raw JSON from AI)
    // -----------------------------------------------------
    // Looks for $.location.lat and $.location.lon
    if (latVal == null || lngVal == null) {
      final loc = e['location'];
      if (loc is Map) {
        latVal = loc['lat'] ?? loc['latitude'];
        lngVal = loc['lon'] ?? loc['long'] ?? loc['longitude'];
      }
    }

    // -----------------------------------------------------
    // CONVERT TO DOUBLE & RETURN
    // -----------------------------------------------------
    double lat = (latVal as num?)?.toDouble() ?? 0.0;
    double lng = (lngVal as num?)?.toDouble() ?? 0.0;

    return LatLng(lat, lng);
  }).toList();
}

double getlat(LatLng latlong) {
  // write a function that get  return latitude
  return latlong.latitude;
}

double getlong(LatLng latlong) {
  // write a function that retun longitude
  return latlong.longitude; // Return the longitude from the LatLng object
}

String removecharater(String string) {
  String content = string;

  // 1. Remove the </think> tag and everything before it
  if (content.contains('</think>')) {
    content = content.split('</think>').last;
  }

  // 2. Remove literal "\n" string characters if they exist
  // (Common in some raw API responses)
  content = content.replaceAll(r'\n', '\n');

  // 3. trim() removes the actual whitespace/newlines (\n\n) from the start and end
  return content.trim();
}

String formatTimestamp(String? ts) {
  if (ts == null || ts.isEmpty) {
    return "";
  }
  try {
    DateTime date = DateTime.parse(ts);
    final now = DateTime.now();
    final difference = now.difference(date);

    // Logic for short format
    if (difference.inDays > 7) {
      // If older than a week, show date: "Nov 21"
      return DateFormat('MMM d').format(date);
    } else if (difference.inDays >= 1) {
      // If older than a day: "2d", "5d"
      return '${difference.inDays}d ago';
    } else if (difference.inHours >= 1) {
      // If older than an hour: "5h", "12h"
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes >= 1) {
      // If older than a minute: "5m", "30m"
      return '${difference.inMinutes}m ago';
    } else {
      // Just now
      return 'Just now';
    }
  } catch (e) {
    return "";
  }
}

List<HistoryStoriesStruct> searchMyList(
  List<HistoryStoriesStruct> originalList,
  String? searchText,
) {
  if (searchText == null || searchText.isEmpty) {
    return originalList;
  }
  return originalList.where((item) {
    return item.title.toLowerCase().contains(searchText.toLowerCase());
  }).toList();
}

List<EventsRow> searchMyListevent(
  List<EventsRow> originalList,
  String? searchText,
) {
  if (searchText == null || searchText.isEmpty) {
    return originalList;
  }
  return originalList.where((item) {
    return item.name.toLowerCase().contains(searchText.toLowerCase());
  }).toList();
}

String trim(String text) {
  // write a function that remove any spedcial character and whit space from a text inpute, check if after removing it and is empty return empty string
// Remove special characters and whitespace
  String cleanedText = text.replaceAll(RegExp(r'[^a-zA-Z0-9 ]'), '');
  // Return empty string if cleaned text is empty
  return cleanedText.trim().isEmpty ? '' : cleanedText.trim();
}

bool isSameDay(
  DateTime? date1,
  DateTime? date2,
) {
// 1. Handle null safety (return false if either date is missing)
  if (date1 == null || date2 == null) {
    return false;
  }

  // 2. Compare Year, Month, and Day
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

bool shouldRefetchStories(
  LatLng? currentLoc,
  LatLng? lastLoc,
  double thresholdMeters,
) {
// 1. If we don't know where the user is currently, don't fetch.
  if (currentLoc == null) {
    return false;
  }

  // 2. If we haven't fetched before (lastLoc is null), definitely fetch.
  if (lastLoc == null) {
    return true;
  }

  // 3. Calculate Distance using Haversine Formula
  const p = 0.017453292519943295; // Math.PI / 180
  final a = 0.5 -
      math.cos((lastLoc.latitude - currentLoc.latitude) * p) / 2 +
      math.cos(currentLoc.latitude * p) *
          math.cos(lastLoc.latitude * p) *
          (1 - math.cos((lastLoc.longitude - currentLoc.longitude) * p)) /
          2;

  double distanceInKm = 12742 * math.asin(math.sqrt(a));
  double distanceInMeters = distanceInKm * 1000;

  // 4. Return true only if we have moved MORE than the threshold
  return distanceInMeters > thresholdMeters;
}

String time() {
  final now = DateTime.now();

// Convert to String for SQLite
  return now.toIso8601String();
}

String returnimage(String img) {
  return img;
}

List<dynamic>? retunjson(String? inputString) {
  if (inputString == null || inputString.isEmpty) {
    return [];
  }

  try {
    String cleanString = inputString;
    cleanString =
        cleanString.replaceAll('```json', '').replaceAll('```', '').trim();

    final dynamic decoded = jsonDecode(cleanString);

    if (decoded is List) {
      for (var item in decoded) {
        if (item is Map<String, dynamic>) {
          // ---------------------------------------------------
          // FIX: Handle Nested Location Object
          // ---------------------------------------------------
          // The AI returns: "location": { "lat": 6.1, "lon": 6.9 }

          if (item['location'] is Map) {
            final locMap = item['location'];

            // Flatten the structure for SQLite or easier usage
            // Add 'latitude' and 'longitude' keys to the top level of the item
            item['latitude'] = (locMap['lat'] as num?)?.toDouble() ?? 0.0;
            item['longitude'] = (locMap['lon'] as num?)?.toDouble() ?? 0.0;
          } else {
            // Fallback if location is missing
            item['latitude'] = 0.0;
            item['longitude'] = 0.0;
          }
        }
      }
      return decoded;
    }
    return [];
  } catch (e) {
    print('Error parsing stories: $e');
    return [];
  }
}

List<dynamic>? retunjsonpost(String? inputString) {
  if (inputString == null || inputString.isEmpty) {
    return [];
  }

  try {
    String cleanString = inputString;

    // 1. Remove Markdown formatting (if AI added it)
    cleanString =
        cleanString.replaceAll('```json', '').replaceAll('```', '').trim();

    // 2. Find the start "[" and end "]" of the array
    // This is crucial because sometimes there is text before or after the JSON
    int startIndex = cleanString.indexOf('[');
    int endIndex = cleanString.lastIndexOf(']');

    if (startIndex == -1 || endIndex == -1) {
      return [];
    }

    // Extract just the JSON array part
    cleanString = cleanString.substring(startIndex, endIndex + 1);

    // 3. Decode the string into a List
    final dynamic decoded = jsonDecode(cleanString);

    if (decoded is List) {
      return decoded;
    } else {
      return [];
    }
  } catch (e) {
    print('Error parsing stories: $e');
    return [];
  }
}

String caculatetimefortodistance(
  LatLng pointA,
  LatLng pointB,
) {
  // modify the code if is not upto hours return only minuts if not minutes return second,  for example 2mins
// Calculate the distance between two points in kilometers
  const double earthRadius = 6371.0; // Earth radius in kilometers
  double dLat = (pointB.latitude - pointA.latitude) * (math.pi / 180);
  double dLon = (pointB.longitude - pointA.longitude) * (math.pi / 180);

  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(pointA.latitude * (math.pi / 180)) *
          math.cos(pointB.latitude * (math.pi / 180)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);

  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  double distance = earthRadius * c; // Distance in kilometers

  // Assuming an average speed of 60 km/h
  double timeInHours = distance / 60;

  if (timeInHours < 1) {
    // Convert to minutes
    int minutes = (timeInHours * 60).round();
    return '$minutes mins';
  } else {
    // Convert to hours
    int hours = timeInHours.floor();
    return '$hours hours';
  }
}

LatLng getrandomlocation(LatLng userlocation) {
  final math.Random random = math.Random();

  // Generate random distance within 1km (0.01 degrees ≈ 1.1km)
  final double maxDistance = 0.01;
  final double distance = random.nextDouble() * maxDistance;

  // Generate random angle in radians
  final double angle = random.nextDouble() * 2 * math.pi;

  // Calculate new coordinates
  final double deltaLat = distance * math.cos(angle);
  final double deltaLng = distance * math.sin(angle);

  // Adjust longitude for latitude (longitude lines get closer near poles)
  final double adjustedDeltaLng =
      deltaLng / math.cos(userlocation.latitude * math.pi / 180);

  final double newLatitude = userlocation.latitude + deltaLat;
  final double newLongitude = userlocation.longitude + adjustedDeltaLng;

  return LatLng(newLatitude, newLongitude);
}

List<dynamic> searchJsonList(
  List<dynamic>? dataList,
  String? searchTerm,
) {
// 1. Safety Checks
  // If the list is empty, return empty list
  if (dataList == null || dataList.isEmpty) {
    return [];
  }
  // If search term is empty, return the full original list
  if (searchTerm == null || searchTerm.isEmpty) {
    return dataList;
  }

  // 2. Prepare Search Term (LowerCase for case-insensitive matching)
  final term = searchTerm.toLowerCase().trim();

  // 3. Filter Logic
  return dataList.where((item) {
    // Ensure item is a Map before trying to read fields
    if (item is! Map<String, dynamic>) {
      return false;
    }

    // Get fields to search (Add more fields here if needed)
    // We use .toString() to be safe, and .toLowerCase() for matching
    final title = item['title']?.toString().toLowerCase() ?? '';
    final description = item['description']?.toString().toLowerCase() ?? '';

    // Note: Using 'catigory' based on your previous data spelling.
    // Change to 'category' if you fixed the spelling.
    final category =
        (item['catigory'] ?? item['category'])?.toString().toLowerCase() ?? '';

    // Check if any field contains the search term
    return title.contains(term) ||
        description.contains(term) ||
        category.contains(term);
  }).toList();
}

dynamic getStoryFromLatLng(
  List<dynamic> storiesList,
  LatLng? tappedLocation,
) {
  if (tappedLocation == null || storiesList.isEmpty) {
    return {};
  }

  for (var item in storiesList) {
    if (item is Map<String, dynamic>) {
      double? lat;
      double? lng;

      // ---------------------------------------------------
      // 1. EXTRACT COORDINATES (Handles Nested "location" object)
      // ---------------------------------------------------
      final loc = item['location'];

      if (loc is Map) {
        // Use 'lat' and 'lon' as per your latest JSON
        lat = (loc['lat'] as num?)?.toDouble();
        lng = (loc['lon'] as num?)?.toDouble();
      }
      // Fallback: Check if you flattened it earlier to 'latitude'
      else if (item['latitude'] != null) {
        lat = (item['latitude'] as num?)?.toDouble();
        lng = (item['longitude'] as num?)?.toDouble();
      }

      // ---------------------------------------------------
      // 2. CHECK MATCH (Hit Box Logic)
      // ---------------------------------------------------
      if (lat != null && lng != null) {
        // We use 0.0005 tolerance (~50 meters) to detect the tap easily
        if ((lat - tappedLocation.latitude).abs() < 0.0005 &&
            (lng - tappedLocation.longitude).abs() < 0.0005) {
          return item;
        }
      }
    }
  }

  return {};
}

double stringtodouble(String string) {
  // write a function that convert string to double
  return double.tryParse(string) ??
      0.0; // Convert string to double, return 0.0 if parsing fails
}

List<dynamic> toggleLikeLocally(
  List<dynamic> feedList,
  String postId,
  String userId,
) {
  return feedList.map((item) {
    // 1. Find the target post by ID
    if (item['id'] == postId) {
      // Create a mutable copy of the item so we can modify it
      Map<String, dynamic> updatedItem = Map.from(item);

      // 2. Safely extract the List<String>
      // We use List<String>.from() to ensure Dart knows these are Strings.
      List<String> likedUsers = [];

      if (updatedItem['liked_user_ids'] != null) {
        // Handle if it's already a List
        if (updatedItem['liked_user_ids'] is List) {
          likedUsers = List<String>.from(updatedItem['liked_user_ids']);
        }
        // Handle if it accidentally came as a String (e.g. "['user1', 'user2']")
        else if (updatedItem['liked_user_ids'] is String) {
          try {
            likedUsers =
                List<String>.from(jsonDecode(updatedItem['liked_user_ids']));
          } catch (_) {}
        }
      }

      // 3. Toggle Logic (Like / Unlike)
      if (likedUsers.contains(userId)) {
        // UNLIKE: Remove user
        likedUsers.remove(userId);

        // Decrease count (Safety check to not go below 0)
        int currentCount = updatedItem['like_count'] ?? 1;
        updatedItem['like_count'] = currentCount > 0 ? currentCount - 1 : 0;
      } else {
        // LIKE: Add user
        likedUsers.add(userId);

        // Increase count
        int currentCount = updatedItem['like_count'] ?? 0;
        updatedItem['like_count'] = currentCount + 1;
      }

      // 4. Save back to item
      updatedItem['liked_user_ids'] = likedUsers;

      return updatedItem;
    }

    // Return other posts unchanged
    return item;
  }).toList();
}

List<HistoryStoriesStruct> parsestoriesJsonRow(List<dynamic>? jsonList) {
// 1. Safety Checks
  if (jsonList == null || jsonList.isEmpty) {
    return [];
  }

  try {
    // 2. Map to Struct
    return jsonList.map<HistoryStoriesStruct>((item) {
      if (item is Map<String, dynamic>) {
        // --- LOCATION EXTRACTION LOGIC ---
        double lat = (item['latitude'] as num?)?.toDouble() ?? 0.0;
        double lng = (item['longitude'] as num?)?.toDouble() ?? 0.0;

        if (lat == 0.0 && lng == 0.0 && item['location'] is Map) {
          final locMap = item['location'];
          lat = (locMap['lat'] as num?)?.toDouble() ?? 0.0;
          lng = (locMap['lon'] as num?)?.toDouble() ?? 0.0;
        }

        return HistoryStoriesStruct(
          title: item['title'] as String? ?? '',
          description: item['description'] as String? ?? '',
          fullNarrative: item['fullNarrative'] as String? ?? '',
          readTime: item['readTime'].toString(),
          points: item['points'] is int
              ? item['points']
              : int.tryParse(item['points'].toString()) ?? 0,
          catigory: [
            item['category'] as String? ??
                item['catigory'] as String? ??
                'General'
          ],
          imageUrl: item['image_url'] as String? ?? '',
          latitude: lat,
          longitude: lng,
        );
      }
      return HistoryStoriesStruct();
    }).toList();
  } catch (e) {
    print('Error mapping stories JSON: $e');
    return [];
  }
}

List<HistoryStoriesStruct>? parsestoriesJsonfun(
  LatLng userlocation,
  String? jsonString,
) {
  // 1. Safety Checks
  if (jsonString == null || jsonString.isEmpty) {
    return [];
  }
  LatLng safeLocation = userlocation ?? LatLng(0, 0);

  // --- HELPER: Random Location Generator ---
  LatLng generateRandomLocation(LatLng center) {
    final math.Random random = math.Random();
    final double maxDistance = 0.01;
    final double distance = random.nextDouble() * maxDistance;
    final double angle = random.nextDouble() * 2 * math.pi;
    final double deltaLat = distance * math.cos(angle);
    final double deltaLng = distance * math.sin(angle);
    final double adjustedDeltaLng =
        deltaLng / math.cos(center.latitude * math.pi / 180);
    return LatLng(
        center.latitude + deltaLat, center.longitude + adjustedDeltaLng);
  }

  // --- HELPER: Smart JSON Extractor ---
  // This extracts the array [ ... ] by counting brackets, ignoring trailing garbage.
  String? extractArray(String input) {
    int startIndex = input.indexOf('[');
    if (startIndex == -1) return null;

    int level = 0;
    for (int i = startIndex; i < input.length; i++) {
      if (input[i] == '[')
        level++;
      else if (input[i] == ']') level--;

      // When level returns to 0, we found the matching closing bracket
      if (level == 0) {
        return input.substring(startIndex, i + 1);
      }
    }
    return null;
  }

  try {
    String cleanString = jsonString;

    // 2. Handle API Wrapper (If you passed the full API response object)
    // We try to decode it as a map first to see if it's the wrapper
    try {
      if (cleanString.trim().startsWith('{')) {
        final dynamic outerJson = jsonDecode(cleanString);
        if (outerJson is Map<String, dynamic> &&
            outerJson.containsKey('candidates')) {
          final candidates = outerJson['candidates'] as List;
          if (candidates.isNotEmpty) {
            final parts = candidates[0]['content']['parts'] as List;
            if (parts.isNotEmpty) {
              cleanString = parts[0]['text'];
            }
          }
        }
      }
    } catch (_) {
      // Not a valid JSON object or not the wrapper, proceed with original string
    }

    // 3. Remove Markdown
    cleanString =
        cleanString.replaceAll('```json', '').replaceAll('```', '').trim();

    // 4. Use Smart Extraction to handle garbage like " } ]" at the end
    String? extractedArray = extractArray(cleanString);
    if (extractedArray != null) {
      cleanString = extractedArray;
    }

    // 5. Decode
    // Handle the escaped quotes issue (if input was literally "[\n \"title\"...")
    // Standard jsonDecode handles strict JSON.
    // If the input was a raw string literal with backslashes, we might need to unescape,
    // but usually jsonDecode works fine if the string is valid.
    final decoded = jsonDecode(cleanString);

    // 6. Map to Struct
    if (decoded is List) {
      return decoded.map<HistoryStoriesStruct>((item) {
        if (item is Map<String, dynamic>) {
          final LatLng newLoc = generateRandomLocation(safeLocation);

          return HistoryStoriesStruct(
            title: item['title'] as String? ?? '',
            description: item['description'] as String? ?? '',
            fullNarrative: item['fullNarrative'] as String? ?? '',

            // FIX: Ensure readTime is a String (API returns int 3)
            readTime: item['readTime'].toString(),

            // FIX: Handle Points safely (int or string)
            points: item['points'] is int
                ? item['points']
                : int.tryParse(item['points'].toString()) ?? 0,

            catigory: [
              item['catigory'] as String? ??
                  item['category'] as String? ??
                  'General'
            ],

            // FIX: Map the image
            imageUrl: item['image_url'] as String? ?? '',

            latitude: newLoc.latitude,
            longitude: newLoc.longitude,
          );
        }
        return HistoryStoriesStruct();
      }).toList();
    }
  } catch (e) {
    print('Error parsing stories JSON: $e');
  }

  return [];
}

String truncateText(
  String? text,
  int length,
) {
  if (text == null) return '';
  if (text.length <= length) return text;
  return text.substring(0, length) + '...';
}

bool checkAnswer(
  int selectedOptionIndex,
  int correctOptionIndex,
) {
  return selectedOptionIndex == correctOptionIndex;
}

String? convertlatstring(LatLng? lat) {
  // write a function that convert lat and log to string, like 6.7884,6.1454
  if (lat == null) return null;
  return '${lat.latitude},${lat.longitude}';
}

String cleanAddress(String? fullAddress) {
  // 1. Safety Check: If address is empty, return empty
  if (fullAddress == null || fullAddress.isEmpty) {
    return '';
  }

  // 2. Split the string into a list of words
  List<String> parts = fullAddress.split(' ');

  // 3. Check if the first word contains a "+" (Characteristic of Plus Codes)
  // Example: parts[0] is "VXHP+645"
  if (parts.isNotEmpty && parts[0].contains('+')) {
    // Remove the first part
    parts.removeAt(0);
    // Join the rest back together with spaces
    return parts.join(' ');
  }

  // 4. If no plus code found, return original
  return fullAddress;
}

List<dynamic> toggleLikeState(
  List<dynamic> currentList,
  String postId,
  String currentUserId,
) {
  // 1. Create a DEEP COPY of the list to ensure Flutter detects the change
  // (Standard "toList()" is sometimes shallow)
  List<dynamic> newList =
      List.from(currentList.map((item) => Map<String, dynamic>.from(item)));

  // 2. Find the index of the post
  int index = newList.indexWhere((item) => item['id'].toString() == postId);

  if (index != -1) {
    var post = newList[index];
    List<dynamic> likedUserIds = [];

    // Safety check for existing list
    if (post['liked_user_ids'] != null) {
      if (post['liked_user_ids'] is List) {
        likedUserIds = List.from(post['liked_user_ids']);
      } else if (post['liked_user_ids'] is String) {
        // Handle case where API returns stringified JSON
        try {
          likedUserIds = List.from(jsonDecode(post['liked_user_ids']));
        } catch (_) {}
      }
    }

    // 3. Toggle Logic
    if (likedUserIds.contains(currentUserId)) {
      // UNLIKE: Remove ID, Decrease Count
      likedUserIds.remove(currentUserId);
      int currentCount = int.tryParse(post['like_count'].toString()) ?? 1;
      post['like_count'] = (currentCount > 0) ? currentCount - 1 : 0;
    } else {
      // LIKE: Add ID, Increase Count
      likedUserIds.add(currentUserId);
      int currentCount = int.tryParse(post['like_count'].toString()) ?? 0;
      post['like_count'] = currentCount + 1;
    }

    // Save changes back to the post
    post['liked_user_ids'] = likedUserIds;
    newList[index] = post;
  }

  // 4. Return the updated list
  return newList;
}

List<dynamic> getUserPostsFromState(
  List<dynamic>? currentList,
  String targetUserId,
) {
  ///Safety Check
  if (currentList == null || currentList.isEmpty) {
    return [];
  }

  // 2. Filter the list
  // We look for items where 'user_id' matches the 'targetUserId'
  List<dynamic> userPosts = currentList.where((item) {
    // Ensure item is a map and has a user_id field
    if (item is Map<String, dynamic> && item['user_id'] != null) {
      return item['user_id'].toString() == targetUserId;
    }
    return false;
  }).toList();

  // 3. Sort by Date (Newest first) - Optional but recommended
  userPosts.sort((a, b) {
    String dateA = a['created_at'] ?? '';
    String dateB = b['created_at'] ?? '';
    return dateB.compareTo(dateA);
  });

  return userPosts;
}

dynamic findPostInJsonCache(
  List<dynamic> cachedPosts,
  String searchId,
) {
  for (var post in cachedPosts) {
    // Check if the 'id' key matches the searchId
    // We use .toString() to ensure safety (in case id is stored as something else)
    if (post['id'].toString() == searchId) {
      return post;
    }
  }

  // If we finish the loop and find nothing, return null
  return null;
}
