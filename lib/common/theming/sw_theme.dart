import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constant.dart';

class SWTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: const MaterialColor(
          0xff183d9c,
          {
            50: kColorPrimary50,
            100: kColorPrimary100,
            200: kColorPrimary200,
            300: kColorPrimary300,
            400: kColorPrimary400,
            500: kColorPrimary500,
            600: kColorPrimary500,
            700: kColorPrimary500,
            800: kColorPrimary500,
            900: kColorPrimary500,
          },
        ),
        scaffoldBackgroundColor: kColorNeutral0,
        fontFamily: 'Quicksand',
        textTheme: TextTheme(
          displayLarge: kTypoHeading1Bold,
          displayMedium: kTypoHeading2Bold,
          displaySmall: kTypoHeading3Bold,
          headlineLarge: kTypoHeading4Bold,
          headlineMedium: kTypoHeading5Bold,
          headlineSmall: kTypoHeading6Bold,
          bodyLarge: kTypoTitle,
          bodyMedium: kTypoBody,
          bodySmall: kTypoCaption1,
          labelLarge: kTypoBodyBold.copyWith(letterSpacing: .2),
          labelSmall: kTypoCaption2,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kColorNeutral0,
          foregroundColor: kColorNeutral900,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: kColorNeutral0,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          titleTextStyle:
              kTypoHeading6Bold.copyWith(fontWeight: FontWeight.bold),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: kColorNeutral0,
          unselectedItemColor: kColorNeutral50,
          selectedItemColor: kColorPrimary500,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: const MaterialStatePropertyAll(
              Size.fromHeight(SWSizes.s56),
            ),
            elevation: const MaterialStatePropertyAll(0),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SWSizes.s8),
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            minimumSize: const MaterialStatePropertyAll(Size.fromHeight(56)),
            side: const MaterialStatePropertyAll(
              BorderSide(
                width: SWSizes.s2,
                color: kColorPrimary500,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: kTypoBody,
          hintStyle: kTypoBody.copyWith(color: kColorNeutral100),
          fillColor: kColorPrimary50,
          filled: true,
          border: InputBorder.none,
          constraints: const BoxConstraints(maxHeight: SWSizes.s56),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SWSizes.s8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(SWSizes.s8),
            borderSide: const BorderSide(
              color: kColorPrimary100,
              width: SWSizes.s2,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: kColorPrimary500,
          linearTrackColor: kColorPrimary50,
        ),
      );
}
