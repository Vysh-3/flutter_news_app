import 'package:flutter/material.dart';

extension LegacyTextThemeFix on TextTheme {
  TextStyle? get headline1 => displayLarge;
  TextStyle? get headline2 => displayMedium;
  TextStyle? get headline3 => displaySmall;
  TextStyle? get headline4 => headlineMedium;
  TextStyle? get headline5 => headlineSmall;
  TextStyle? get headline6 => titleLarge;
  TextStyle? get subtitle1 => bodyLarge;
  TextStyle? get subtitle2 => bodyMedium;
  TextStyle? get bodyText1 => bodyLarge;
  TextStyle? get bodyText2 => bodyMedium;
  TextStyle? get caption => bodySmall;
  TextStyle? get overline => labelSmall;
  TextStyle? get button => labelLarge;
}
