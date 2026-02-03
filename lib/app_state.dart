import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _location = prefs.getString('ff_location') ?? _location;
    });
    _safeInit(() {
      _username = prefs.getString('ff_username') ?? _username;
    });
    _safeInit(() {
      _language = prefs.getString('ff_language') ?? _language;
    });
    _safeInit(() {
      _Apikey = prefs.getString('ff_Apikey') ?? _Apikey;
    });
    _safeInit(() {
      _supabasekey = prefs.getString('ff_supabasekey') ?? _supabasekey;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_selectedlaguead')) {
        try {
          final serializedData = prefs.getString('ff_selectedlaguead') ?? '{}';
          _selectedlaguead =
              LanguageStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _theme = prefs.getString('ff_theme') ?? _theme;
    });
    _safeInit(() {
      _firstvisite = prefs.getBool('ff_firstvisite') ?? _firstvisite;
    });
    _safeInit(() {
      _ispaswordchange =
          prefs.getBool('ff_ispaswordchange') ?? _ispaswordchange;
    });
    _safeInit(() {
      _lastsync = latLngFromString(prefs.getString('ff_lastsync')) ?? _lastsync;
    });
    _safeInit(() {
      _dummylatlong =
          latLngFromString(prefs.getString('ff_dummylatlong')) ?? _dummylatlong;
    });
    _safeInit(() {
      _googlemap = prefs.getString('ff_googlemap') ?? _googlemap;
    });
    _safeInit(() {
      _Newstories = prefs.getStringList('ff_Newstories')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _Newstories;
    });
    _safeInit(() {
      _cachepost = prefs.getStringList('ff_cachepost')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _cachepost;
    });
    _safeInit(() {
      _locationimage = prefs.getString('ff_locationimage') ?? _locationimage;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _location = '';
  String get location => _location;
  set location(String value) {
    _location = value;
    prefs.setString('ff_location', value);
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
    prefs.setString('ff_username', value);
  }

  String _language = '';
  String get language => _language;
  set language(String value) {
    _language = value;
    prefs.setString('ff_language', value);
  }

  List<IntrestStruct> _intrest = [
    IntrestStruct.fromSerializableMap(jsonDecode('{\"name\":\"History\"}')),
    IntrestStruct.fromSerializableMap(jsonDecode('{\"name\":\"Hello World\"}')),
    IntrestStruct.fromSerializableMap(jsonDecode('{\"name\":\"Hello World\"}')),
    IntrestStruct.fromSerializableMap(jsonDecode('{\"name\":\"Hello World\"}')),
    IntrestStruct.fromSerializableMap(jsonDecode('{\"name\":\"Hello World\"}')),
    IntrestStruct.fromSerializableMap(jsonDecode('{\"name\":\"Hello World\"}')),
    IntrestStruct.fromSerializableMap(jsonDecode('{\"name\":\"Hello World\"}')),
    IntrestStruct.fromSerializableMap(jsonDecode('{\"name\":\"Hello World\"}')),
    IntrestStruct.fromSerializableMap(jsonDecode('{\"name\":\"Hello World\"}')),
    IntrestStruct.fromSerializableMap(jsonDecode('{\"name\":\"Hello World\"}')),
    IntrestStruct.fromSerializableMap(jsonDecode('{\"name\":\"Hello World\"}'))
  ];
  List<IntrestStruct> get intrest => _intrest;
  set intrest(List<IntrestStruct> value) {
    _intrest = value;
  }

  void addToIntrest(IntrestStruct value) {
    intrest.add(value);
  }

  void removeFromIntrest(IntrestStruct value) {
    intrest.remove(value);
  }

  void removeAtIndexFromIntrest(int index) {
    intrest.removeAt(index);
  }

  void updateIntrestAtIndex(
    int index,
    IntrestStruct Function(IntrestStruct) updateFn,
  ) {
    intrest[index] = updateFn(_intrest[index]);
  }

  void insertAtIndexInIntrest(int index, IntrestStruct value) {
    intrest.insert(index, value);
  }

  List<LanguageStruct> _languages = [
    LanguageStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"English\",\"flag\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tesmy-8uyv36/assets/wwynihxm00m8/eng.png\"}')),
    LanguageStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Spanish\",\"flag\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tesmy-8uyv36/assets/h2yomrygbr4h/spn.png\"}')),
    LanguageStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"French\",\"flag\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/tesmy-8uyv36/assets/vmwyhnyncpjd/fr.png\"}'))
  ];
  List<LanguageStruct> get languages => _languages;
  set languages(List<LanguageStruct> value) {
    _languages = value;
  }

  void addToLanguages(LanguageStruct value) {
    languages.add(value);
  }

  void removeFromLanguages(LanguageStruct value) {
    languages.remove(value);
  }

  void removeAtIndexFromLanguages(int index) {
    languages.removeAt(index);
  }

  void updateLanguagesAtIndex(
    int index,
    LanguageStruct Function(LanguageStruct) updateFn,
  ) {
    languages[index] = updateFn(_languages[index]);
  }

  void insertAtIndexInLanguages(int index, LanguageStruct value) {
    languages.insert(index, value);
  }

  String _Apikey = '';
  String get Apikey => _Apikey;
  set Apikey(String value) {
    _Apikey = value;
    prefs.setString('ff_Apikey', value);
  }

  String _supabasekey =
      '';
  String get supabasekey => _supabasekey;
  set supabasekey(String value) {
    _supabasekey = value;
    prefs.setString('ff_supabasekey', value);
  }

  List<String> _grouppermision = [];
  List<String> get grouppermision => _grouppermision;
  set grouppermision(List<String> value) {
    _grouppermision = value;
  }

  void addToGrouppermision(String value) {
    grouppermision.add(value);
  }

  void removeFromGrouppermision(String value) {
    grouppermision.remove(value);
  }

  void removeAtIndexFromGrouppermision(int index) {
    grouppermision.removeAt(index);
  }

  void updateGrouppermisionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    grouppermision[index] = updateFn(_grouppermision[index]);
  }

  void insertAtIndexInGrouppermision(int index, String value) {
    grouppermision.insert(index, value);
  }

  List<String> _groupmember = [];
  List<String> get groupmember => _groupmember;
  set groupmember(List<String> value) {
    _groupmember = value;
  }

  void addToGroupmember(String value) {
    groupmember.add(value);
  }

  void removeFromGroupmember(String value) {
    groupmember.remove(value);
  }

  void removeAtIndexFromGroupmember(int index) {
    groupmember.removeAt(index);
  }

  void updateGroupmemberAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    groupmember[index] = updateFn(_groupmember[index]);
  }

  void insertAtIndexInGroupmember(int index, String value) {
    groupmember.insert(index, value);
  }

  LanguageStruct _selectedlaguead = LanguageStruct();
  LanguageStruct get selectedlaguead => _selectedlaguead;
  set selectedlaguead(LanguageStruct value) {
    _selectedlaguead = value;
    prefs.setString('ff_selectedlaguead', value.serialize());
  }

  void updateSelectedlagueadStruct(Function(LanguageStruct) updateFn) {
    updateFn(_selectedlaguead);
    prefs.setString('ff_selectedlaguead', _selectedlaguead.serialize());
  }

  String _theme = 'light';
  String get theme => _theme;
  set theme(String value) {
    _theme = value;
    prefs.setString('ff_theme', value);
  }

  VideoPostStruct _activeVideoPost = VideoPostStruct();
  VideoPostStruct get activeVideoPost => _activeVideoPost;
  set activeVideoPost(VideoPostStruct value) {
    _activeVideoPost = value;
  }

  void updateActiveVideoPostStruct(Function(VideoPostStruct) updateFn) {
    updateFn(_activeVideoPost);
  }

  bool _firstvisite = false;
  bool get firstvisite => _firstvisite;
  set firstvisite(bool value) {
    _firstvisite = value;
    prefs.setBool('ff_firstvisite', value);
  }

  List<HistoryStoriesStruct> _homestoris = [];
  List<HistoryStoriesStruct> get homestoris => _homestoris;
  set homestoris(List<HistoryStoriesStruct> value) {
    _homestoris = value;
  }

  void addToHomestoris(HistoryStoriesStruct value) {
    homestoris.add(value);
  }

  void removeFromHomestoris(HistoryStoriesStruct value) {
    homestoris.remove(value);
  }

  void removeAtIndexFromHomestoris(int index) {
    homestoris.removeAt(index);
  }

  void updateHomestorisAtIndex(
    int index,
    HistoryStoriesStruct Function(HistoryStoriesStruct) updateFn,
  ) {
    homestoris[index] = updateFn(_homestoris[index]);
  }

  void insertAtIndexInHomestoris(int index, HistoryStoriesStruct value) {
    homestoris.insert(index, value);
  }

  bool _ispaswordchange = false;
  bool get ispaswordchange => _ispaswordchange;
  set ispaswordchange(bool value) {
    _ispaswordchange = value;
    prefs.setBool('ff_ispaswordchange', value);
  }

  LatLng? _lastsync = LatLng(6.1329419, 6.7923994);
  LatLng? get lastsync => _lastsync;
  set lastsync(LatLng? value) {
    _lastsync = value;
    value != null
        ? prefs.setString('ff_lastsync', value.serialize())
        : prefs.remove('ff_lastsync');
  }

  LatLng? _dummylatlong = LatLng(6.1452777, 6.9048148);
  LatLng? get dummylatlong => _dummylatlong;
  set dummylatlong(LatLng? value) {
    _dummylatlong = value;
    value != null
        ? prefs.setString('ff_dummylatlong', value.serialize())
        : prefs.remove('ff_dummylatlong');
  }

  bool _isLocationOn = false;
  bool get isLocationOn => _isLocationOn;
  set isLocationOn(bool value) {
    _isLocationOn = value;
  }

  bool _hasLocationPermission = false;
  bool get hasLocationPermission => _hasLocationPermission;
  set hasLocationPermission(bool value) {
    _hasLocationPermission = value;
  }

  bool _newLocation = false;
  bool get newLocation => _newLocation;
  set newLocation(bool value) {
    _newLocation = value;
  }

  bool _isDataReady = false;
  bool get isDataReady => _isDataReady;
  set isDataReady(bool value) {
    _isDataReady = value;
  }

  List<LatLng> _Latlist = [];
  List<LatLng> get Latlist => _Latlist;
  set Latlist(List<LatLng> value) {
    _Latlist = value;
  }

  void addToLatlist(LatLng value) {
    Latlist.add(value);
  }

  void removeFromLatlist(LatLng value) {
    Latlist.remove(value);
  }

  void removeAtIndexFromLatlist(int index) {
    Latlist.removeAt(index);
  }

  void updateLatlistAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    Latlist[index] = updateFn(_Latlist[index]);
  }

  void insertAtIndexInLatlist(int index, LatLng value) {
    Latlist.insert(index, value);
  }

  List<dynamic> _searchstories = [];
  List<dynamic> get searchstories => _searchstories;
  set searchstories(List<dynamic> value) {
    _searchstories = value;
  }

  void addToSearchstories(dynamic value) {
    searchstories.add(value);
  }

  void removeFromSearchstories(dynamic value) {
    searchstories.remove(value);
  }

  void removeAtIndexFromSearchstories(int index) {
    searchstories.removeAt(index);
  }

  void updateSearchstoriesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    searchstories[index] = updateFn(_searchstories[index]);
  }

  void insertAtIndexInSearchstories(int index, dynamic value) {
    searchstories.insert(index, value);
  }

  String _googlemap =
      dotenv.env['GOOGLE_MAPS_API_KEY'] ?? 'AIzaSyCNyF_4rWlMxSss-KmGyLsDqZ96aSSOX20';
  String get googlemap => _googlemap;
  set googlemap(String value) {
    _googlemap = value;
    prefs.setString('ff_googlemap', value);
  }

  String _StoryDistance = '';
  String get StoryDistance => _StoryDistance;
  set StoryDistance(String value) {
    _StoryDistance = value;
  }

  String _StoryDuration = '';
  String get StoryDuration => _StoryDuration;
  set StoryDuration(String value) {
    _StoryDuration = value;
  }

  String _commentID = '';
  String get commentID => _commentID;
  set commentID(String value) {
    _commentID = value;
  }

  String _CommentToName = '';
  String get CommentToName => _CommentToName;
  set CommentToName(String value) {
    _CommentToName = value;
  }

  String _fcmToken = '';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  String _storyid = '';
  String get storyid => _storyid;
  set storyid(String value) {
    _storyid = value;
  }

  List<dynamic> _savedplace = [];
  List<dynamic> get savedplace => _savedplace;
  set savedplace(List<dynamic> value) {
    _savedplace = value;
  }

  void addToSavedplace(dynamic value) {
    savedplace.add(value);
  }

  void removeFromSavedplace(dynamic value) {
    savedplace.remove(value);
  }

  void removeAtIndexFromSavedplace(int index) {
    savedplace.removeAt(index);
  }

  void updateSavedplaceAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    savedplace[index] = updateFn(_savedplace[index]);
  }

  void insertAtIndexInSavedplace(int index, dynamic value) {
    savedplace.insert(index, value);
  }

  List<dynamic> _Newstories = [];
  List<dynamic> get Newstories => _Newstories;
  set Newstories(List<dynamic> value) {
    _Newstories = value;
    prefs.setStringList(
        'ff_Newstories', value.map((x) => jsonEncode(x)).toList());
  }

  void addToNewstories(dynamic value) {
    Newstories.add(value);
    prefs.setStringList(
        'ff_Newstories', _Newstories.map((x) => jsonEncode(x)).toList());
  }

  void removeFromNewstories(dynamic value) {
    Newstories.remove(value);
    prefs.setStringList(
        'ff_Newstories', _Newstories.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromNewstories(int index) {
    Newstories.removeAt(index);
    prefs.setStringList(
        'ff_Newstories', _Newstories.map((x) => jsonEncode(x)).toList());
  }

  void updateNewstoriesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    Newstories[index] = updateFn(_Newstories[index]);
    prefs.setStringList(
        'ff_Newstories', _Newstories.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInNewstories(int index, dynamic value) {
    Newstories.insert(index, value);
    prefs.setStringList(
        'ff_Newstories', _Newstories.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _cachepost = [];
  List<dynamic> get cachepost => _cachepost;
  set cachepost(List<dynamic> value) {
    _cachepost = value;
    prefs.setStringList(
        'ff_cachepost', value.map((x) => jsonEncode(x)).toList());
  }

  void addToCachepost(dynamic value) {
    cachepost.add(value);
    prefs.setStringList(
        'ff_cachepost', _cachepost.map((x) => jsonEncode(x)).toList());
  }

  void removeFromCachepost(dynamic value) {
    cachepost.remove(value);
    prefs.setStringList(
        'ff_cachepost', _cachepost.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromCachepost(int index) {
    cachepost.removeAt(index);
    prefs.setStringList(
        'ff_cachepost', _cachepost.map((x) => jsonEncode(x)).toList());
  }

  void updateCachepostAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    cachepost[index] = updateFn(_cachepost[index]);
    prefs.setStringList(
        'ff_cachepost', _cachepost.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInCachepost(int index, dynamic value) {
    cachepost.insert(index, value);
    prefs.setStringList(
        'ff_cachepost', _cachepost.map((x) => jsonEncode(x)).toList());
  }

  String _locationimage = '';
  String get locationimage => _locationimage;
  set locationimage(String value) {
    _locationimage = value;
    prefs.setString('ff_locationimage', value);
  }

  final _savedplacecatcheManager = StreamRequestManager<List<SavedPlacesRow>>();
  Stream<List<SavedPlacesRow>> savedplacecatche({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<SavedPlacesRow>> Function() requestFn,
  }) =>
      _savedplacecatcheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSavedplacecatcheCache() => _savedplacecatcheManager.clear();
  void clearSavedplacecatcheCacheKey(String? uniqueKey) =>
      _savedplacecatcheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
