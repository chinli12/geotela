# Geotela

A Flutter-based mobile application for location-based activities including historical stories of a location, hunts (scavenger hunts), stories, challenges, and community engagement. Built with FlutterFlow and powered by Supabase and Firebase.

## Overview

Geotela is designed to gamify location-based exploration through a rich set of interactive features. Users can participate in scavenger hunts, share stories and reels, complete challenges, join groups, and compete on leaderboards all with real-time data synchronization and location awareness.

### Key Features

- **Historical Location stories (Home/explore)**: Browse,read, and complete location based Quiz with points and rewards.

- **Hunts (Scavenger Hunt)**: Browse, start, and complete location-based hunts with points and rewards.
- **Stories & Reels**: Capture and share stories from your location; view stories from other users.
- **Challenges**: Participate in themed challenges and track progress.
- **Community & Groups**: Create or join groups, manage permissions, and collaborate with other users.
- **Real-time Chat**: Direct messaging with other users (currently in profile module).
- **Leaderboard**: Track rankings based on activity and points.
- **Multi-language Support**: English, Spanish, and French localization.
- **Location Services**: Permission-aware location tracking and geolocation-based content discovery.
- **Push Notifications**: Firebase Cloud Messaging (FCM) integration for real-time alerts.

## Technology Stack

- **Frontend**: Flutter (stable channel) + FlutterFlow components
- **Language**: Dart
- **Backend Database & Realtime**: Supabase (PostgreSQL + real-time streams)
- **Storage**: Supabase Storage (file uploads, images, videos)
- **Authentication**: Supabase Auth (email/password, session management)
- **Push Notifications**: Firebase Cloud Messaging (FCM)
- **Additional Services**: Firebase (platform-specific config), Google Maps API (location/mapping)
- **State Management**: Provider (ChangeNotifier pattern with `FFAppState` singleton)
- **Persistence**: SharedPreferences (local caching of user prefs, language, theme, location)

## Project Structure

```
geotela/
├── android/              # Android-specific config (gradle, google-services.json)
├── ios/                  # iOS-specific config (Pods, GoogleService-Info.plist, Runner.xcworkspace)
├── web/                  # Web build assets
├── assets/               # Images, audio, JSON animations, PDFs, videos
│   ├── images/
│   ├── audios/
│   ├── jsons/            # Lottie/Rive animation files
│   ├── rive_animations/
│   └── videos/
├── firebase/             # Firebase config (storage.rules, functions)
├── lib/                  # Main Dart application code
│   ├── main.dart         # App entry point, initialization
│   ├── app_state.dart    # Global state (FFAppState singleton)
│   ├── index.dart        # Central exports
│   ├── auth/             # Supabase authentication
│   ├── authentication/   # Auth screens (login, sign-up, password reset, onboarding)
│   ├── backend/          # Backend integrations
│   │   ├── api_requests/
│   │   ├── firebase/     # Firebase config
│   │   ├── schema/       # Data models (structs)
│   │   └── supabase/     # Supabase client & generated schema
│   ├── home/             # Home screen, maps, stories, quizzes, bot chat
│   ├── explor/           # Hunt browsing, hunt details, hunt cards
│   ├── community/        # Groups, events, reels, stories
│   ├── profile/          # User profiles, settings, chat, challenges, leaderboard
│   ├── components/       # Reusable UI components (cards, buttons, shimmer loaders)
│   ├── custom_code/      # Custom actions (JSON parsing, location checks, FCM setup)
│   ├── flutter_flow/     # FlutterFlow-generated utilities (navigation, theme, i18n)
│   └── test/             # Widget tests
├── test/                 # Unit/widget test files
├── pubspec.yaml          # Flutter dependencies and project metadata
├── analysis_options.yaml # Dart analyzer configuration
└── README.md             # This file
```

## Getting Started

### Prerequisites

1. **Flutter SDK** (stable channel)
   - Download from [flutter.dev](https://flutter.dev/docs/get-started/install)
   - Run `flutter doctor` to verify your setup

2. **Platform Dependencies**:
   - **Android**: Android Studio, SDK ≥ API 21
   - **iOS**: Xcode, CocoaPods
   - **Web**: A modern browser (Chrome, Firefox, Edge, Safari)

3. **Supabase Credentials**:
   - Project URL and API keys (stored in `lib/app_state.dart` and `lib/backend/supabase/supabase.dart`)
   - Configure database tables and realtime subscriptions

4. **Firebase Project**:
   - Google Firebase console setup
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place files in `android/app/` and `ios/Runner/` respectively

### Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd geotela
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure Supabase & Firebase**:
   - Update Supabase keys in `lib/app_state.dart` (or use environment variables)
   - Ensure Firebase config files are in place for your platform

4. **Run the app**:
   ```bash
   flutter run
   ```

   For specific platforms:
   ```bash
   # Android
   flutter run -d <android-device-id>
   
   # iOS
   flutter run -d <ios-device-id>
   
   # Web
   flutter run -d chrome
   ```

## Architecture & Key Components

### App Initialization (`main.dart`)
- Initializes Flutter bindings and web URL strategy
- Sets up Firebase and Supabase clients
- Loads localization and restores persisted app state
- Runs startup actions (location permission check, FCM token registration)
- Injects `FFAppState` via `ChangeNotifierProvider` and launches `MyApp`

### Global State (`FFAppState`)
- Singleton `ChangeNotifier` managing app-wide state
- Persists user preferences, language, theme, and location data
- Stores API keys, user info, and cached post/story lists
- Provides collection management helpers (add/remove/update items)

### Routing & Navigation (`lib/flutter_flow/nav/nav.dart`)
- FlutterFlow-generated route registry with typed parameters
- Supports custom struct serialization (e.g., `HuntStruct`, `SupabaseRow`)
- Named routes: `HuntWidget`, `HuntDetailViewWidget`, stories, profiles, challenges, etc.

### Hunt Feature (`lib/explor/hunt*`)
- **HuntWidget**: Main hunt browse/list view
- **HuntDetailViewWidget**: Hunt detail screen with task breakdown and start button
- **HuntcardWidget**: Reusable hunt summary card
- **HuntStruct**: Core data model (title, description, category, distance, points, tasks, etc.)
- **parsehuntJson**: Custom action to parse raw JSON into structured `HuntStruct` objects

### Supabase Integration (`lib/backend/supabase/*`)
- Auto-generated table schemas and row types (e.g., `SavedPlacesRow`, `StoryRequestsRow`, `AllChallengesViewRow`)
- Real-time stream subscriptions (e.g., `Stream<List<StoryRequestsRow>>`)
- Storage utilities for file uploads and management
- Database utilities for queries and mutations

### Authentication (`lib/auth/supabase_auth/*`)
- Supabase-based user authentication
- Session and token management
- User stream listener to sync auth state with `AppStateNotifier`

## Development Workflow

### Adding a New Feature

1. **Create UI in FlutterFlow** (if using FlutterFlow) or add Flutter widgets to `lib/`
2. **Define data models** in `lib/backend/schema/structs/`
3. **Set up Supabase queries** via `lib/backend/supabase/` helpers
4. **Create model/controller** extending `FlutterFlowModel<WidgetName>`
5. **Implement widget** with `StatefulWidget` + model injection
6. **Register route** in `lib/flutter_flow/nav/nav.dart`
7. **Test** on target platforms

### Using Custom Actions

Custom actions are stored in `lib/custom_code/actions/`. Examples:
- `parsehuntJson`: Parse JSON strings into structured objects
- `checkLocationStatus`: Verify location permission status
- `setFCMToken`: Register device for push notifications

Add new actions in the same directory and reference them from widgets.

### Building for Release

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS App
flutter build ios --release

# Web
flutter build web --release
```

## Localization

Supported languages: English, Spanish, French

Localization strings are managed in `lib/flutter_flow/internationalization.dart`. To add or update translations:
1. Edit the language map in that file
2. Rebuild the app to regenerate i18n delegates

Users can switch language via the app settings (stored in `FFAppState.language`).

## Troubleshooting

### Build Issues
- Run `flutter clean && flutter pub get` to reset the build cache
- Ensure you're on the stable Flutter channel: `flutter channel stable`

### Supabase Connection Failed
- Check your Supabase project URL and API keys in `lib/app_state.dart`
- Verify network connectivity
- Ensure Supabase service is operational

### Firebase / Push Notifications Not Working
- Verify `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) are in place
- Check FCM token registration in the app logs
- Ensure Firebase project is properly configured in the console

### Location Permission Issues
- Ensure location permissions are requested on app start (handled by `checkLocationStatus()`)
- Verify native platform permissions in Android Manifest or iOS Info.plist

## Documentation

- **Technical Details**: See [TECHNICAL_DOCUMENTATION.md](TECHNICAL_DOCUMENTATION.md) for in-depth architecture, state management, and component details.

## Contributing

When contributing to the project:
1. Follow Dart style guidelines (use `dart format`)
2. Add comments for complex logic
3. Test on multiple platforms (Android, iOS, Web)
4. Update this README if adding major features

## License

[Add your license here]

## Contact & Support

For questions, issues, or feature requests, contact the project maintainers or refer to the documentation files in the repository.

---

**Last Updated**: February 3, 2026
