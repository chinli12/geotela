// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color mainBrandColorSuccessExploration;
  late Color systemBgDarkBasePrimary;
  late Color labelLightPrimary;
  late Color labelDarkPrimary;
  late Color labelDarkTertiary;
  late Color colorLightGreen;
  late Color colorDarkYellow;
  late Color systemGreenLight;
  late Color xPRewardsAchievements;
  late Color white;
  late Color secondaryText2;
  late Color primaryText2;
  late Color white1;
  late Color fontColor;
  late Color keyDarkColor;
  late Color keyHover;
  late Color labelsSecondary;
  late Color legendaryStories;
  late Color storiesMysteryRareContent;
  late Color lightGreen;
  late Color cardsModals;
  late Color notificationsWarnings;
  late Color lightBackground;
  late Color offwhite;
  late Color baseShadow;
  late Color green10;
  late Color blue10;
  late Color grey10;
  late Color metalGold3;
  late Color defaultWhite;
  late Color dMBackground;
  late Color dMContainer;
  late Color dMAccent;
  late Color dMPText;
  late Color dMSText;
  late Color dMPlaceholder;
  late Color dMDivider;
  late Color navigationTrustWaterElements;
  late Color backgroud;
  late Color secondrybtn;
  late Color uploadform;
  late Color leaderback;
  late Color shimer;
  late Color profilebtn;
  late Color form;
  late Color icon;
  late Color mapcontainer;
  late Color tripcard;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF8ACE42);
  late Color secondary = const Color(0xFF39D2C0);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0x1A64748B);
  late Color primaryText = const Color(0xFF14181B);
  late Color secondaryText = const Color(0xFF57636C);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0x4C4B39EF);
  late Color accent2 = const Color(0x4D39D2C0);
  late Color accent3 = const Color(0x4DEE8B60);
  late Color accent4 = const Color(0xCCFFFFFF);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color mainBrandColorSuccessExploration = const Color(0xFF8ACE42);
  late Color systemBgDarkBasePrimary = const Color(0xFF000000);
  late Color labelLightPrimary = const Color(0xFF000000);
  late Color labelDarkPrimary = const Color(0xFFFFFFFF);
  late Color labelDarkTertiary = const Color(0x4DEBEBF5);
  late Color colorLightGreen = const Color(0xFF34C759);
  late Color colorDarkYellow = const Color(0xFFFFD60A);
  late Color systemGreenLight = const Color(0xFF34C759);
  late Color xPRewardsAchievements = const Color(0xFFF59E0B);
  late Color white = const Color(0xFFFDFDFD);
  late Color secondaryText2 = const Color(0xFF64748B);
  late Color primaryText2 = const Color(0xFF374151);
  late Color white1 = const Color(0xFFFFFFFF);
  late Color fontColor = const Color(0xFF586C9D);
  late Color keyDarkColor = const Color(0xFFDEE2EC);
  late Color keyHover = const Color(0xFF097CFB);
  late Color labelsSecondary = const Color(0x993C3C43);
  late Color legendaryStories = const Color(0xFFA855F7);
  late Color storiesMysteryRareContent = const Color(0xFF8B5CF6);
  late Color lightGreen = const Color(0xFFC1F99B);
  late Color cardsModals = const Color(0xFFFFFFFF);
  late Color notificationsWarnings = const Color(0xFFEF4444);
  late Color lightBackground = const Color(0xFFF0FDF4);
  late Color offwhite = const Color(0xFFFCFCFC);
  late Color baseShadow = const Color(0xFFFFFFFF);
  late Color green10 = const Color(0xFF92EACA);
  late Color blue10 = const Color(0xFFB0B8FD);
  late Color grey10 = const Color(0xFFBCC1CB);
  late Color metalGold3 = const Color(0xFFFCD996);
  late Color defaultWhite = const Color(0xFFFFFFFF);
  late Color dMBackground = const Color(0xFF0F172A);
  late Color dMContainer = const Color(0x1664748B);
  late Color dMAccent = const Color(0xFFA8E060);
  late Color dMPText = const Color(0xFFF8FAFC);
  late Color dMSText = const Color(0xFFCBD5E1);
  late Color dMPlaceholder = const Color(0x3EFFFFFF);
  late Color dMDivider = const Color(0xFF334155);
  late Color navigationTrustWaterElements = const Color(0xFF3B82F6);
  late Color backgroud = const Color(0xFFF8F8F9);
  late Color secondrybtn = const Color(0xFFF3A220);
  late Color uploadform = const Color(0x0D64748B);
  late Color leaderback = const Color(0xFFCCE4F0);
  late Color shimer = const Color(0xFFF9FAFB);
  late Color profilebtn = const Color(0x1B64748B);
  late Color form = const Color(0x0D64748B);
  late Color icon = const Color(0xFF2D2D2D);
  late Color mapcontainer = const Color(0xFFF8F8F9);
  late Color tripcard = const Color(0x0C64748B);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Raleway';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'Raleway';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Raleway';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Raleway';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Raleway';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Raleway';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Raleway';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      );
  String get titleMediumFamily => 'Raleway';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Raleway';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Raleway';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.raleway(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Raleway';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.raleway(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Raleway';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.raleway(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Raleway';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Raleway';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Raleway';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.raleway(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
