import 'package:flash_buzz/app/utils/constants/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: bgColorLight1,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: secondaryColor,
      background: secondaryColor,
      error: redColor,
      onPrimary: secondaryColor,
      onSecondary: primaryColor,
      onSurface: primaryColor,
      onBackground: primaryColor,
      onError: whiteColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: bgColorLight2,
      selectedItemColor: primaryColor,
      unselectedItemColor: secondaryColor,
      selectedLabelStyle: footnote,
      unselectedLabelStyle: footnote,
      type: BottomNavigationBarType.fixed,
      enableFeedback: true,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    ),
    fontFamily: 'PublicSans',
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: greyColor,
        fontFamily: 'PublicSans',
      ),
      labelMedium: TextStyle(
        color: greyColor,
        fontFamily: 'PublicSans',
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionHandleColor: primaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontFamily: 'PublicSans',
        fontSize: bodyFS,
        fontWeight: semiBold,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
      enableFeedback: true,
    ),
    searchBarTheme: SearchBarThemeData(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(
        primaryColor.withOpacity(0.1),
      ),
      shape: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(defaultRadius),
            ),
            side: BorderSide(color: primaryColor),
          );
        }
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(defaultRadius),
          ),
          side: BorderSide.none,
        );
      }),
      hintStyle: MaterialStateProperty.all(
        TextStyle(
          color: greyColor,
          fontFamily: 'PublicSans',
          fontSize: calloutFS,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontFamily: 'PublicSans',
          fontSize: calloutFS,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontFamily: 'PublicSans',
            fontWeight: semiBold,
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(primaryColor),
        foregroundColor: MaterialStateProperty.all(secondaryColor),
        overlayColor: MaterialStateProperty.all(
          secondaryColor.withOpacity(0.1),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontFamily: 'PublicSans',
            fontWeight: semiBold,
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        foregroundColor: MaterialStateProperty.all(primaryColor),
        overlayColor: MaterialStateProperty.all(
          primaryColor.withOpacity(0.1),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: bgColorLight2,
      shape: radiusTopLeftRight,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: secondaryColor,
      textTheme: CupertinoTextThemeData(
        primaryColor: primaryColor,
        dateTimePickerTextStyle: const TextStyle(
          fontFamily: 'PublicSans',
        ),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: bgColorDark1,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: secondaryColor,
      background: secondaryColor,
      error: redColor,
      onPrimary: secondaryColor,
      onSecondary: primaryColor,
      onSurface: primaryColor,
      onBackground: primaryColor,
      onError: whiteColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: bgColorDark3,
      selectedItemColor: primaryColor,
      unselectedItemColor: secondaryColor,
      selectedLabelStyle: footnote,
      unselectedLabelStyle: footnote,
      type: BottomNavigationBarType.fixed,
      enableFeedback: true,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
    ),
    fontFamily: 'PublicSans',
    textTheme: TextTheme(
      titleSmall: TextStyle(
        color: greyColor,
        fontFamily: 'PublicSans',
      ),
      labelMedium: TextStyle(
        color: greyColor,
        fontFamily: 'PublicSans',
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionHandleColor: primaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontFamily: 'PublicSans',
        fontSize: bodyFS,
        fontWeight: semiBold,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: secondaryColor,
      enableFeedback: true,
    ),
    searchBarTheme: SearchBarThemeData(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(
        primaryColor.withOpacity(0.1),
      ),
      shape: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.focused)) {
          return RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(defaultRadius),
            ),
            side: BorderSide(color: primaryColor),
          );
        }
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(defaultRadius),
          ),
          side: BorderSide.none,
        );
      }),
      hintStyle: MaterialStateProperty.all(
        TextStyle(
          color: greyColor,
          fontFamily: 'PublicSans',
          fontSize: calloutFS,
        ),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontFamily: 'PublicSans',
          fontSize: calloutFS,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontFamily: 'PublicSans',
            fontWeight: semiBold,
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.all(primaryColor),
        foregroundColor: MaterialStateProperty.all(secondaryColor),
        overlayColor: MaterialStateProperty.all(
          secondaryColor.withOpacity(0.1),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontFamily: 'PublicSans',
            fontWeight: semiBold,
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        foregroundColor: MaterialStateProperty.all(primaryColor),
        overlayColor: MaterialStateProperty.all(
          primaryColor.withOpacity(0.1),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: bgColorLight2,
      shape: radiusTopLeftRight,
    ),
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: secondaryColor,
      textTheme: CupertinoTextThemeData(
        primaryColor: primaryColor,
        dateTimePickerTextStyle: const TextStyle(
          fontFamily: 'PublicSans',
        ),
      ),
    ),
  );
}
