import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? SplasWidget() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? SplasWidget() : OnboardingWidget(),
        ),
        FFRoute(
          name: ChangepassAuthenticationScreenWidget.routeName,
          path: ChangepassAuthenticationScreenWidget.routePath,
          builder: (context, params) => ChangepassAuthenticationScreenWidget(),
        ),
        FFRoute(
          name: LoginAuthenticationScreenWidget.routeName,
          path: LoginAuthenticationScreenWidget.routePath,
          builder: (context, params) => LoginAuthenticationScreenWidget(),
        ),
        FFRoute(
          name: WelcomeHomeWidget.routeName,
          path: WelcomeHomeWidget.routePath,
          builder: (context, params) => WelcomeHomeWidget(),
        ),
        FFRoute(
          name: CreateAuthenticationScreenWidget.routeName,
          path: CreateAuthenticationScreenWidget.routePath,
          builder: (context, params) => CreateAuthenticationScreenWidget(),
        ),
        FFRoute(
          name: ForgotAuthenticationScreenWidget.routeName,
          path: ForgotAuthenticationScreenWidget.routePath,
          builder: (context, params) => ForgotAuthenticationScreenWidget(),
        ),
        FFRoute(
          name: InterestSelectionInterfaceWidget.routeName,
          path: InterestSelectionInterfaceWidget.routePath,
          builder: (context, params) => InterestSelectionInterfaceWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
            password2: params.getParam(
              'password2',
              ParamType.String,
            ),
            username: params.getParam(
              'username',
              ParamType.String,
            ),
            social: params.getParam(
              'social',
              ParamType.bool,
            ),
            socialtype: params.getParam<Socialtype>(
              'socialtype',
              ParamType.Enum,
            ),
          ),
        ),
        FFRoute(
          name: LanguageSelectionScreenWidget.routeName,
          path: LanguageSelectionScreenWidget.routePath,
          builder: (context, params) => LanguageSelectionScreenWidget(
            from: params.getParam(
              'from',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LocationPermissionRequestScreenWidget.routeName,
          path: LocationPermissionRequestScreenWidget.routePath,
          builder: (context, params) => LocationPermissionRequestScreenWidget(
            username: params.getParam(
              'username',
              ParamType.String,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
            password2: params.getParam(
              'password2',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            social: params.getParam(
              'social',
              ParamType.bool,
            ),
            socialtype: params.getParam<Socialtype>(
              'socialtype',
              ParamType.Enum,
            ),
            intgrest: params.getParam<String>(
              'intgrest',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: PasswordsucessWidget.routeName,
          path: PasswordsucessWidget.routePath,
          builder: (context, params) => PasswordsucessWidget(),
        ),
        FFRoute(
          name: SplasWidget.routeName,
          path: SplasWidget.routePath,
          builder: (context, params) => SplasWidget(
            isFromNotification: params.getParam(
              'isFromNotification',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: WelcomeScreenWithCharacterWidget.routeName,
          path: WelcomeScreenWithCharacterWidget.routePath,
          builder: (context, params) => WelcomeScreenWithCharacterWidget(),
        ),
        FFRoute(
          name: BotchatWidget.routeName,
          path: BotchatWidget.routePath,
          requireAuth: true,
          builder: (context, params) => BotchatWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: HomescreenWidget.routeName,
          path: HomescreenWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HomescreenWidget(),
        ),
        FFRoute(
          name: NotificationListViewWidget.routeName,
          path: NotificationListViewWidget.routePath,
          requireAuth: true,
          builder: (context, params) => NotificationListViewWidget(),
        ),
        FFRoute(
          name: PlacesToExploreListWidget.routeName,
          path: PlacesToExploreListWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PlacesToExploreListWidget(),
        ),
        FFRoute(
          name: QuizQuestionInterfaceWidget.routeName,
          path: QuizQuestionInterfaceWidget.routePath,
          requireAuth: true,
          builder: (context, params) => QuizQuestionInterfaceWidget(
            history: params.getParam(
              'history',
              ParamType.JSON,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: QuizzpointWidget.routeName,
          path: QuizzpointWidget.routePath,
          requireAuth: true,
          builder: (context, params) => QuizzpointWidget(
            score: params.getParam(
              'score',
              ParamType.int,
            ),
            story: params.getParam(
              'story',
              ParamType.JSON,
            ),
            correct: params.getParam(
              'correct',
              ParamType.int,
            ),
            isave: params.getParam(
              'isave',
              ParamType.bool,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SavestoryWidget.routeName,
          path: SavestoryWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SavestoryWidget(
            stories: params.getParam(
              'stories',
              ParamType.JSON,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SearchWidget.routeName,
          path: SearchWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SearchWidget(),
        ),
        FFRoute(
          name: StoryDetailViewWidget.routeName,
          path: StoryDetailViewWidget.routePath,
          requireAuth: true,
          builder: (context, params) => StoryDetailViewWidget(
            stories: params.getParam(
              'stories',
              ParamType.JSON,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: StoryDetailViewFocuseWidget.routeName,
          path: StoryDetailViewFocuseWidget.routePath,
          requireAuth: true,
          builder: (context, params) => StoryDetailViewFocuseWidget(
            stories: params.getParam(
              'stories',
              ParamType.JSON,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: StoryMapWidget.routeName,
          path: StoryMapWidget.routePath,
          requireAuth: true,
          builder: (context, params) => StoryMapWidget(
            story: params.getParam(
              'story',
              ParamType.JSON,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ExploreActivityListWidget.routeName,
          path: ExploreActivityListWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ExploreActivityListWidget(),
        ),
        FFRoute(
          name: HuntWidget.routeName,
          path: HuntWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HuntWidget(),
        ),
        FFRoute(
          name: TripWidget.routeName,
          path: TripWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TripWidget(
            trip: params.getParam(
              'trip',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TripStruct.fromSerializableMap,
            ),
            public: params.getParam(
              'public',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: HuntDetailViewWidget.routeName,
          path: HuntDetailViewWidget.routePath,
          requireAuth: true,
          builder: (context, params) => HuntDetailViewWidget(
            hunt: params.getParam(
              'hunt',
              ParamType.DataStruct,
              isList: false,
              structBuilder: HuntStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: TripcreationWidget.routeName,
          path: TripcreationWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TripcreationWidget(),
        ),
        FFRoute(
          name: TripdetailsWidget.routeName,
          path: TripdetailsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TripdetailsWidget(
            trip: params.getParam<TripPlansWithLocationCountsAndCompletedRow>(
              'trip',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: StoriesWidget.routeName,
          path: StoriesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => StoriesWidget(),
        ),
        FFRoute(
          name: StoryDetailViewstoriesWidget.routeName,
          path: StoryDetailViewstoriesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => StoryDetailViewstoriesWidget(
            stories: params.getParam(
              'stories',
              ParamType.JSON,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: StoryMapstoriesWidget.routeName,
          path: StoryMapstoriesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => StoryMapstoriesWidget(
            story: params.getParam(
              'story',
              ParamType.JSON,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: StoryDetailViewFocusestoriesWidget.routeName,
          path: StoryDetailViewFocusestoriesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => StoryDetailViewFocusestoriesWidget(
            story: params.getParam(
              'story',
              ParamType.JSON,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: QuizQuestionInterfacestoriesWidget.routeName,
          path: QuizQuestionInterfacestoriesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => QuizQuestionInterfacestoriesWidget(
            history: params.getParam(
              'history',
              ParamType.JSON,
            ),
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CommunityWidget.routeName,
          path: CommunityWidget.routePath,
          requireAuth: true,
          builder: (context, params) => CommunityWidget(),
        ),
        FFRoute(
          name: PostCreationWidget.routeName,
          path: PostCreationWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PostCreationWidget(
            groupID: params.getParam<GroupsWithMemberCountRow>(
              'groupID',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: GroupWidget.routeName,
          path: GroupWidget.routePath,
          requireAuth: true,
          builder: (context, params) => GroupWidget(),
        ),
        FFRoute(
          name: GroupOverviewWidget.routeName,
          path: GroupOverviewWidget.routePath,
          requireAuth: true,
          builder: (context, params) => GroupOverviewWidget(
            group: params.getParam<GroupsWithMemberCountRow>(
              'group',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: PermissionsManagementWidget.routeName,
          path: PermissionsManagementWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PermissionsManagementWidget(),
        ),
        FFRoute(
          name: MemberListWidget.routeName,
          path: MemberListWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MemberListWidget(
            groupid: params.getParam(
              'groupid',
              ParamType.String,
            ),
            count: params.getParam(
              'count',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: GroupCreationFormWidget.routeName,
          path: GroupCreationFormWidget.routePath,
          requireAuth: true,
          builder: (context, params) => GroupCreationFormWidget(
            member: params.getParam<ProfilesRow>(
              'member',
              ParamType.SupabaseRow,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: EventListingPageWidget.routeName,
          path: EventListingPageWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EventListingPageWidget(),
        ),
        FFRoute(
          name: EventDetailsOverviewWidget.routeName,
          path: EventDetailsOverviewWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EventDetailsOverviewWidget(
            events: params.getParam<EventsRow>(
              'events',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: EventCreationFormWidget.routeName,
          path: EventCreationFormWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EventCreationFormWidget(),
        ),
        FFRoute(
          name: RealsWidget.routeName,
          path: RealsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => RealsWidget(
            nextindex: params.getParam(
              'nextindex',
              ParamType.int,
            ),
            postID: params.getParam(
              'postID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MemberListAddWidget.routeName,
          path: MemberListAddWidget.routePath,
          requireAuth: true,
          builder: (context, params) => MemberListAddWidget(),
        ),
        FFRoute(
          name: PostReelWidget.routeName,
          path: PostReelWidget.routePath,
          requireAuth: true,
          builder: (context, params) => PostReelWidget(
            video: params.getParam(
              'video',
              ParamType.DataStruct,
              isList: false,
              structBuilder: VideoPickResultStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: ProfilesWidget.routeName,
          path: ProfilesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfilesWidget(),
        ),
        FFRoute(
          name: SettingWidget.routeName,
          path: SettingWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SettingWidget(),
        ),
        FFRoute(
          name: StreakWidget.routeName,
          path: StreakWidget.routePath,
          requireAuth: true,
          builder: (context, params) => StreakWidget(),
        ),
        FFRoute(
          name: LeaderbordWidget.routeName,
          path: LeaderbordWidget.routePath,
          requireAuth: true,
          builder: (context, params) => LeaderbordWidget(
            username: params.getParam(
              'username',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChllengesWidget.routeName,
          path: ChllengesWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ChllengesWidget(),
        ),
        FFRoute(
          name: GroupEditFormWidget.routeName,
          path: GroupEditFormWidget.routePath,
          requireAuth: true,
          builder: (context, params) => GroupEditFormWidget(
            group: params.getParam<GroupsRow>(
              'group',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: Reportpage2Widget.routeName,
          path: Reportpage2Widget.routePath,
          builder: (context, params) => Reportpage2Widget(),
        ),
        FFRoute(
          name: ProfilesuserWidget.routeName,
          path: ProfilesuserWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ProfilesuserWidget(
            userid: params.getParam(
              'userid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChatWidget.routeName,
          path: ChatWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ChatWidget(
            conversation: params.getParam(
              'conversation',
              ParamType.String,
            ),
            username: params.getParam(
              'username',
              ParamType.String,
            ),
            averter: params.getParam(
              'averter',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EditprofileWidget.routeName,
          path: EditprofileWidget.routePath,
          requireAuth: true,
          builder: (context, params) => EditprofileWidget(),
        ),
        FFRoute(
          name: TestWidget.routeName,
          path: TestWidget.routePath,
          builder: (context, params) => TestWidget(),
        ),
        FFRoute(
          name: TestcompWidget.routeName,
          path: TestcompWidget.routePath,
          requireAuth: true,
          builder: (context, params) => TestcompWidget(),
        ),
        FFRoute(
          name: PostDetailsWidget.routeName,
          path: PostDetailsWidget.routePath,
          builder: (context, params) => PostDetailsWidget(
            post: params.getParam(
              'post',
              ParamType.String,
            ),
            from: params.getParam(
              'from',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Untitled_video_-_Made_with_Clipchamp.gif',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
