# Geotela Technical Documentation

## 1. Project Overview

**Geotela** is a comprehensive Flutter mobile application for location-based activities, social engagement, and gamification. The app combines real-world exploration with digital interaction through hunts, stories, challenges, groups, messaging, and competitive leaderboards.

**Tech Stack:**
- Frontend: Flutter + FlutterFlow (code-generated & custom Dart)
- Backend: Supabase (PostgreSQL, real-time, auth, storage)
- Messaging: Firebase Cloud Messaging (FCM) for push notifications
- Additional: Google Maps API, SharedPreferences for local caching

---

## 2. Architecture Overview

### 2.1 High-level Architecture
```
┌─────────────────────────────────────────────────────────┐
│              Flutter App (UI Layer)                     │
│  Screens, Widgets, Components (FlutterFlow-generated)   │
└──────────────────┬──────────────────────────────────────┘
                   │
┌──────────────────▼──────────────────────────────────────┐
│         State Management (Provider, FFAppState)         │
│  - FFAppState (singleton ChangeNotifier)                │
│  - SharedPreferences (local persistence)                │
│  - FlutterFlow Models (per-screen state)                │
└──────────────────┬──────────────────────────────────────┘
                   │
┌──────────────────▼──────────────────────────────────────┐
│         Backend Service Layer (lib/backend/)            │
│  - Supabase Client (auth, database, storage, streams)   │
│  - Firebase (notifications, config)                     │
│  - Custom Actions (JSON parsing, location, media)       │
└──────────────────┬──────────────────────────────────────┘
                   │
┌──────────────────▼──────────────────────────────────────┐
│              External Services                          │
│  - Supabase (PostgreSQL DB + realtime)                  │
│  - Firebase Cloud Messaging                             │
│  - Google Maps API                                      │
└─────────────────────────────────────────────────────────┘
```

### 2.2 Folder Structure
```
lib/
├── main.dart                    # App entry, initialization
├── app_state.dart               # FFAppState singleton (global state)
├── index.dart                   # Central exports
├── auth/                         # Supabase authentication
│   ├── base_auth_user_provider.dart
│   └── supabase_auth/
│       ├── auth_util.dart       # Auth helpers
│       ├── supabase_user_provider.dart
│       └── auth_manager.dart
├── authentication/              # Auth screens
│   ├── login_authentication_screen/
│   ├── create_authentication_screen/
│   ├── forgot_authentication_screen/
│   ├── changepass_authentication_screen/
│   ├── passwordsucess/
│   ├── onboarding/
│   ├── splas/ (splash)
│   ├── welcome_home/
│   ├── welcome_screen_with_character/
│   ├── language_selection_screen/
│   ├── interest_selection_interface/
│   └── location_permission_request_screen/
├── home/                        # Home & feed features
│   ├── homescreen/              # Main dashboard with map & feed
│   ├── story_map/               # Map view for stories
│   ├── story_detail_view/       # Story detail screen
│   ├── story_detail_view_focuse/# Focused story detail
│   ├── botchat/                 # AI bot chat
│   ├── quizzpoint/              # Quiz interface
│   ├── quiz_question_interface/ # Quiz question display
│   ├── savestory/               # Save story workflow
│   ├── search/                  # Search functionality
│   ├── places_to_explore_list/  # Explore POIs
│   └── notification_list_view/  # Notifications
├── explor/                      # Hunt & trip exploration
│   ├── hunt/                    # Hunt browse/list
│   ├── hunt_detail_view/        # Hunt details
│   ├── huntcard/                # Hunt card component
│   ├── explore_activity_list/   # Activity list
│   ├── trip/                    # Trip browse
│   ├── tripcreation/            # Create trip
│   └── tripdetails/             # Trip details
├── community/                   # Social features
│   ├── group/                   # Group management
│   ├── event/                   # Event management
│   ├── reels/                   # Video reels
│   └── stories/                 # Community stories
├── profile/                     # User profile & settings
│   ├── profiles/                # User profile view
│   ├── profilesuser/            # Other user profiles
│   ├── editprofile/             # Edit profile
│   ├── chat/                    # Direct messaging
│   ├── chllenges/               # Challenges view
│   ├── streak/                  # Streak tracking
│   ├── leaderbord/              # Leaderboard
│   └── setting/                 # Settings screen
├── post_details/                # Post detail screen
├── stories/                     # Stories-related features
│   ├── story_detail_view_focusestories/
│   ├── story_detail_viewstories/
│   └── stories/
├── backend/                     # Backend integrations
│   ├── supabase/
│   │   ├── supabase.dart        # Supabase client & initialization
│   │   ├── database/
│   │   │   ├── database.dart    # Table exports (80+ tables)
│   │   │   ├── table.dart       # SupabaseTable base class
│   │   │   ├── row.dart         # SupabaseDataRow base class
│   │   │   └── tables/          # Auto-generated table classes
│   │   └── storage/
│   │       └── storage.dart     # Storage operations
│   ├── schema/
│   │   ├── structs/             # Data models
│   │   │   ├── hunt_struct.dart
│   │   │   ├── trip_struct.dart
│   │   │   ├── posts_struct.dart
│   │   │   ├── video_post_struct.dart
│   │   │   ├── question_struct.dart
│   │   │   └── ... (11+ more)
│   │   ├── enums/               # Enums
│   │   └── util/                # Schema utilities
│   ├── firebase/
│   │   └── firebase_config.dart # Firebase setup
│   └── api_requests/            # Custom API calls
├── flutter_flow/                # FlutterFlow utilities
│   ├── flutter_flow_theme.dart  # Theme (colors, typography)
│   ├── flutter_flow_util.dart   # Utility functions
│   ├── internationalization.dart# i18n (English, Spanish, French)
│   ├── nav/
│   │   ├── nav.dart             # Route registry
│   │   └── serialization_util.dart
│   └── custom_icons.dart        # Icon definitions
├── custom_code/                 # Custom Dart actions & widgets
│   ├── actions/                 # Custom business logic
│   │   ├── parsehunt_json.dart
│   │   ├── parsetrip_json.dart
│   │   ├── parse_questions_json.dart
│   │   ├── check_location_status.dart
│   │   ├── set_f_c_m_token.dart
│   │   ├── upload_file_from_pathimage.dart
│   │   ├── upload_file_from_pathvideo.dart
│   │   └── ... (more)
│   └── widgets/                 # Custom UI widgets
├── components/                  # Reusable UI components
│   ├── *_model.dart
│   └── *_widget.dart
├── component/                   # Additional components
│   ├── nav/                     # Navigation widget
│   ├── button/
│   ├── btn/
│   └── ...
└── test/                        # Widget tests
```

---

## 3. Initialization & Startup Flow

### 3.1 App Startup (`main.dart`)

1. **Flutter Setup:**
   - Initialize Flutter bindings
   - Configure URL strategy for web

2. **Backend Initialization:**
   - Call `initFirebase()` → Sets up Firebase services (FCM, config)
   - Call `SupaFlow.initialize()` → Initializes Supabase client

3. **Localization & State:**
   - `FFLocalizations.initialize()` → Loads i18n resources (en, es, fr)
   - Create `FFAppState()` singleton
   - Call `appState.initializePersistedState()` → Restores persisted prefs from SharedPreferences

4. **Startup Actions:**
   - `checkLocationStatus()` → Verify/request location permissions
   - `setFCMToken()` → Register device for push notifications

5. **App Injection & Launch:**
   - Wrap app with `ChangeNotifierProvider(create: (_) => appState)`
   - Initialize `AppStateNotifier` and `GoRouter` with navigation routes
   - Listen to `geotelaSupabaseUserStream()` to track auth state
   - Display splash screen (hidden after 1 second)

---

## 4. State Management

### 4.1 FFAppState (Global State)

Located in `lib/app_state.dart`, a singleton `ChangeNotifier` managing:

**Persisted Fields (saved to SharedPreferences):**
- `location` (String) – User's location name
- `username` (String) – Current user's name
- `language` (String) – Selected language code
- `theme` (String) – 'light' or 'dark' theme
- `selectedlaguead` (LanguageStruct) – Selected language object
- `Apikey` (String) – Google API key
- `supabasekey` (String) – Supabase JWT token
- `firstvisite` (bool) – Whether first visit complete
- `ispaswordchange` (bool) – Password change flag
- `lastsync` (LatLng) – Last sync location
- `dummylatlong` (LatLng) – Demo location
- `locationimage` (String) – Location image URL
- `Newstories` (List<Map>) – Cached story data
- `cachepost` (List<Map>) – Cached post data

**Runtime Fields (session-only):**
- `isLocationOn` (bool) – Location service active
- `hasLocationPermission` (bool) – Permission granted
- `newLocation` (bool) – New location detected
- `isDataReady` (bool) – Data loading status
- `intrest` (List<IntrestStruct>) – User interests
- `languages` (List<LanguageStruct>) – Available languages
- `grouppermision` (List<String>) – Group permissions
- `groupmember` (List<String>) – Group members
- `homestoris` (List<HistoryStoriesStruct>) – Story history
- `Latlist` (List<LatLng>) – Location list
- `activeVideoPost` (VideoPostStruct) – Current video post

**Methods:**
- `update(callback)` → Notify listeners after state change
- `initializePersistedState()` → Load persisted values on startup
- Collection helpers: `addTo*()`, `removeFrom*()`, `updateAt*()` for list fields

### 4.2 FlutterFlow Models (Screen-level State)

Each screen has a corresponding model extending `FlutterFlowModel<WidgetName>`:
- Manages screen-specific state (form inputs, lists, animations)
- Often contains Supabase stream subscriptions (e.g., `Stream<List<...Row>>?`)
- Initialized via `createModel(context, () => ScreenModel())`

Example (Homescreen):
```dart
class HomescreenModel extends FlutterFlowModel<HomescreenWidget> {
  Stream<List<StoryRequestsRow>>? containerSupabaseStream;
  // ... other fields
}
```

---

## 5. Backend Integration

### 5.1 Supabase

**Supabase Client Initialization** (`lib/backend/supabase/supabase.dart`):
- Auto-generated from Supabase schema
- Provides type-safe table access via `SupaFlow.client`
- Real-time streams for reactive UI

**80+ Database Tables** (auto-generated in `lib/backend/supabase/database/tables/`):

**Core Tables:**
- `profiles` – User profile info (id, username, email, avatar, etc.)
- `posts` – Social posts with media
- `stories` – Story content
- `messages` – Direct messages
- `conversations` – Chat conversations
- `comments` – Post comments
- `likes` – Post/comment likes
- `notifications` – User notifications

**Gamification & Challenges:**
- `daily_challenges` – Daily tasks
- `challenge_pool` – Challenge library
- `quiz` – Quiz questions & metadata
- `quiz_results` – User quiz responses
- `user_challenge_progress` – Challenge tracking

**Social & Groups:**
- `groups` – Group info
- `group_members` – Group membership
- `events` – Group/community events
- `event_attendees` – Event attendance

**Location & Trip Planning:**
- `trip_plans` – Trip metadata (title, date, duration, difficulty)
- `trip_locations` – Waypoints for trips
- `pois` – Points of interest (historical places, landmarks)
- `places_visited` – User visited places
- `saved_places` – Bookmarked locations
- `location_alerts` – Geofence alerts

**User Tracking & Gamification:**
- `activity_logs` – User activity history
- `xp_leaderboard` – XP rankings
- `user_badges` – User achievements
- `badges` – Badge definitions
- `streaks` – User streaks (implied, likely in profiles)

**AI & Chat:**
- `ai_chat` – AI chat config
- `ai_chat_messages` – AI conversation history

**Financial (if applicable):**
- `deposits`, `withdrawals`, `investments`, `transactions` – Payment/wallet data
- `investment_plans` – Investment products
- `kyc_verifications` – KYC verification status

**Admin & Settings:**
- `admin_settings` – Admin configuration
- `site_settings` – Global app settings
- `privacy_settings` – User privacy preferences
- `privacy_zones` – Geographic privacy areas
- `rules` – App rules/ToS

**Views (computed from tables):**
- `all_challenges_view` – All available challenges
- `today_challenges_view` – Today's challenges
- `profiles_with_counts` – Profiles with post/follower counts
- `posts_with_meta` – Posts with engagement metrics
- `group_members_with_profiles` – Group members with full profile data

**Query Pattern:**
```dart
// Query single row
final user = await ProfilesTable().querySingleRow(
  queryFn: (q) => q.eq('id', userId),
);

// Query multiple rows with stream
final postsStream = SupaFlow.client
  .from('posts')
  .stream(primaryKey: ['id'])
  .eq('user_id', userId)
  .order('created_at', ascending: false)
  .map((rows) => rows.map(PostsRow.fromMap).toList());
```

### 5.2 Firebase

**Firebase Services:**
- **Cloud Messaging (FCM):** Push notifications
- **Remote Config:** Dynamic configuration
- **Crashlytics:** Error tracking (optional)

**Initialization:**
- Called in `main.dart` via `initFirebase()`
- Config file: `lib/backend/firebase/firebase_config.dart`
- Google services config files:
  - Android: `android/app/google-services.json`
  - iOS: `ios/Runner/GoogleService-Info.plist`

**FCM Token Registration:**
- Custom action `setFCMToken()` registers device token with Supabase
- Enables server-side push notifications

---

## 6. Data Models (Structs)

Located in `lib/backend/schema/structs/`, these are serializable Dart classes:

### 6.1 Core Structs

**HuntStruct** (`hunt_struct.dart`)
```dart
class HuntStruct extends BaseStruct {
  String? title;       // Hunt name
  String? distance;    // Distance to complete
  String? points;      // Points reward
  String? description; // Hunt details
  List<String>? catigory;  // Categories
  List<String>? task;      // Task list
  
  // Serialization
  static HuntStruct fromMap(Map<String, dynamic> data)
  Map<String, dynamic> toMap() => { ... };
  String serialize() => json.encode(toMap());
  static HuntStruct fromSerializableMap(Map<String, dynamic> data)
}
```

**TripStruct** (`trip_struct.dart`)
```dart
class TripStruct extends BaseStruct {
  String? title;
  String? date;
  String? duration;
  String? totalDistance;
  String? difficulty;
  List<TriplocationStruct>? locations;  // Nested waypoints
}
```

**PostsStruct** (`posts_struct.dart`)
```dart
class PostsStruct extends BaseStruct {
  String? id, content, mediaUrl, mediaType, location;
  String? createdAt, userId, title, thumbnails;
  String? username, avatarUrl, groupid;
  int? commentCount, likeCount;
  List<String>? likedUserIds;
}
```

**VideoPostStruct** (`video_post_struct.dart`)
```dart
class VideoPostStruct extends BaseStruct {
  String? id, content, mediaUrl, mediaType, location;
  String? userId, title, thumbnails, username, avatarUrl;
}
```

**QuestionStruct** (`question_struct.dart`)
```dart
class QuestionStruct extends BaseStruct {
  String? question;
  List<String>? answers;
  String? correctAnswer;
  String? explanation;
}
```

**Other Structs:**
- `LanguageStruct` – Language metadata (name, flag URL)
- `IntrestStruct` – User interests
- `HistoryStoriesStruct` – Story history entries
- `CommentsStruct` – Comment data
- `PostimageStruct` – Post image metadata
- `VideoPickResultStruct` – Video picker result
- `TriplocationStruct` – Trip waypoint
- `HistoricalPlacesStruct` – POI data

### 6.2 Serialization Pattern

All structs extend `BaseStruct` and provide:
- `fromMap(data)` – Create from Map
- `toMap()` – Convert to Map
- `serialize()` – JSON string
- `fromSerializableMap(data)` – Reconstruct from serialized data

---

## 7. Routing & Navigation

### 7.1 Route Registry (`lib/flutter_flow/nav/nav.dart`)

FlutterFlow generates a complete route registry with typed parameters:

**Example Routes:**
```dart
GoRoute(
  name: HuntWidget.routeName,       // 'Hunt'
  path: HuntWidget.routePath,       // '/hunt'
  builder: (context, params) => HuntWidget(),
),

GoRoute(
  name: HuntDetailViewWidget.routeName,  // 'huntDetailView'
  path: HuntDetailViewWidget.routePath,  // '/huntDetailView'
  builder: (context, params) => HuntDetailViewWidget(
    hunt: params.getParam(
      'hunt',
      ParamType.DataStruct,
      structBuilder: HuntStruct.fromSerializableMap,
    ),
  ),
),

GoRoute(
  name: ChatWidget.routeName,  // 'Chat'
  path: ChatWidget.routePath,  // '/chat'
  builder: (context, params) => ChatWidget(
    conversation: params.getParam('conversation', ParamType.String),
    username: params.getParam('username', ParamType.String),
    averter: params.getParam('averter', ParamType.String),
  ),
),
```

**Parameter Types:**
- `String`, `int`, `double`, `bool` – Primitives
- `LatLng` – Location
- `DateTime` – Timestamps
- `DataStruct` – Custom serializable structs (with `structBuilder`)
- `SupabaseRow` – Supabase table rows
- `List<String>`, `List<int>` – Collections

### 7.2 Navigation Usage

**From Widget Code:**
```dart
context.pushNamed(
  HuntDetailViewWidget.routeName,
  pathParameters: {
    'hunt': huntStruct.serialize(),  // Pass serialized struct
  },
);

// Or with GoRouter
context.go('/huntDetailView?hunt=${Uri.encodeComponent(huntStruct.serialize())}');
```

---

## 8. Feature Modules

### 8.1 Authentication

**Screens** (`lib/authentication/`):
- `splas/` – Splash screen
- `login_authentication_screen/` – Email/password login
- `create_authentication_screen/` – Sign-up with email, password, interests
- `forgot_authentication_screen/` – Password reset flow
- `changepass_authentication_screen/` – Change password (post-login)
- `passwordsucess/` – Confirmation screen
- `welcome_home/` – Post-login intro
- `welcome_screen_with_character/` – Animated welcome with mascot
- `language_selection_screen/` – Choose app language
- `interest_selection_interface/` – Select interests during onboarding
- `location_permission_request_screen/` – Request location permission
- `onboarding/` – Multi-step onboarding flow

**Backend** (`lib/auth/supabase_auth/`):
- `auth_util.dart` – Auth helpers (login, signup, logout, password reset)
- `auth_manager.dart` – Auth state management
- `supabase_user_provider.dart` – User provider for stream

**Flow:**
1. User sees splash screen
2. Navigate to login or sign-up
3. After auth, request language, interests, location permissions
4. Show welcome screen and navigate to homescreen
5. Store auth state in `AppStateNotifier`

### 8.2 Home & Explore

**Homescreen** (`lib/home/homescreen/`)
- Dashboard with:
  - Google Map widget showing user location
  - Feed of stories from other users (real-time stream)
  - Quick access to hunts, trips, quizzes
  - Navigation tabs (home, explore, profile, etc.)
- Integrates: Activity logging, real-time story streams
- Uses: Google Maps API, location services

**Story Views** (`lib/home/story_detail_view/`, `lib/home/story_map/`)
- Detail view for individual stories with media, location, author info
- Map view showing all stories geographically
- Mark stories as saved
- Engagement: Like, comment, share

**Quizzes** (`lib/home/quizzpoint/`, `lib/home/quiz_question_interface/`)
- Quiz browse and question interface
- Parse questions from JSON (custom action `parse_questions_json`)
- Track quiz results in Supabase
- Award XP on completion

**AI Bot Chat** (`lib/home/botchat/`)
- Real-time messaging with AI chatbot
- Stream conversation history from `ai_chat_messages` table
- Upload media/files in chat

**Search** (`lib/home/search/`)
- Search posts, stories, hunts, users, groups
- Filter & sort results

### 8.3 Hunts & Trips (Explorer)

**Hunts** (`lib/explor/hunt/`, `lib/explor/hunt_detail_view/`)
- `HuntWidget` – Browse available hunts (map or list view)
- `HuntDetailViewWidget` – View hunt details, tasks, start hunt
- `HuntcardWidget` – Reusable hunt card component
- Parse hunts from JSON (`parsehunt_json` custom action)
- Track hunt progress & completion

**Trips** (`lib/explor/trip/`, `lib/explor/tripcreation/`)
- `TripWidget` – Browse planned trips
- `TripCreationWidget` – Plan new trip with waypoints
- `TripDetailsWidget` – View trip details, route, logistics
- Data: `TripStruct` with `TriplocationStruct` waypoints
- Integration: Maps for route visualization

**Activity List** (`lib/explor/explore_activity_list/`)
- View all activities (hunts, trips, challenges, events) near user

### 8.4 Community & Social

**Groups** (`lib/community/group/`)
- Create, join, manage groups
- View group members, posts, events
- Manage permissions (stored in FFAppState `grouppermision`)
- Supabase tables: `groups`, `group_members`, `group_members_with_profiles`

**Events** (`lib/community/event/`)
- Community or group events
- View attendees, RSVP
- Supabase tables: `events`, `event_attendees`, `event_attendees_with_profiles`

**Reels** (`lib/community/reels/`)
- Short-form video content (TikTok-like)
- Upload, like, comment, share
- Supabase: `posts` (with video media_type)

**Stories** (`lib/community/stories/`)
- Story feed within communities
- Similar to home stories but group-scoped

### 8.5 Profile & User

**User Profiles** (`lib/profile/profiles/`, `lib/profile/profilesuser/`)
- View own profile: username, avatar, bio, badge, XP, followers
- View other user profiles
- Follow/unfollow users
- Supabase: `profiles`, `followers`, `user_badges`

**Edit Profile** (`lib/profile/editprofile/`)
- Update avatar, username, bio, interests
- Upload profile picture via Supabase storage
- Custom action: `upload_file_from_pathimage`

**Chat** (`lib/profile/chat/`)
- Direct messaging with other users
- Message history streaming from `messages` table
- Upload images/files
- Read receipts from `message_read_status`
- Supabase: `conversations`, `messages`, `message_read_status`

**Challenges** (`lib/profile/chllenges/`)
- View active, completed, available challenges
- Track progress via `user_challenge_progress` table
- Claim rewards upon completion
- Two streams: active challenges, completed challenges

**Leaderboard** (`lib/profile/leaderbord/`)
- Global XP rankings (from `xp_leaderboard` view)
- Filter by region or friends
- Show badges, points, level

**Streak Tracking** (`lib/profile/streak/`)
- User activity streaks
- Display daily check-ins from `activity_logs`
- Animate streak badges

**Settings** (`lib/profile/setting/`)
- Language selection (en, es, fr)
- Theme toggle (light/dark)
- Privacy settings
- Notification preferences
- Logout

### 8.6 Post Details

**Post Detail Screen** (`lib/post_details/`)
- View single post with full content, media, comments, likes
- Comment and like interactions
- Supabase: `posts`, `comments`, `comment_likes`, `likes`

---

## 9. Custom Code & Utilities

### 9.1 Custom Actions (`lib/custom_code/actions/`)

**JSON Parsing:**
- `parsehunt_json` – Parse hunt JSON → `HuntStruct[]`
- `parsetrip_json` – Parse trip JSON → `TripStruct[]`
- `parsestories_json` – Parse story JSON → story models
- `parse_questions_json` – Parse quiz JSON → `QuestionStruct[]`
- `merge_posts_json` – Merge multiple post arrays

**Location & Maps:**
- `check_location_status` – Check if location permissions granted
- `check_location_update` – Monitor location changes
- `get_location_name` – Reverse geocode coordinates → address
- `genraterandomlocation` – Generate random lat/lng (for testing)

**Media:**
- `upload_file_from_pathimage` – Upload image to Supabase storage
- `upload_file_from_pathvideo` – Upload video to Supabase storage
- `generate_thumbnail_from_filepath` – Create image thumbnail
- `pick_video_and_generate_thumbnail` – Pick video and create thumbnail

**Firebase & Notifications:**
- `set_f_c_m_token` – Register FCM token on app start

**Data Sync:**
- `sync_table_up` – Push local changes to Supabase
- `sync_table_down` – Fetch updates from Supabase

**Utility:**
- `charatercount` – Count characters in string
- `uuidgen` – Generate UUID
- `speak` – Text-to-speech

### 9.2 Custom Widgets (`lib/custom_code/widgets/`)
- Third-party or custom UI components not provided by FlutterFlow

---

## 10. Internationalization (i18n)

**Supported Languages:** English (en), Spanish (es), French (fr)

**Implementation:**
- Localization strings in `lib/flutter_flow/internationalization.dart`
- `FFLocalizations` class with locale delegates
- `AppFunctions.getTranslation(key, locale)` for runtime translation

**Usage:**
```dart
// In Flutter widgets
FFLocalizations.of(context)!.getText('welcome') // Gets translated string
AppState.language // Current language code
```

**User Selection:**
- Language selection screen during onboarding
- Saved in `FFAppState.language` and persisted
- App rebuilds with new locale on selection

---

## 11. Theme & Styling

**Theme** (`lib/flutter_flow/flutter_flow_theme.dart`):
- Light & Dark mode colors
- Typography (fonts: Google Fonts)
- Spacing & sizing constants
- Component-level styling

**Custom Colors & Fonts:**
- Color palette: Primary, secondary, accent, success, error, warning
- Fonts: Roboto, Poppins, Open Sans (configurable)

---

## 12. Development Workflow

### 12.1 Adding a New Feature

1. **Create UI Screens:**
   - Add folder under appropriate feature module (e.g., `lib/profile/mynewscreen/`)
   - Create `*_widget.dart` (StatefulWidget)
   - Create `*_model.dart` (extending FlutterFlowModel)

2. **Define Data Models:**
   - Add struct to `lib/backend/schema/structs/`
   - Implement serialization methods

3. **Set Up Supabase:**
   - Create tables in Supabase dashboard
   - Generate Dart row classes in `lib/backend/supabase/database/tables/`
   - Export from `database.dart`

4. **Create Queries:**
   - Use `SupaFlow.client.from('table_name')` for queries
   - Subscribe to streams in model's initState
   - Build UI with StreamBuilder

5. **Register Route:**
   - Add GoRoute in `lib/flutter_flow/nav/nav.dart`
   - Define path, params, builder

6. **Test:**
   - Run on Android/iOS/Web
   - Test data persistence, streams, navigation

### 12.2 Common Patterns

**Query Single Row:**
```dart
final user = await ProfilesTable().querySingleRow(
  queryFn: (q) => q.eq('id', userId),
);
```

**Query Multiple Rows:**
```dart
final posts = await PostsTable().queryRows(
  queryFn: (q) => q.eq('user_id', userId).order('created_at', ascending: false),
  limit: 20,
);
```

**Real-time Stream:**
```dart
Stream<List<PostsRow>> postStream = SupaFlow.client
  .from('posts')
  .stream(primaryKey: ['id'])
  .eq('user_id', userId)
  .order('created_at', ascending: false)
  .map((rows) => rows.map(PostsRow.fromMap).toList());

// In widget
StreamBuilder<List<PostsRow>>(
  stream: postStream,
  builder: (context, snapshot) {
    if (!snapshot.hasData) return CircularProgressIndicator();
    return ListView(...);
  },
)
```

**Insert/Update/Delete:**
```dart
// Insert
await PostsTable().insert({
  'content': content,
  'user_id': userId,
  'created_at': DateTime.now(),
});

// Update
await PostsTable().update(
  data: {'content': newContent},
  matchingRows: (q) => q.eq('id', postId),
  returnRows: true,
);

// Delete
await PostsTable().delete(
  matchingRows: (q) => q.eq('id', postId),
);
```

**Upload File:**
```dart
final path = await uploadSupabaseStorageFiles(
  selectedFiles: [file],
  storageFolderPath: 'profile_pics/$userId',
);
```

---

## 13. Building & Deployment

### 13.1 Build Commands

```bash
# Get dependencies
flutter pub get

# Run on device/emulator
flutter run

# Build Android APK
flutter build apk --release

# Build Android App Bundle
flutter build appbundle --release

# Build iOS
flutter build ios --release

# Build Web
flutter build web --release
```

### 13.2 Environment Setup

**Android (`android/app/build.gradle`):**
- Update `applicationId` and version codes
- Add Firebase `google-services.json`
- Sign APK with keystore for Play Store

**iOS (`ios/Runner/`):**
- Update bundle identifier
- Add Firebase `GoogleService-Info.plist`
- Provisioning profiles and certificates

**Configuration Files:**
- Supabase URL and API keys: `lib/app_state.dart`, `lib/backend/supabase/supabase.dart`
- Firebase config: `lib/backend/firebase/firebase_config.dart`
- Google Maps API key: `lib/app_state.dart` (Apikey)

---

## 14. Troubleshooting

### 14.1 Common Issues

**Build Failures:**
```bash
flutter clean
flutter pub get
flutter pub upgrade
flutter pub run build_runner build --delete-conflicting-outputs
```

**Supabase Connection Issues:**
- Verify URL and API key in `app_state.dart`
- Check network connectivity
- Ensure Supabase project is running
- Verify RLS policies allow app access

**Firebase / Push Notifications Not Working:**
- Ensure `google-services.json` and `GoogleService-Info.plist` are in place
- Verify FCM token registration in app logs
- Check Firebase project console for issues

**Location Permission Issues:**
- Android: Add permissions in `AndroidManifest.xml`
- iOS: Add location keys in `Info.plist`
- Test with actual device (some emulators have limited permission support)

**Supabase Storage Upload Fails:**
- Verify storage bucket exists and RLS policies allow uploads
- Check file size limits
- Ensure authentication token is valid

---

## 15. Performance Optimization

### 15.1 Tips

- **Pagination:** Limit Supabase queries to 20–50 rows per page
- **Caching:** Use `FFAppState` to cache frequently accessed data (stories, posts)
- **Streams:** Debounce location updates to reduce server load
- **Images:** Compress before upload; use thumbnails in lists
- **Lazy Loading:** Load comments/replies on demand

---

## 16. Security Notes

- **API Keys:** Store Supabase and Firebase keys securely (not hardcoded in production)
- **RLS Policies:** Implement row-level security on all user-scoped tables
- **Auth:** Validate tokens on server; implement JWT expiry
- **Privacy:** Respect user privacy settings; allow data deletion
- **Media:** Scan uploaded files for malware; enforce file type restrictions

---

## 17. File Locations Reference

| Feature | Location |
|---------|----------|
| App Entry | [lib/main.dart](lib/main.dart) |
| Global State | [lib/app_state.dart](lib/app_state.dart) |
| Auth Screens | [lib/authentication/](lib/authentication/) |
| Home & Feed | [lib/home/](lib/home/) |
| Hunts & Trips | [lib/explor/](lib/explor/) |
| Profile | [lib/profile/](lib/profile/) |
| Community | [lib/community/](lib/community/) |
| Supabase Schema | [lib/backend/supabase/database/](lib/backend/supabase/database/) |
| Data Models | [lib/backend/schema/structs/](lib/backend/schema/structs/) |
| Custom Actions | [lib/custom_code/actions/](lib/custom_code/actions/) |
| Navigation | [lib/flutter_flow/nav/nav.dart](lib/flutter_flow/nav/nav.dart) |
| Theme | [lib/flutter_flow/flutter_flow_theme.dart](lib/flutter_flow/flutter_flow_theme.dart) |
| i18n | [lib/flutter_flow/internationalization.dart](lib/flutter_flow/internationalization.dart) |

---

## 18. API & Services Summary

| Service | Purpose | Integration |
|---------|---------|-------------|
| Supabase PostgreSQL | Data persistence | Direct queries + streams |
| Supabase Auth | User authentication | Supabase user provider |
| Supabase Storage | File uploads (media) | Storage helpers |
| Firebase Cloud Messaging | Push notifications | FCM token registration |
| Firebase Remote Config | Dynamic config | Config values |
| Google Maps API | Maps & geocoding | Flutter Google Maps widget |
| Google Places API | Location search | Integrated in maps |

---

**Generated:** February 3, 2026  
**Last Updated:** February 3, 2026  
**Maintained By:** Development Team