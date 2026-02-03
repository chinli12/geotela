import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
  }) =>
      [enText, esText, frText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // changepassAuthenticationScreen
  {
    'f5j876l1': {
      'en': 'Create new password',
      'es': 'Crear nueva contraseña',
      'fr': 'Créer un nouveau mot de passe',
    },
    'p31it9pk': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'xmh1i8ju': {
      'en': 'Password (8+ characters)',
      'es': 'Contraseña (más de 8 caracteres)',
      'fr': 'Mot de passe (8 caractères ou plus)',
    },
    '8ln161ne': {
      'en': 'Must be 8+ characters',
      'es': 'Debe tener 8 o más caracteres',
      'fr': 'Doit comporter au moins 8 caractères',
    },
    'n6jwv9th': {
      'en': 'Confirm password',
      'es': 'Confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    '1f68eh1w': {
      'en': 'Password (8+ characters)',
      'es': 'Contraseña (más de 8 caracteres)',
      'fr': 'Mot de passe (8 caractères ou plus)',
    },
    'jmijpvcy': {
      'en': 'Must be 8+ characters',
      'es': 'Debe tener 8 o más caracteres',
      'fr': 'Doit comporter au moins 8 caractères',
    },
    '126yoo1w': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'tx7pgqvl': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LoginAuthenticationScreen
  {
    '8iqhrk6n': {
      'en': 'Welcome back 👋',
      'es': 'Bienvenido de nuevo 👋',
      'fr': 'Bienvenue à nouveau 👋',
    },
    '4x07w933': {
      'en': 'Email address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    'o318vmoy': {
      'en': 'Enter email address',
      'es': 'Introduzca su dirección de correo electrónico',
      'fr': 'Saisissez votre adresse e-mail',
    },
    '26na8llc': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '1f89xhfs': {
      'en': 'Password (8+ characters)',
      'es': 'Contraseña (más de 8 caracteres)',
      'fr': 'Mot de passe (8 caractères ou plus)',
    },
    'b7ic17ug': {
      'en': 'Remember me',
      'es': 'Acuérdate de mí',
      'fr': 'Souviens-toi de moi',
    },
    'dhld64l1': {
      'en': 'Forgot password?',
      'es': '¿Has olvidado tu contraseña?',
      'fr': 'Mot de passe oublié ?',
    },
    '20hlq0wv': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'c00cbame': {
      'en': 'Don\'t have an account? ',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    'd90jvfiq': {
      'en': 'Sign up here',
      'es': 'Regístrate aquí',
      'fr': 'Inscrivez-vous ici',
    },
    'x0db28hw': {
      'en': 'or continue with',
      'es': 'o continuar con',
      'fr': 'ou continuez avec',
    },
    '0c70xfbl': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // welcomeHome
  {
    'jtwfou13': {
      'en': 'Welcome to.',
      'es': 'Bienvenido a.',
      'fr': 'Bienvenue à.',
    },
    'lfu5ohxz': {
      'en': 'Welcome to Lagos, The Centre of Excellence.',
      'es': 'Bienvenido a Lagos, el centro de excelencia.',
      'fr': 'Bienvenue à Lagos, le centre d\'excellence.',
    },
    'g8c8gk1m': {
      'en': ' The Centre of Excellence.',
      'es': 'El Centro de Excelencia.',
      'fr': 'Le Centre d\'Excellence.',
    },
    'msuldtcj': {
      'en': 'Many amazing stories and facts to uncover here!!!',
      'es': '¡¡¡Muchas historias y hechos asombrosos por descubrir aquí!!!',
      'fr': 'De nombreuses histoires et faits étonnants à découvrir ici !!!',
    },
    'tiwsvsjy': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // CreateAuthenticationScreen
  {
    'fhnbu553': {
      'en': 'Create your account',
      'es': 'Crea tu cuenta',
      'fr': 'Créez votre compte',
    },
    '64otr27j': {
      'en': 'Username',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
    },
    'piwo3fzn': {
      'en': 'Enter Username',
      'es': 'Introducir nombre de usuario',
      'fr': 'Saisissez le nom d\'utilisateur',
    },
    '49u17rnq': {
      'en': 'Email address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    'm4xo662q': {
      'en': 'Enter email address',
      'es': 'Introduzca su dirección de correo electrónico',
      'fr': 'Saisissez votre adresse e-mail',
    },
    's98u02ez': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'ov851wox': {
      'en': 'Password (8+ characters)',
      'es': 'Contraseña (más de 8 caracteres)',
      'fr': 'Mot de passe (8 caractères ou plus)',
    },
    '7ghcnt61': {
      'en': 'Must be 8+ characters',
      'es': 'Debe tener 8 o más caracteres',
      'fr': 'Doit comporter au moins 8 caractères',
    },
    '2w1vqnfr': {
      'en': 'Confirm password',
      'es': 'Confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
    },
    'o604xeg7': {
      'en': 'Password (8+ characters)',
      'es': 'Contraseña (más de 8 caracteres)',
      'fr': 'Mot de passe (8 caractères ou plus)',
    },
    'c6mkfwxk': {
      'en': 'Must be 8+ characters',
      'es': 'Debe tener 8 o más caracteres',
      'fr': 'Doit comporter au moins 8 caractères',
    },
    '2qm6mlkk': {
      'en': 'I accept the ',
      'es': 'Acepto el',
      'fr': 'J\'accepte',
    },
    '73czq12u': {
      'en': 'terms',
      'es': 'términos',
      'fr': 'termes',
    },
    'csypgkwf': {
      'en': ' and ',
      'es': 'y',
      'fr': 'et',
    },
    '8iy912jt': {
      'en': ' privacy policy',
      'es': 'política de privacidad',
      'fr': 'politique de confidentialité',
    },
    'jtxd2gjf': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    '03rxp53x': {
      'en': 'Already have an account? ',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte ?',
    },
    'wymsf4kk': {
      'en': 'Sign in here',
      'es': 'Inicia sesión aquí',
      'fr': 'Connectez-vous ici',
    },
    '5zvba8r6': {
      'en': 'or continue with',
      'es': 'o continuar con',
      'fr': 'ou continuez avec',
    },
    'xsz0y0l7': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ForgotAuthenticationScreen
  {
    'i380739m': {
      'en': 'Forgot password',
      'es': 'Has olvidado tu contraseña',
      'fr': 'Mot de passe oublié',
    },
    'nxxrg3e8': {
      'en': 'Enter your email address',
      'es': 'Introduzca su dirección de correo electrónico',
      'fr': 'Saisissez votre adresse e-mail',
    },
    'b8b3orws': {
      'en': 'Email address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    'kc502mgy': {
      'en': 'Enter email address',
      'es': 'Introduzca su dirección de correo electrónico',
      'fr': 'Saisissez votre adresse e-mail',
    },
    '43xxoeei': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'bhdsjl1x': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // InterestSelectionInterface
  {
    '4rlusiep': {
      'en': 'Select your area of interest',
      'es': 'Seleccione su área de interés',
      'fr': 'Sélectionnez votre domaine d\'intérêt',
    },
    '5kro5r2g': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
    },
    'ra2oszul': {
      'en': 'Folklore',
      'es': 'Folklore',
      'fr': 'Folklore',
    },
    '9ghw3tym': {
      'en': 'Festivals',
      'es': 'Festivales',
      'fr': 'Festivals',
    },
    'zd4qyvx7': {
      'en': 'Adventure',
      'es': 'Aventura',
      'fr': 'Aventure',
    },
    '4subwvpg': {
      'en': 'Art & Culture',
      'es': 'Arte y cultura',
      'fr': 'Art et culture',
    },
    'k6nmgm8k': {
      'en': 'Architecture',
      'es': 'Arquitectura',
      'fr': 'Architecture',
    },
    '593kghbw': {
      'en': 'Food & Cuisine',
      'es': 'Comida y cocina',
      'fr': 'Nourriture et cuisine',
    },
    '8viux8j7': {
      'en': 'Nature',
      'es': 'Naturaleza',
      'fr': 'Nature',
    },
    'hs9lfm5s': {
      'en': 'Local Traditions',
      'es': 'Tradiciones locales',
      'fr': 'Traditions locales',
    },
    'ze08042a': {
      'en': 'Travel Tips',
      'es': 'Consejos de viaje',
      'fr': 'Conseils de voyage',
    },
    'e9sdp3d2': {
      'en': 'Wildlife',
      'es': 'Fauna',
      'fr': 'Faune',
    },
    'dpq5b2mk': {
      'en': 'Real Estate',
      'es': 'Bienes raíces',
      'fr': 'Immobilier',
    },
    'rgaqbswd': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'miust3dn': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LanguageSelectionScreen
  {
    'wlhsexpt': {
      'en': 'Choose a Language',
      'es': 'Elija un idioma',
      'fr': 'Choisissez une langue',
    },
    'g0alymg5': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'hhx5y5q7': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LocationPermissionRequestScreen
  {
    'xwths6a0': {
      'en': 'Allow your location',
      'es': 'Permitir su ubicación',
      'fr': 'Autorisez votre emplacement',
    },
    'bdd8hyfq': {
      'en':
          'we\'ll use your location to recommend stories and landmarks that are close to you',
      'es':
          'Usaremos tu ubicación para recomendarte historias y lugares de interés cercanos a ti.',
      'fr':
          'Nous utiliserons votre localisation pour vous recommander des articles et des lieux d\'intérêt à proximité de chez vous.',
    },
    '1qmh8tql': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'h2o6ws5r': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'uk3cqjif': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    '4tf14xgm': {
      'en': 'Maybe Later',
      'es': 'Quizás más tarde',
      'fr': 'Peut-être plus tard',
    },
    'ilinlq7v': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // onboarding
  {
    '472om23m': {
      'en': 'Welcome to GeoTela',
      'es': 'Bienvenido a GeoTela',
      'fr': 'Bienvenue sur GeoTela',
    },
    'rkq9sg7m': {
      'en':
          'Discover the stories hidden in every land! Tap to set your preferences and dive into GeoTela’s world of exploration.\"',
      'es':
          '¡Descubre las historias que se esconden en cada territorio! Toca para configurar tus preferencias y sumérgete en el mundo de exploración de GeoTela.',
      'fr':
          'Découvrez les histoires cachées dans chaque pays ! Appuyez pour définir vos préférences et plongez dans le monde d\'exploration de GeoTela.',
    },
    '84ojvmvm': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'nu77dmr8': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Passwordsucess
  {
    'ftddrke2': {
      'en': 'Password created',
      'es': 'Contraseña creada',
      'fr': 'Mot de passe créé',
    },
    'gicv9eq7': {
      'en': 'Your password has been created',
      'es': 'Su contraseña ha sido creada',
      'fr': 'Votre mot de passe a été créé',
    },
    'lwi4cw4l': {
      'en': 'Back to Login',
      'es': 'Volver al inicio de sesión',
      'fr': 'Retour à la connexion',
    },
    '33rihbd9': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // splas
  {
    'g74dsk4a': {
      'en': 'this will take little time',
      'es': '',
      'fr': '',
    },
    'crpiv395': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // WelcomeScreenWithCharacter
  {
    'f1d4kt3p': {
      'en': 'Hey ',
      'es': 'Ey',
      'fr': 'Hé',
    },
    '26xyl3xx': {
      'en': ' i\'m Tela. Let\'s explore ',
      'es': 'Soy Tela. Vamos a explorar.',
      'fr': 'Je suis Tela. Partons à la découverte !',
    },
    'fkyndm7r': {
      'en': ' together!',
      'es': '¡juntos!',
      'fr': 'ensemble!',
    },
    '8oi0ofs8': {
      'en': 'Hey Josh! i\'m Joe. Let\'s explore Lagos together!!!',
      'es': '¡Hola Josh! Soy Joe. ¡Exploremos Lagos juntos!',
      'fr': 'Salut Josh ! C\'est Joe. Partons explorer Lagos ensemble !!!',
    },
    'n58bpy1z': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
    'yd0auxcb': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // botchat
  {
    't9ahhlo3': {
      'en': 'Tela',
      'es': 'Tela',
      'fr': 'Tela',
    },
    '19eln65f': {
      'en': 'Tela',
      'es': 'Tela',
      'fr': 'Tela',
    },
    '0bfv3niu': {
      'en': 'Reply ...',
      'es': 'Responder ...',
      'fr': 'Répondre ...',
    },
    'vcy0ywzm': {
      'en': 'Tela',
      'es': '',
      'fr': '',
    },
    'slc8s948': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Homescreen
  {
    'vqrdf1vi': {
      'en': 'Login Daily to view challenges and earn points',
      'es': 'Inicie sesión diariamente para ver desafíos y ganar puntos.',
      'fr':
          'Connectez-vous quotidiennement pour consulter les défis et gagner des points',
    },
    'o6s16soa': {
      'en': 'Start Challenge',
      'es': 'Iniciar desafío',
      'fr': 'Défi de démarrage',
    },
    '063tggi3': {
      'en': 'Places to Explore',
      'es': '',
      'fr': '',
    },
    'je7oqq2d': {
      'en': 'View All',
      'es': '',
      'fr': '',
    },
    '9zpgeai2': {
      'en': 'Searching for stories...',
      'es': '',
      'fr': '',
    },
    'vy6ltdiy': {
      'en': '?',
      'es': '?',
      'fr': '?',
    },
    'sj41czpq': {
      'en': 'H',
      'es': 'H',
      'fr': 'H',
    },
    'a8ourdnq': {
      'en': 'I',
      'es': 'I',
      'fr': 'je',
    },
    'mhvdwe3k': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // NotificationListView
  {
    '84y2vsym': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'f02vie0s': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    'ubixgehf': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    'tyfqs3wh': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    'j7k5gxlh': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    'qh45er9c': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    'st1h9p3s': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    'f4habsl1': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    '3gq5l56g': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    'eai6tqyn': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    'ofr3ueqw': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    '7qfjiqm6': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    'h9p8rsf9': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    'hslsgkde': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    'mr0ivdx0': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    '6kigc9jy': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    'q5btx5hi': {
      'en': 'Unread',
      'es': 'No leído',
      'fr': 'Non lu',
    },
    '9b8l3zp4': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    'y0vimqie': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    '4hx84zbu': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    '19katie2': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    'lwysw8j6': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    '36vv8rnr': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    'sais5vs2': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    'zhsdas4w': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    'isfafn41': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    '11pjxutz': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    'aj9wpo60': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    'w0hbwiny': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    'hp2m7fb0': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    '22anne1p': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    'yznupxuv': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    '3hx113kv': {
      'en': 'Read',
      'es': 'Leer',
      'fr': 'Lire',
    },
    '0itym8kq': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    '47dfylps': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    'j3sog89r': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    'lmhf457n': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    '3szjifz9': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    'bfjxng63': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    '960vwszo': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    '26leg4lg': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    'zhlb15fj': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    '8qxpjv9u': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    'w75ur2v1': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    '2bleumep': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    'zfvh51on': {
      'en': 'Successful Trip',
      'es': 'Viaje exitoso',
      'fr': 'Voyage réussi',
    },
    'm518hf6k': {
      'en': '23 min',
      'es': '23 minutos',
      'fr': '23 min',
    },
    '14r31i9j': {
      'en':
          'Yayyy! you just succesfully created your trip to zanzibarr ou just succesfully created your trip to zanzibarr',
      'es':
          '¡Sí! Acabas de crear con éxito tu viaje a Zanzíbar. Acabas de crear con éxito tu viaje a Zanzíbar.',
      'fr': 'Hourra ! Vous avez réussi à créer votre voyage à Zanzibar !',
    },
    'ohp5i8xn': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // PlacesToExploreList
  {
    'q76r0x4r': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // QuizQuestionInterface
  {
    '9bc6t6mb': {
      'en': 'Question ',
      'es': 'Pregunta',
      'fr': 'Question',
    },
    'wy55pmru': {
      'en': '/',
      'es': '/',
      'fr': '/',
    },
    '1q7z04d8': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
    },
    'hi622kmd': {
      'en': 'The answer is 1',
      'es': 'La respuesta es 1',
      'fr': 'La réponse est 1',
    },
    'jdev25g7': {
      'en': 'Next',
      'es': 'Próximo',
      'fr': 'Suivant',
    },
    'bswxdmi2': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // quizzpoint
  {
    'j1hya6r4': {
      'en': 'Keep Exploring',
      'es': 'Sigue explorando',
      'fr': 'Continuez à explorer',
    },
    'gbql0fwk': {
      'en': 'Awesome!  ',
      'es': '¡Impresionante!',
      'fr': 'Génial!',
    },
    '0cojifyo': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
    },
    'sl4e3cv1': {
      'en': 'You just got ',
      'es': 'Acabas de conseguir',
      'fr': 'Vous venez de recevoir',
    },
    'j0y5mod5': {
      'en': ' points',
      'es': 'agujas',
      'fr': 'points',
    },
    'vf3tlq84': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
    },
    'xb0na5pt': {
      'en': 'Explore more locations to accumulate more points',
      'es': 'Explora más ubicaciones para acumular más puntos',
      'fr': 'Explorez davantage de lieux pour accumuler plus de points',
    },
    '7m3ts015': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
    },
    '3k54uezm': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // savestory
  {
    'pitrphp7': {
      'en': 'Back to Stories',
      'es': 'Volver a Historias',
      'fr': 'Retour aux histoires',
    },
    'ig2lqdyz': {
      'en': 'Back to Map',
      'es': 'Volver al mapa',
      'fr': 'Retour à la carte',
    },
    'qyrbjnzo': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Search
  {
    'ng399wya': {
      'en': 'fetching stories for the location',
      'es': '',
      'fr': '',
    },
    'du65x8rd': {
      'en': 'Search',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    '5qrylom8': {
      'en': 'Search location',
      'es': 'Puente de la Libertad |',
      'fr': 'Pont de la Liberté |',
    },
    'fxxwskvt': {
      'en': 'your location',
      'es': 'Puente de la Libertad |',
      'fr': 'Pont de la Liberté |',
    },
    'tlqpn7n6': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // storyDetailView
  {
    'geuuhlds': {
      'en': 'Read out Loud',
      'es': 'Leer en voz alta',
      'fr': 'Lire à voix haute',
    },
    'ikpq158u': {
      'en': 'Take Quiz (+500 xp)',
      'es': 'Realizar el cuestionario (+500 XP)',
      'fr': 'Répondre au quiz (+500 xp)',
    },
    'ltm6hdjx': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // storyDetailViewFocuse
  {
    '08rbtzlx': {
      'en': 'Read out Loud',
      'es': 'Leer en voz alta',
      'fr': 'Lire à voix haute',
    },
    '6teh395f': {
      'en': 'Take Quiz (+500 xp)',
      'es': 'Realizar el cuestionario (+500 XP)',
      'fr': 'Répondre au quiz (+500 xp)',
    },
    '55ubfz8s': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // StoryMap
  {
    'pa4i6tl7': {
      'en': 'Modes',
      'es': 'Modos',
      'fr': 'Modes',
    },
    '9shvh4kh': {
      'en': 'Search Stories',
      'es': '',
      'fr': '',
    },
    'f0jrqs0o': {
      'en': 'Read',
      'es': 'Leer',
      'fr': 'Lire',
    },
    '5qhyjyhe': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // ExploreActivityList
  {
    'o777yl6v': {
      'en': 'Explore',
      'es': 'Explorar',
      'fr': 'Explorer',
    },
    '5utnomk2': {
      'en': 'Search',
      'es': 'Buscar',
      'fr': 'Recherche',
    },
    'wv7og716': {
      'en': 'Hunts',
      'es': 'Caza',
      'fr': 'Chasse',
    },
    'ybcx35vn': {
      'en': 'Trip',
      'es': 'Viaje',
      'fr': 'Voyage',
    },
    'qv5ix418': {
      'en': 'Places',
      'es': 'Lugares',
      'fr': 'Lieux',
    },
    'yvuavuyh': {
      'en': 'History',
      'es': 'Lugares',
      'fr': 'Lieux',
    },
    'lnb18wre': {
      'en': 'Mystery',
      'es': 'Lugares',
      'fr': 'Lieux',
    },
    'xgg5wawp': {
      'en': 'Culture',
      'es': 'Lugares',
      'fr': 'Lieux',
    },
    'zuufmg14': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Hunt
  {
    'dmlkwrg9': {
      'en': 'Explor',
      'es': 'Explorar',
      'fr': 'Explor',
    },
    'tl1c6j0i': {
      'en': 'Finding Hunt near you...',
      'es': 'Encontrando Hunt cerca de ti...',
      'fr': 'Trouver une chasse près de chez vous...',
    },
    '25imywj7': {
      'en': 'Welcome to Scavenger Hunt',
      'es': 'Bienvenido a la búsqueda del tesoro',
      'fr': 'Bienvenue à la chasse au trésor',
    },
    'bphe6v82': {
      'en':
          'Discover challenges near you and answer all tasks and quizes from the location',
      'es':
          'Descubre desafíos cerca de ti y responde todas las tareas y cuestionarios desde la ubicación',
      'fr':
          'Découvrez les défis près de chez vous et répondez à toutes les tâches et quiz depuis le lieu même.',
    },
    'sem2z5do': {
      'en': 'Discover stories, places and adventures',
      'es': 'Descubre historias, lugares y aventuras.',
      'fr': 'Découvrez des histoires, des lieux et des aventures',
    },
    'lyvuucbz': {
      'en': 'Sports',
      'es': 'Deportes',
      'fr': 'Sportif',
    },
    '95vrljbl': {
      'en': 'Mystery',
      'es': 'Misterio',
      'fr': 'Mystère',
    },
    '5u1wdfuv': {
      'en': 'Technology',
      'es': 'Tecnología',
      'fr': 'Technologie',
    },
    'kvdyypnv': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
    },
    '2toc92vh': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Trip
  {
    'b0bx29gx': {
      'en': 'Your Trips',
      'es': 'Tus viajes',
      'fr': 'Vos voyages',
    },
    '7f47s07q': {
      'en': '3/7 locations visited',
      'es': '3/7 lugares visitados',
      'fr': '3/7 lieux visités',
    },
    'dx0s619m': {
      'en': '/',
      'es': '/',
      'fr': '/',
    },
    'omd2v0pq': {
      'en': ' locations visited',
      'es': 'lugares visitados',
      'fr': 'lieux visités',
    },
    '7j55oul1': {
      'en': '3/7 locations visited',
      'es': '3/7 lugares visitados',
      'fr': '3/7 lieux visités',
    },
    'zyzvmnxq': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '5g528ulv': {
      'en': 'Continue Trip',
      'es': 'Continuar viaje',
      'fr': 'Poursuivre le voyage',
    },
    'pdd0eb7u': {
      'en': 'National Museum of Cameroon',
      'es': 'Museo Nacional de Camerún',
      'fr': 'Musée national du Cameroun',
    },
    '8cijvzi4': {
      'en': '3/7 locations visited',
      'es': '3/7 lugares visitados',
      'fr': '3/7 lieux visités',
    },
    '9f8ydlev': {
      'en': '43% complete',
      'es': '43% completado',
      'fr': '43 % terminé',
    },
    'afv7e504': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'zpj1hlh3': {
      'en': 'Continue Trip',
      'es': 'Continuar viaje',
      'fr': 'Poursuivre le voyage',
    },
    'lvouo6lw': {
      'en': 'All Trips',
      'es': 'Todos los viajes',
      'fr': 'Tous les voyages',
    },
    '4kobfugz': {
      'en': '550',
      'es': '550',
      'fr': '550',
    },
    't74s09jd': {
      'en': 'My Trips',
      'es': 'Mis viajes',
      'fr': 'Mes voyages',
    },
    'zph8i5gt': {
      'en': '550',
      'es': '550',
      'fr': '550',
    },
    'esgk6qou': {
      'en': 'All Trips',
      'es': 'Todos los viajes',
      'fr': 'Tous les voyages',
    },
    '153eqvma': {
      'en': 'My Trips',
      'es': 'Mis viajes',
      'fr': 'Mes voyages',
    },
    'en1jdsv7': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // huntDetailView
  {
    'gkw5aej3': {
      'en': 'Start Hunt',
      'es': 'Iniciar la caza',
      'fr': 'Début de la chasse',
    },
    'rxt2r13x': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // tripcreation
  {
    '6hjobwkt': {
      'en': 'Trip Title',
      'es': 'Título del viaje',
      'fr': 'Titre du voyage',
    },
    'j6kmpwkr': {
      'en': 'Enter Trip Title ',
      'es': 'Ingrese el título del viaje',
      'fr': 'Saisissez le titre du voyage',
    },
    '92lvr7v1': {
      'en': 'Location',
      'es': 'Ubicación',
      'fr': 'Emplacement',
    },
    'd2pw1kia': {
      'en': 'Enter Location',
      'es': 'Introducir ubicación',
      'fr': 'Saisir l\'emplacement',
    },
    'yr906yh5': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'ty62x1yx': {
      'en': 'What kind of trip are you looking for? (Optional)',
      'es': '¿Qué tipo de viaje buscas? (Opcional)',
      'fr': 'Quel type de voyage recherchez-vous ? (Facultatif)',
    },
    'kbwbigr9': {
      'en':
          'Trip Prompt examples, cultural experiences with museums,Adventure activities, or leave for blank surprises',
      'es':
          'Ejemplos de viajes rápidos, experiencias culturales con museos, actividades de aventura o dejarse llevar por las sorpresas.',
      'fr':
          'Exemples de suggestions de voyage : expériences culturelles avec des musées, activités d’aventure, ou laissez place à la surprise.',
    },
    '53vn92rs': {
      'en': 'Share',
      'es': 'Compartir',
      'fr': 'Partager',
    },
    '2c18uyfj': {
      'en': 'Public',
      'es': 'Público',
      'fr': 'Publique',
    },
    'dd8lvs2g': {
      'en': 'Select...',
      'es': 'Seleccionar...',
      'fr': 'Sélectionner...',
    },
    'njytdsoy': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'uk1thdy2': {
      'en': 'Public',
      'es': 'Público',
      'fr': 'Publique',
    },
    'be3e0g7c': {
      'en': 'private',
      'es': 'privado',
      'fr': 'privé',
    },
    'szqbz2zc': {
      'en': 'Create Trip',
      'es': 'Crear viaje',
      'fr': 'Créer un voyage',
    },
    '6dnc6pcv': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Tripdetails
  {
    'l9h2kg3r': {
      'en': '550',
      'es': '550',
      'fr': '550',
    },
    'ebbxf5vu': {
      'en': 'Locations to visit',
      'es': 'Lugares para visitar',
      'fr': 'Lieux à visiter',
    },
  },
  // Stories
  {
    'my0vejkp': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // storyDetailViewstories
  {
    'w3bynr89': {
      'en': 'Read out Loud',
      'es': 'Leer en voz alta',
      'fr': 'Lire à voix haute',
    },
    '8x0bmhti': {
      'en': 'Delete',
      'es': 'Guardado',
      'fr': 'Enregistré',
    },
    '519kkwp0': {
      'en': 'Take Quiz (+500 xp)',
      'es': 'Realizar el cuestionario (+500 XP)',
      'fr': 'Répondre au quiz (+500 xp)',
    },
    'fq6vnwg6': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // StoryMapstories
  {
    'cjdkp9i0': {
      'en': 'search',
      'es': '',
      'fr': '',
    },
    'hwaiw8fk': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // storyDetailViewFocusestories
  {
    '2bs5q95n': {
      'en': 'Read out Loud',
      'es': 'Leer en voz alta',
      'fr': 'Lire à voix haute',
    },
    'oklkjtfa': {
      'en': 'Saved',
      'es': 'Guardado',
      'fr': 'Enregistré',
    },
    '0sqlw0xo': {
      'en': 'Take Quiz (+500 xp)',
      'es': 'Realizar el cuestionario (+500 XP)',
      'fr': 'Répondre au quiz (+500 xp)',
    },
    'ol4z0q61': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // QuizQuestionInterfacestories
  {
    'yt9qkq8c': {
      'en': 'Question ',
      'es': 'Pregunta',
      'fr': 'Question',
    },
    '0gvi7och': {
      'en': '/',
      'es': '/',
      'fr': '/',
    },
    '6drndwec': {
      'en': 'Hello World',
      'es': 'Hola Mundo',
      'fr': 'Bonjour le monde',
    },
    '48ad282r': {
      'en': 'The answer is 1',
      'es': 'La respuesta es 1',
      'fr': 'La réponse est 1',
    },
    '9cuqcfem': {
      'en': 'Next',
      'es': 'Próximo',
      'fr': 'Suivant',
    },
    'q4jiyjne': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Community
  {
    'oz9vnk4n': {
      'en': 'Post',
      'es': '',
      'fr': '',
    },
    'e2bhvtba': {
      'en': 'Explore',
      'es': 'Explorar',
      'fr': 'Explorer',
    },
    'k1id056f': {
      'en': 'Groups',
      'es': 'Grupos',
      'fr': 'Groupes',
    },
    'odc1923j': {
      'en': 'Events',
      'es': 'Eventos',
      'fr': 'Événements',
    },
    'glg4t4ed': {
      'en': 'Reels',
      'es': 'Bobinas',
      'fr': 'Bobines',
    },
  },
  // PostCreation
  {
    'd2q50753': {
      'en': 'post title',
      'es': 'título de la publicación',
      'fr': 'titre du message',
    },
    'd37qod2a': {
      'en': 'Post title',
      'es': 'Título de la publicación',
      'fr': 'Titre du poste',
    },
    'wejqxzcs': {
      'en': 'write post',
      'es': 'escribir publicación',
      'fr': 'écrire un article',
    },
    'awdm5rd0': {
      'en': 'Write Post',
      'es': 'Escribir publicación',
      'fr': 'Écrire un article',
    },
    '8nuw8anr': {
      'en': 'post image',
      'es': 'título de la publicación',
      'fr': 'titre du message',
    },
    'evic8rx8': {
      'en': 'Create Post',
      'es': '',
      'fr': '',
    },
  },
  // Group
  {
    '98dzbefe': {
      'en': 'Search',
      'es': '',
      'fr': '',
    },
    'gvn1y9j3': {
      'en': 'All Groups',
      'es': 'Todos los grupos',
      'fr': 'Tous les groupes',
    },
    'h03rcmhc': {
      'en': 'My Groups',
      'es': 'Mis grupos',
      'fr': 'Mes groupes',
    },
    '6qmub0ed': {
      'en': 'Sports',
      'es': 'Deportes',
      'fr': 'Sportif',
    },
    'kvgmivxa': {
      'en': 'Mystery',
      'es': 'Misterio',
      'fr': 'Mystère',
    },
    '1sdte5rt': {
      'en': 'Technology',
      'es': 'Tecnología',
      'fr': 'Technologie',
    },
    '1o20zal2': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
    },
  },
  // GroupOverview
  {
    'v1kxzbd3': {
      'en': 'Group',
      'es': 'Grupo',
      'fr': 'Groupe',
    },
    '4ap7re44': {
      'en': 'Edit',
      'es': 'Editar',
      'fr': 'Modifier',
    },
    'pi8unh35': {
      'en': 'Posts',
      'es': 'Publicaciones',
      'fr': 'Messages',
    },
    'fi9b714g': {
      'en': 'About',
      'es': 'Acerca de',
      'fr': 'À propos',
    },
    'h6iw9z8i': {
      'en': 'Group Info',
      'es': 'Información del grupo',
      'fr': 'Informations sur le groupe',
    },
    '9s282fmh': {
      'en': 'Created ',
      'es': 'Creado',
      'fr': 'Créé',
    },
    'bt7unmcc': {
      'en': 'Created 26 August 2025 by\n@toyehikes',
      'es': 'Creado el 26 de agosto de 2025 por @toyehikes',
      'fr': 'Créé le 26 août 2025 par\n@toyehikes',
    },
    '7yfkke7a': {
      'en': 'By',
      'es': 'Por',
      'fr': 'Par',
    },
    '6re32oet': {
      'en': 'Created 26 August 2025 by\n@toyehikes',
      'es': 'Creado el 26 de agosto de 2025 por @toyehikes',
      'fr': 'Créé le 26 août 2025 par\n@toyehikes',
    },
    'ap815xmm': {
      'en': 'Moderators',
      'es': 'Moderadores',
      'fr': 'Modérateurs',
    },
    '2vdx0z6f': {
      'en': '1 Moderators',
      'es': '1 Moderadores',
      'fr': '1 Modérateurs',
    },
    '3q95klak': {
      'en': 'Members',
      'es': 'Miembros',
      'fr': 'Membres',
    },
  },
  // PermissionsManagement
  {
    'obwlz1gm': {
      'en': 'Only community member can post like or share',
      'es':
          'Sólo los miembros de la comunidad pueden publicar, dar me gusta o compartir.',
      'fr':
          'Seuls les membres de la communauté peuvent publier, aimer ou partager.',
    },
    '7k5moka9': {
      'en': 'Members can send new message',
      'es': 'Los miembros pueden enviar mensajes nuevos',
      'fr': 'Les membres peuvent envoyer un nouveau message',
    },
    'qyuap1tg': {
      'en': 'Members can add new members',
      'es': 'Los miembros pueden agregar nuevos miembros',
      'fr': 'Les membres peuvent ajouter de nouveaux membres',
    },
    'oaylp1hs': {
      'en': 'Add New',
      'es': 'Agregar nuevo',
      'fr': 'Ajouter un nouveau',
    },
    '6zgrwo60': {
      'en': 'Enter new permission',
      'es': 'Introducir nuevo permiso',
      'fr': 'Saisir une nouvelle autorisation',
    },
    '2wpmq6i3': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
  },
  // MemberList
  {
    '81w5e9b6': {
      'en': 'Moderators (2)',
      'es': 'Moderadores (2)',
      'fr': 'Modérateurs (2)',
    },
    'w6p5c3h2': {
      'en': 'Krushluv Doe',
      'es': 'Krushluv Doe',
      'fr': 'Krushluv Doe',
    },
    'l6v0jvff': {
      'en': 'Krushluv Doe',
      'es': 'Krushluv Doe',
      'fr': 'Krushluv Doe',
    },
  },
  // GroupCreationForm
  {
    'co67cxnr': {
      'en': 'Group Name',
      'es': 'Nombre del grupo',
      'fr': 'Nom du groupe',
    },
    'x6n46sec': {
      'en': 'Event Description',
      'es': 'Descripción del evento',
      'fr': 'Description de l\'événement',
    },
    '81l9j9gj': {
      'en': 'Sports',
      'es': '',
      'fr': '',
    },
    'ifb7u6bb': {
      'en': 'select catigory',
      'es': '',
      'fr': '',
    },
    '3lu3nne1': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    '0q7nxdfi': {
      'en': 'Sports',
      'es': '',
      'fr': '',
    },
    'bw5ijbkr': {
      'en': 'Mystery',
      'es': '',
      'fr': '',
    },
    'w4b9oacz': {
      'en': 'Technology',
      'es': '',
      'fr': '',
    },
    'nrkv4296': {
      'en': 'History',
      'es': '',
      'fr': '',
    },
    'yii2orqm': {
      'en': 'Add at least 1 member',
      'es': 'Añade al menos 1 miembro',
      'fr': 'Ajoutez au moins 1 membre',
    },
    '8xetoe4e': {
      'en': 'Permissions',
      'es': 'Permisos',
      'fr': 'Autorisations',
    },
    'c33jpaim': {
      'en': 'public',
      'es': 'Público',
      'fr': 'Publique',
    },
    'oo8jqqln': {
      'en': 'public',
      'es': 'Público',
      'fr': 'Publique',
    },
    'iv8qnt6b': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'vix8v4xm': {
      'en': 'public',
      'es': 'Público',
      'fr': 'Publique',
    },
    'qp1eaugu': {
      'en': 'private',
      'es': 'Privado',
      'fr': 'Privé',
    },
    '8e4qefsr': {
      'en': 'Upload Group Image',
      'es': 'Subir imagen de grupo',
      'fr': 'Télécharger une image de groupe',
    },
    'yq24jqpj': {
      'en': 'Continue',
      'es': 'Continuar',
      'fr': 'Continuer',
    },
  },
  // EventListingPage
  {
    'ddr0dvpx': {
      'en': '500',
      'es': '500',
      'fr': '500',
    },
    'da8v3s4x': {
      'en': '500',
      'es': '500',
      'fr': '500',
    },
    'oq2fxltk': {
      'en': '500',
      'es': '500',
      'fr': '500',
    },
    '6vj8mci3': {
      'en': '500',
      'es': '500',
      'fr': '500',
    },
    '3xdfzht0': {
      'en': 'Search',
      'es': '',
      'fr': '',
    },
    'kdx65sck': {
      'en': 'All Events',
      'es': 'Todos los eventos',
      'fr': 'Tous les événements',
    },
    'yoogoyvh': {
      'en': 'My Events',
      'es': 'Mis eventos',
      'fr': 'Mes événements',
    },
    'iu4atclv': {
      'en': 'Sports',
      'es': 'Deportes',
      'fr': 'Sportif',
    },
    'wvvuwi4y': {
      'en': 'Mystery',
      'es': 'Misterio',
      'fr': 'Mystère',
    },
    's8lxslpt': {
      'en': 'Technology',
      'es': 'Tecnología',
      'fr': 'Technologie',
    },
    'y7fjd8b4': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
    },
  },
  // EventDetailsOverview
  {
    'x85hwsmf': {
      'en': 'Event Action',
      'es': 'Acción del evento',
      'fr': 'Action événementielle',
    },
    'hotcyg12': {
      'en': '500',
      'es': '500',
      'fr': '500',
    },
    '4l8b99jv': {
      'en': 'Attendees',
      'es': 'Asistentes',
      'fr': 'Participants',
    },
    'zkpz61a8': {
      'en': 'About Event',
      'es': 'Acerca del evento',
      'fr': 'À propos de l\'événement',
    },
    '1qzmurgx': {
      'en': 'Cancel Event',
      'es': 'Cancelar evento',
      'fr': 'Annulation de l\'événement',
    },
  },
  // EventCreationForm
  {
    'i7lmdygn': {
      'en': 'Event Name',
      'es': 'Nombre del evento',
      'fr': 'Nom de l\'événement',
    },
    'puken5vr': {
      'en': 'Event Description',
      'es': 'Descripción del evento',
      'fr': 'Description de l\'événement',
    },
    'hf4dt0mw': {
      'en': 'Sports',
      'es': '',
      'fr': '',
    },
    'h68slw1e': {
      'en': 'select catigory',
      'es': '',
      'fr': '',
    },
    'bmqoyjid': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'y43ky9oa': {
      'en': 'Sports',
      'es': '',
      'fr': '',
    },
    'skd1vgip': {
      'en': 'Mystery',
      'es': '',
      'fr': '',
    },
    'lnxbspl8': {
      'en': 'Technology',
      'es': '',
      'fr': '',
    },
    'j6jy5ptc': {
      'en': 'History',
      'es': '',
      'fr': '',
    },
    'wk1ohtfk': {
      'en': 'Select Location',
      'es': 'Seleccionar ubicación',
      'fr': 'Sélectionner l\'emplacement',
    },
    'zeh4vna9': {
      'en': 'Upload Event Image',
      'es': 'Subir imagen del evento',
      'fr': 'Télécharger une image de l\'événement',
    },
    '9amdjh6z': {
      'en': 'Create Event',
      'es': 'Crear evento',
      'fr': 'Créer un événement',
    },
  },
  // Reals
  {
    '9yydatdq': {
      'en': 'Reels',
      'es': 'Bobinas',
      'fr': 'Bobines',
    },
    'ndlfjoqy': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // MemberListAdd
  {
    'fraspx09': {
      'en': 'Members (4)',
      'es': 'Miembros (4)',
      'fr': 'Membres (4)',
    },
    'edsp55g3': {
      'en': 'Krushluv Doe',
      'es': 'Krushluv Doe',
      'fr': 'Krushluv Doe',
    },
    'z3sfityq': {
      'en': 'Add',
      'es': 'Agregar',
      'fr': 'Ajouter',
    },
  },
  // PostReel
  {
    '5ehdlque': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
    },
    'ydzy56qk': {
      'en': 'Create Reel',
      'es': 'Crear Reel',
      'fr': 'Créer une bobine',
    },
  },
  // Profiles
  {
    'q2eyu4oa': {
      'en': 'Achievements',
      'es': 'Logros',
      'fr': 'Réalisations',
    },
    '7uliell6': {
      'en': 'Stories',
      'es': 'Historias',
      'fr': 'Histoires',
    },
    'kpob2uhr': {
      'en': 'Reels',
      'es': 'Bobinas',
      'fr': 'Bobines',
    },
    'zwhxa7r8': {
      'en': 'Stories',
      'es': 'Historias',
      'fr': 'Histoires',
    },
    'ezc4l4yo': {
      'en': 'Following',
      'es': 'Siguiente',
      'fr': 'Suivant',
    },
    '3341t1dv': {
      'en': 'Followers',
      'es': 'Seguidores',
      'fr': 'Abonnés',
    },
    'fy8o05wn': {
      'en': 'Settings',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
    'd4suodaz': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Setting
  {
    '6fegcpi9': {
      'en': 'ACTIVITY',
      'es': 'ACTIVIDAD',
      'fr': 'ACTIVITÉ',
    },
    'gg8wvcvj': {
      'en': 'Streaks',
      'es': 'Manchas',
      'fr': 'Traces',
    },
    'k9ol565y': {
      'en': 'Challenges',
      'es': 'Desafíos',
      'fr': 'Défis',
    },
    '9ky5i9lf': {
      'en': 'Leaderboard',
      'es': 'Tabla de clasificación',
      'fr': 'Classement',
    },
    '5jvf9jcq': {
      'en': 'Achievements',
      'es': 'Logros',
      'fr': 'Réalisations',
    },
    '9d23xhyq': {
      'en': 'PREFERENCES',
      'es': 'PREFERENCIAS',
      'fr': 'PRÉFÉRENCES',
    },
    'ni5l8tps': {
      'en': 'Language',
      'es': 'Idioma',
      'fr': 'Langue',
    },
    'x4df3r1r': {
      'en': 'Theme',
      'es': 'Tema',
      'fr': 'Thème',
    },
    '9y3rkiwh': {
      'en': 'Notifications',
      'es': 'Notificaciones',
      'fr': 'Notifications',
    },
    'c896mtu7': {
      'en': 'Support',
      'es': 'Apoyo',
      'fr': 'Soutien',
    },
    'x0sa71w5': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    'b0mse2oy': {
      'en': 'Log out',
      'es': 'Finalizar la sesión',
      'fr': 'Déconnexion',
    },
    '2u35g7vm': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Streak
  {
    'losrn07d': {
      'en': 'Streak Days',
      'es': 'Días de racha',
      'fr': 'Jours consécutifs',
    },
    'rmrug5xm': {
      'en': 'This is the longest streak you’ve ever had',
      'es': 'Esta es la racha más larga que jamás hayas tenido',
      'fr': 'C\'est la plus longue série que tu aies jamais eue.',
    },
    'tfqq5i9k': {
      'en': 'Achievements',
      'es': 'Logros',
      'fr': 'Réalisations',
    },
    'whfgsh64': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Leaderbord
  {
    'j71hybpn': {
      'en': 'Your current rank',
      'es': 'Tu rango actual',
      'fr': 'Votre rang actuel',
    },
    'euoxgchn': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // chllenges
  {
    's1wc008f': {
      'en': 'Completing a daily challenge gives you access to 500xp daily',
      'es': 'Completar un desafío diario te da acceso a 500 XP diarios.',
      'fr': 'Terminer un défi quotidien vous donne accès à 500 XP par jour.',
    },
    'nxxzhszx': {
      'en': 'Today',
      'es': 'Hoy',
      'fr': 'Aujourd\'hui',
    },
    'eyhfy85b': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'r4k5kbwk': {
      'en': 'All',
      'es': 'Todo',
      'fr': 'Tous',
    },
    'ycv8lhrv': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'x7kkntz2': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // GroupEditForm
  {
    'lml6of3f': {
      'en': 'Group Name',
      'es': 'Nombre del grupo',
      'fr': 'Nom du groupe',
    },
    'tchka9av': {
      'en': 'Event Description',
      'es': 'Descripción del evento',
      'fr': 'Description de l\'événement',
    },
    'b8uomlq5': {
      'en': 'public',
      'es': 'Público',
      'fr': 'Publique',
    },
    'w7wc4592': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'i7sfl6qb': {
      'en': 'public',
      'es': 'Público',
      'fr': 'Publique',
    },
    'mxhbqabe': {
      'en': 'private',
      'es': 'Privado',
      'fr': 'Privé',
    },
    'x9e2stso': {
      'en': 'Upload Group Image',
      'es': 'Subir imagen de grupo',
      'fr': 'Télécharger une image de groupe',
    },
    'wemmmhaj': {
      'en': 'Save',
      'es': 'Ahorrar',
      'fr': 'Sauvegarder',
    },
  },
  // reportpage2
  {
    'ekqgag39': {
      'en': 'Create Report',
      'es': 'Crear informe',
      'fr': 'Créer un rapport',
    },
    'qob9olgu': {
      'en':
          'Select a report type or create a custom report to help us improve your experience.',
      'es':
          'Seleccione un tipo de informe o cree un informe personalizado para ayudarnos a mejorar su experiencia.',
      'fr':
          'Sélectionnez un type de rapport ou créez un rapport personnalisé pour nous aider à améliorer votre expérience.',
    },
    'p71xxiew': {
      'en': 'Report Type',
      'es': 'Tipo de informe',
      'fr': 'Type de rapport',
    },
    '1efeptxv': {
      'en': 'Select report type',
      'es': 'Seleccionar el tipo de informe',
      'fr': 'Sélectionnez le type de rapport',
    },
    '5v7s2h0b': {
      'en': 'Choose a category',
      'es': 'Elige una categoría',
      'fr': 'Choisissez une catégorie',
    },
    '4z1o5tuz': {
      'en': 'Search categories...',
      'es': 'Buscar categorías...',
      'fr': 'Catégories de recherche...',
    },
    'szgun6m5': {
      'en': 'Sexual',
      'es': 'Sexual',
      'fr': 'Sexuel',
    },
    'o9sz8wmz': {
      'en': 'Feature Request',
      'es': 'Solicitud de función',
      'fr': 'Demande de fonctionnalité',
    },
    '6gt5i563': {
      'en': 'Content Issue',
      'es': 'Problema de contenido',
      'fr': 'Problème de contenu',
    },
    '70qlsmow': {
      'en': 'Performance Issue',
      'es': 'Problema de rendimiento',
      'fr': 'Problème de performance',
    },
    '15x28nfp': {
      'en': 'Account Problem',
      'es': 'Problema de cuenta',
      'fr': 'Problème de compte',
    },
    'eyzwk3gx': {
      'en': 'Payment Issue',
      'es': 'Problema de pago',
      'fr': 'Problème de paiement',
    },
    'qho35i9z': {
      'en': 'Privacy Concern',
      'es': 'Preocupación por la privacidad',
      'fr': 'Préoccupations relatives à la confidentialité',
    },
    'c9w30cc5': {
      'en': 'Abuse',
      'es': 'Abuso',
      'fr': 'Abus',
    },
    'g4yflm7k': {
      'en': 'Select report type',
      'es': 'Seleccionar el tipo de informe',
      'fr': 'Sélectionnez le type de rapport',
    },
    'wocfqu2d': {
      'en': 'Subject',
      'es': 'Sujeto',
      'fr': 'Sujet',
    },
    'nz0t70c9': {
      'en': 'Brief description of the issue',
      'es': 'Breve descripción del problema',
      'fr': 'Brève description du problème',
    },
    'axh9cnip': {
      'en': 'Description',
      'es': 'Descripción',
      'fr': 'Description',
    },
    '1lghy8x3': {
      'en':
          'Please provide detailed information about your report. Include steps to reproduce if it\'s a bug, or explain your suggestion if it\'s a feature request.',
      'es':
          'Proporcione información detallada sobre su informe. Incluya los pasos para reproducirlo si se trata de un error o explique su sugerencia si se trata de una solicitud de función.',
      'fr':
          'Veuillez fournir des informations détaillées concernant votre rapport. Indiquez les étapes pour reproduire le problème s\'il s\'agit d\'un bug, ou expliquez votre suggestion s\'il s\'agit d\'une demande de fonctionnalité.',
    },
    'mwevxuga': {
      'en': 'Priority Level',
      'es': 'Nivel de prioridad',
      'fr': 'Niveau de priorité',
    },
    'v8lxq3fq': {
      'en': 'Low',
      'es': 'Bajo',
      'fr': 'Faible',
    },
    't9fyn48v': {
      'en': 'Medium',
      'es': 'Medio',
      'fr': 'Moyen',
    },
    'e5za3kf2': {
      'en': 'High',
      'es': 'Alto',
      'fr': 'Haut',
    },
    'zbcrhiz5': {
      'en': 'Critical',
      'es': 'Crítico',
      'fr': 'Critique',
    },
    'ena7k85y': {
      'en': 'Report Guidelines',
      'es': 'Directrices del informe',
      'fr': 'Directives relatives aux rapports',
    },
    'lqbp3w39': {
      'en':
          '• Be specific and provide clear details\n• Include screenshots if applicable\n• Avoid duplicate reports\n• Use appropriate language',
      'es':
          '• Sea específico y proporcione detalles claros.\n• Incluya capturas de pantalla si corresponde.\n• Evite informes duplicados.\n• Use un lenguaje apropiado.',
      'fr':
          '• Soyez précis et fournissez des détails clairs.\n\n• Joignez des captures d\'écran si nécessaire.\n\n• Évitez les signalements en double.\n\n• Utilisez un langage approprié.',
    },
    'onnhr1ro': {
      'en': 'Submit Report',
      'es': 'Enviar informe',
      'fr': 'Soumettre un rapport',
    },
  },
  // Profilesuser
  {
    '4kkpwcn3': {
      'en': 'Achievements',
      'es': 'Logros',
      'fr': 'Réalisations',
    },
    'ndwv3xwx': {
      'en': 'Stories',
      'es': 'Historias',
      'fr': 'Histoires',
    },
    'nj0js0n2': {
      'en': 'Reels',
      'es': 'Bobinas',
      'fr': 'Bobines',
    },
    '4gk6b8ho': {
      'en': 'User Action',
      'es': 'Acción del usuario',
      'fr': 'Action de l\'utilisateur',
    },
    'oke0msgr': {
      'en': 'Stories',
      'es': 'Historias',
      'fr': 'Histoires',
    },
    'bqg7pl1x': {
      'en': 'Following',
      'es': 'Siguiente',
      'fr': 'Suivant',
    },
    '7u11si99': {
      'en': 'Followers',
      'es': 'Seguidores',
      'fr': 'Abonnés',
    },
    'zek9cf30': {
      'en': 'Follow',
      'es': 'Seguir',
      'fr': 'Suivre',
    },
    'upiouivc': {
      'en': 'Following',
      'es': 'Siguiente',
      'fr': 'Suivant',
    },
    'mc8iiot9': {
      'en': 'Message',
      'es': 'Mensaje',
      'fr': 'Message',
    },
    'ui0ev5l6': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Chat
  {
    'y375xsfc': {
      'en': 'message',
      'es': 'mensaje',
      'fr': 'message',
    },
    'tkljm5nn': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Editprofile
  {
    '5mkl6msh': {
      'en': 'User Name',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
    },
    'zuqx4gyv': {
      'en': 'Upload Image',
      'es': 'Subir imagen',
      'fr': 'Télécharger une image',
    },
    'czq32n36': {
      'en': 'Save',
      'es': 'Ahorrar',
      'fr': 'Sauvegarder',
    },
  },
  // test
  {
    '96ljf9w8': {
      'en': 'Focuse Mode',
      'es': '',
      'fr': '',
    },
    '3tq27mt2': {
      'en': 'Page Title',
      'es': '',
      'fr': '',
    },
    'q3cryqep': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // testcomp
  {
    'ie0sp3yz': {
      'en': 'test completed',
      'es': '',
      'fr': '',
    },
    'xsvl0gcc': {
      'en': 'log out',
      'es': '',
      'fr': '',
    },
    'ne7ond03': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // postDetails
  {
    'z6lvapz5': {
      'en': 'replying to ',
      'es': '',
      'fr': '',
    },
    'qz3s1trk': {
      'en': 'cancel',
      'es': '',
      'fr': '',
    },
    'f2hq2yrr': {
      'en': 'comment',
      'es': '',
      'fr': '',
    },
    '3ipi2rnj': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // btn
  {
    'qufpy1xg': {
      'en': 'Save',
      'es': 'Ahorrar',
      'fr': 'Sauvegarder',
    },
  },
  // button
  {
    'zi9w8bcs': {
      'en': 'Save for Later',
      'es': 'Guardar para más tarde',
      'fr': 'Enregistrer pour plus tard',
    },
  },
  // Nav
  {
    'j8xtivy4': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
    'rapxru07': {
      'en': 'Explore',
      'es': 'Explorar',
      'fr': 'Explorer',
    },
    'n2fj0vr8': {
      'en': 'Stories',
      'es': 'Historias',
      'fr': 'Histoires',
    },
    '0vnfmll7': {
      'en': 'Community',
      'es': 'Comunidad',
      'fr': 'Communauté',
    },
    '11aw7fe6': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // cardsaved
  {
    'hb1sjmns': {
      'en': 'Back to stories',
      'es': 'Volver a las historias',
      'fr': 'Retour aux histoires',
    },
    'e9eviqil': {
      'en': 'Back to map',
      'es': 'Volver al mapa',
      'fr': 'Retour à la carte',
    },
  },
  // huntcard
  {
    'kq3c6gs2': {
      'en': 'Your Misssion',
      'es': 'Tu misión',
      'fr': 'Votre mission',
    },
    'xhcp0y9s': {
      'en': 'xp',
      'es': 'XP',
      'fr': 'xp',
    },
    'gdjpzfv4': {
      'en': 'Your Misssion',
      'es': 'Tu misión',
      'fr': 'Votre mission',
    },
    'tlf3uqao': {
      'en': 'Complete these tasks to earn points',
      'es': 'Completa estas tareas para ganar puntos.',
      'fr': 'Accomplissez ces tâches pour gagner des points',
    },
  },
  // joineventbtn
  {
    '47o27fgc': {
      'en': 'Join Event',
      'es': 'Unirse al evento',
      'fr': 'Participez à l\'événement',
    },
  },
  // btnjoingroup
  {
    's3ewnd95': {
      'en': 'Join',
      'es': 'Unirse',
      'fr': 'Rejoindre',
    },
  },
  // comment
  {
    'ftphaj5x': {
      'en': 'Comments',
      'es': 'Comentarios',
      'fr': 'Commentaires',
    },
    '7yuguk0c': {
      'en': 'Reply',
      'es': 'Responder',
      'fr': 'Répondre',
    },
    'dz1clj0w': {
      'en': 'Add a comment...',
      'es': 'Añade un comentario...',
      'fr': 'Ajouter un commentaire...',
    },
  },
  // likecomp
  {
    '5yj9j5g3': {
      'en': '0',
      'es': '0',
      'fr': '0',
    },
  },
  // daystreak
  {
    'czrvw6dl': {
      'en': '0',
      'es': '0',
      'fr': '0',
    },
  },
  // userstreak
  {
    'w86m7lq9': {
      'en': '0',
      'es': '0',
      'fr': '0',
    },
    '2p9rtd54': {
      'en': 'Your current rank',
      'es': 'Tu rango actual',
      'fr': 'Votre rang actuel',
    },
    'mwd0grw1': {
      'en': '0 points',
      'es': '0 puntos',
      'fr': '0 point',
    },
  },
  // rowcomment
  {
    '9pez0upa': {
      'en': '0',
      'es': '0',
      'fr': '0',
    },
    'yab8r0f1': {
      'en': '0',
      'es': '0',
      'fr': '0',
    },
    '3hjuxrct': {
      'en': '0',
      'es': '0',
      'fr': '0',
    },
  },
  // Report
  {
    '4uiaw964': {
      'en':
          'Take action against this account if you believe it violates our community guidelines.',
      'es':
          'Tome medidas contra esta cuenta si cree que viola nuestras pautas comunitarias.',
      'fr':
          'Prenez des mesures contre ce compte si vous pensez qu\'il enfreint nos règles communautaires.',
    },
    '6lq75vyj': {
      'en':
          'Reporting helps us maintain a safe community. Blocking prevents this user from contacting you.',
      'es':
          'Denunciar nos ayuda a mantener una comunidad segura. Bloquear impide que este usuario se ponga en contacto contigo.',
      'fr':
          'Signaler un utilisateur nous aide à maintenir une communauté sûre. Le bloquer empêche cet utilisateur de vous contacter.',
    },
  },
  // Souce
  {
    'pvl9v5h9': {
      'en': 'Select Photo Source',
      'es': 'Seleccionar fuente de la foto',
      'fr': 'Sélectionner la source de la photo',
    },
    '3ru1bfqn': {
      'en': 'Camera',
      'es': 'Cámara',
      'fr': 'Caméra',
    },
    'p57plm7a': {
      'en': 'Take a new photo',
      'es': 'Toma una nueva foto',
      'fr': 'Prenez une nouvelle photo',
    },
    '60za5vry': {
      'en': 'Gallery',
      'es': 'Galería',
      'fr': 'Galerie',
    },
    '9mjcjtn9': {
      'en': 'Choose from existing photos',
      'es': 'Elija entre fotos existentes',
      'fr': 'Choisissez parmi les photos existantes',
    },
    'p44zdtns': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'fr': 'Annuler',
    },
  },
  // message
  {
    'iqducww1': {
      'en': 'Message',
      'es': 'Mensaje',
      'fr': 'Message',
    },
  },
  // eventload
  {
    '14lkbjyx': {
      'en': 'All Events',
      'es': 'Todos los eventos',
      'fr': 'Tous les événements',
    },
    'wruq3yo6': {
      'en': 'My Events',
      'es': 'Mis eventos',
      'fr': 'Mes événements',
    },
    'flbeps33': {
      'en': 'Sports',
      'es': 'Deportes',
      'fr': 'Sportif',
    },
    'xs34yjk8': {
      'en': 'Mystery',
      'es': 'Misterio',
      'fr': 'Mystère',
    },
    'zkdfbvua': {
      'en': 'Technology',
      'es': 'Tecnología',
      'fr': 'Technologie',
    },
    'rntu3gwp': {
      'en': 'History',
      'es': 'Historia',
      'fr': 'Histoire',
    },
  },
  // mainpostcard
  {
    'lim1qnb5': {
      'en': '0',
      'es': '',
      'fr': '',
    },
  },
  // commentcomp
  {
    'h64r5n0u': {
      'en': 'Reply',
      'es': '',
      'fr': '',
    },
  },
  // storycomponent
  {
    'dxdcxels': {
      'en': 'Read',
      'es': '',
      'fr': '',
    },
    'ufvmtxjn': {
      'en': 'Show on Map',
      'es': '',
      'fr': '',
    },
  },
  // commentpost
  {
    'njdsutxx': {
      'en': 'replying to ',
      'es': '',
      'fr': '',
    },
    '8snr5fwr': {
      'en': 'cancel',
      'es': '',
      'fr': '',
    },
    '29qqxuk0': {
      'en': 'comment',
      'es': '',
      'fr': '',
    },
  },
  // mapcard
  {
    'clkkzb7s': {
      'en': 'Read',
      'es': '',
      'fr': '',
    },
    'y8u6vnxo': {
      'en': 'Delete',
      'es': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'ne2m5ujk': {
      'en':
          'This app needs access to your location to discover nearby stories, provide directions, and offer relevant content.',
      'es':
          'Esta aplicación necesita acceso a tu ubicación para descubrir historias cercanas, brindar direcciones y ofrecer contenido relevante.',
      'fr':
          'Cette application a besoin d\'accéder à votre position pour découvrir les actualités à proximité, vous fournir des itinéraires et vous proposer du contenu pertinent.',
    },
    'zur3adt5': {
      'en':
          'This app needs access to your camera to allow you to take photos and videos for posts and profile pictures',
      'es':
          'Esta aplicación necesita acceso a tu cámara para permitirte tomar fotos y videos para publicaciones y fotos de perfil.',
      'fr':
          'Cette application a besoin d\'accéder à votre caméra pour vous permettre de prendre des photos et des vidéos pour vos publications et photos de profil.',
    },
    '68cxo57f': {
      'en':
          'This app needs access to your photo library to allow you to select images and videos for posts and profile pictures.',
      'es':
          'Esta aplicación necesita acceso a tu biblioteca de fotos para permitirte seleccionar imágenes y videos para publicaciones y fotos de perfil.',
      'fr':
          'Cette application a besoin d\'accéder à votre photothèque pour vous permettre de sélectionner des images et des vidéos pour vos publications et votre photo de profil.',
    },
    'slk466it': {
      'en':
          'This app needs access to your photo library to allow you to select images and videos for posts and profile pictures.',
      'es':
          'Esta aplicación necesita acceso a tu biblioteca de fotos para permitirte seleccionar imágenes y videos para publicaciones y fotos de perfil.',
      'fr':
          'Cette application a besoin d\'accéder à votre photothèque pour vous permettre de sélectionner des images et des vidéos pour vos publications et votre photo de profil.',
    },
    '9wmwfo81': {
      'en':
          'This app needs access to your camera to allow you to take photos and videos for posts and profile pictures',
      'es':
          'Esta aplicación necesita acceso a tu cámara para permitirte tomar fotos y videos para publicaciones y fotos de perfil.',
      'fr':
          'Cette application a besoin d\'accéder à votre caméra pour vous permettre de prendre des photos et des vidéos pour vos publications et photos de profil.',
    },
    'tk7pezm8': {
      'en':
          'This app needs access to your microphone to record audio for video posts and voice notes.',
      'es':
          'Esta aplicación necesita acceso a su micrófono para grabar audio para publicaciones de video y notas de voz.',
      'fr':
          'Cette application a besoin d\'accéder à votre microphone pour enregistrer l\'audio des publications vidéo et des notes vocales.',
    },
    'x8m0ui3k': {
      'en':
          'This app needs access to your Notification to send you discover nearby stories, provide directions, and offer relevant content.',
      'es': '',
      'fr': '',
    },
    '2hfu897h': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vz8mstg4': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'j81dbc8c': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'fowdl6fr': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vi44lf7h': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xwnuunpp': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xs6b349u': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xsrdyymq': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '4ktytobi': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'us2z06w3': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'vs0u5aad': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'jjwgpc4u': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'x7eejafz': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '39j4kavc': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'u2hg3mkm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'kz07xo05': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '9g3ew5za': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'c1ofvccr': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '8v99ccbf': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'mizvawwb': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'b250pyk5': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '8mal3whn': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '8w3e32j1': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'yhah9lvl': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'dnkkjc4e': {
      'en': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
