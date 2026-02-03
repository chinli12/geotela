# Geotela Technical Documentation

## Project Overview
Geotela is a Flutter mobile application (built with FlutterFlow components) focused on location-based activities: hunts, stories, challenges, and social features. The app uses Supabase as the primary backend (database + storage + realtime streams) and also initializes Firebase for push notifications and other services.

## High-level Architecture
- Frontend: Flutter + FlutterFlow-generated widgets and models (under `lib/`).
- State: `FFAppState` (singleton ChangeNotifier) stored in `lib/app_state.dart` and persisted with `SharedPreferences`.
- Backend: Supabase (database, realtime streams, storage) via `lib/backend/supabase` and Firebase for platform services.
- Routing: FlutterFlow navigation (`lib/flutter_flow/nav/nav.dart`) with typed params (including `SupabaseRow` and custom structs like `HuntStruct`).
- Custom code: `lib/custom_code` (custom actions, e.g., `parsehuntJson`, location checks, FCM token setup).

## Startup / Initialization Flow (what `main.dart` does)
1. Flutter bindings are initialized and web URL path strategy is configured.
2. `initFirebase()` is called to initialize Firebase services.
3. `SupaFlow.initialize()` sets up Supabase client(s).
4. `FFLocalizations.initialize()` prepares i18n resources.
5. `FFAppState()` singleton is created and `initializePersistedState()` restores persisted values.
6. Custom actions run on startup (examples observed: `checkLocationStatus()`, `setFCMToken()`).
7. App injected with `ChangeNotifierProvider(create: (context) => appState)` and `MyApp` is started.

## Global State (`FFAppState`)
- Implemented in `lib/app_state.dart` as a singleton `ChangeNotifier`.
- Persists values via `SharedPreferences` during `initializePersistedState()`.
- Notable persisted and runtime fields:
  - `location`, `username`, `language` (strings)
  - `Apikey`, `supabasekey` (keys stored in prefs)
  - `selectedlaguead` (a `LanguageStruct` persisted as JSON)
  - `theme`, `firstvisite`, `ispaswordchange` (flags)
  - `Newstories`, `cachepost` (lists persisted as JSON strings)
  - `lastsync`, `dummylatlong` (LatLng values)
  - `isLocationOn`, `hasLocationPermission`, `newLocation`, `isDataReady` (runtime booleans)
  - Collections of typed structs (e.g., `IntrestStruct`, `LanguageStruct`, `HistoryStoriesStruct`, `VideoPostStruct`).

The `FFAppState` exposes helpers to add/remove/update collection items and serializes selected structs for persistence.

## Backend Integration
- Supabase: used throughout the app for queries, streams, and storage operations. The project contains `lib/backend/supabase/*` (client wrappers, table/row schemas, storage helpers).
- Firebase: initialized at startup (`initFirebase()`); used for FCM tokens and possibly other platform-level services.
- Many models and widgets import `auth/supabase_auth/auth_util.dart` and `backend/supabase/supabase.dart` to authenticate and request data.

## Key Features & Components
- Hunts (Scavenger-style experiences):
  - `HuntWidget` (route registered in nav) — the main list/browse view.
  - `HuntDetailViewWidget` — detail screen; accepts `HuntStruct` via route params.
  - `HuntcardWidget` — shows hunt summary information.
  - Data model: `HuntStruct` (serializable struct under `lib/backend/schema/structs/`) representing a hunt with title, description, tasks, category, distance, points, and other metadata.
  - JSON parsing helper: `parsehuntJson` (custom action) converts raw JSON into `HuntStruct` lists.

- Stories, Posts, Challenges, Quizzes: Many modules (under `lib/home`, `lib/stories`, `lib/profile`, `lib/post_details`) integrate with Supabase using typed row/stream helpers (e.g., `Stream<List<...Row>>? containerSupabaseStream` patterns in models).

- Authentication: Supabase-based auth with helpers found under `lib/auth/supabase_auth/` (including `auth_util.dart`, `supabase_user_provider.dart`). The app listens to `geotelaSupabaseUserStream()` to update `AppStateNotifier`.

## Routing & Navigation
- Routes are registered in `lib/flutter_flow/nav/nav.dart`. Example routes:
  - `HuntWidget` (`HuntWidget.routeName` / `HuntWidget.routePath`).
  - `HuntDetailViewWidget` takes a `hunt` param with `structBuilder: HuntStruct.fromSerializableMap`.
- Navigation params include `ParamType.SupabaseRow` and `SupabaseDataRow` serialization utilities.

## Assets and Media
- The `assets/` directory contains `images/`, `audios/`, `jsons/` (Lottie/animation files), `pdfs/`, `rive_animations/`, and `videos/` used by various widgets.

## Development: Run & Build
1. Install Flutter (stable channel recommended).
2. From project root run:
```bash
flutter pub get
flutter run
```
3. Ensure you have platform-specific setup for Firebase and Supabase keys (the code shows `supabasekey` stored in `FFAppState` and `backend/firebase/firebase_config.dart`). Replace or configure environment keys as appropriate before running.

## Notable Code Locations
- App entry: [lib/main.dart](lib/main.dart)
- Global state: [lib/app_state.dart](lib/app_state.dart)
- Supabase client and generated schema: [lib/backend/supabase](lib/backend/supabase)
- Hunt feature: [lib/explor/hunt](lib/explor/hunt), [lib/explor/hunt_detail_view](lib/explor/hunt_detail_view), [lib/explor/huntcard](lib/explor/huntcard)
- Navigation: [lib/flutter_flow/nav/nav.dart](lib/flutter_flow/nav/nav.dart)
- Custom actions: [lib/custom_code/actions](lib/custom_code/actions)

## Next Steps / Recommendations
- Add a short README section describing how to configure Supabase and Firebase credentials locally (env or secure storage) prior to running.
- Document `HuntStruct` fields in detail (types and example JSON) inside this document or as a separate `DATA_MODEL.md`.
- Add a developer note listing common FlutterFlow-generated patterns used by the project (models, `createModel`, `FlutterFlowModel` base, streams, and build patterns).

## Contact
For code-level questions, inspect the module files referenced above or ask the project maintainer for API keys and environment details.

---
Generated/updated: February 3, 2026