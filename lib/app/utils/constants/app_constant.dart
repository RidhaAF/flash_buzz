import 'package:flutter/material.dart';

const double defaultMargin = 16;
const double defaultRadius = 8;
const Duration defaultDuration = Duration(seconds: 30);

Color primaryColor = darkBlueColor;
Color secondaryColor = mutedColor;
Color rustGreyColor = const Color(0xFF47585C);
Color willowGreyColor = const Color(0xFFC8D5BB);
Color beigeColor = const Color(0xFFF5F5DC);
Color mutedColor = Colors.grey;
Color lightGreyColor = Colors.grey.shade300;
Color greyColor = Colors.grey.shade700;
Color darkColor = const Color(0xFF090A0A);
Color darkGreyColor = const Color(0xFF1D1D1D);
Color blackColor = Colors.black;
Color whiteColor = Colors.white;
Color white70Color = Colors.white70;
Color greenColor = Colors.green;
Color darkGreenColor = Colors.green.shade900;
Color yellowColor = Colors.yellow;
Color darkYellowColor = Colors.yellow.shade800;
Color orangeColor = Colors.orange;
Color darkOrangeColor = Colors.orange.shade900;
Color redColor = Colors.red;
Color darkRedColor = Colors.red.shade900;
Color purpleColor = Colors.purple;
Color darkPurpleColor = Colors.purple.shade900;
Color brownColor = Colors.brown;
Color darkBrownColor = Colors.brown.shade900;
Color pinkColor = Colors.pink;
Color darkPinkColor = Colors.pink.shade900;
Color blueColor = Colors.blue;
Color darkBlueColor = Colors.blue.shade800;
Color bgColorDark1 = const Color(0xFF1A1A1A);
Color bgColorDark2 = blackColor;
Color bgColorDark3 = const Color(0xFF1D1D1D);
Color bgColorDark4 = const Color(0xFF111111);
Color bgColorLight1 = const Color(0xFFF5F5F5);
Color bgColorLight2 = whiteColor;
Color bgColorLight3 = const Color(0xFFE9E9E9);

LinearGradient japaneseGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    primaryColor,
    secondaryColor,
  ],
);

double largeTitleFS = 32;
double title1FS = 28;
double title2FS = 24;
double title3FS = 20;
double headlineFS = 18;
double bodyFS = 18;
double calloutFS = 16;
double subheadlineFS = 14;
double footnoteFS = 13;
double caption1FS = 12;
double caption2FS = 10;

FontWeight thin = FontWeight.w100;
FontWeight extraLight = FontWeight.w200;
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

// 32
TextStyle largeTitle = TextStyle(
  fontFamily: 'PublicSans',
  fontSize: largeTitleFS,
);

// 28
TextStyle title1 = TextStyle(
  fontFamily: 'PublicSans',
  fontSize: title1FS,
);

// 24
TextStyle title2 = TextStyle(
  fontFamily: 'PublicSans',
  fontSize: title2FS,
);

// 20
TextStyle title3 = TextStyle(
  fontFamily: 'PublicSans',
  fontSize: title3FS,
);

// 18
TextStyle headline = TextStyle(
  color: whiteColor,
  fontFamily: 'PublicSans',
  fontSize: headlineFS,
  fontWeight: semiBold,
);

// 18
TextStyle body = TextStyle(
  fontFamily: 'PublicSans',
  fontSize: bodyFS,
);

// 16
TextStyle callout = TextStyle(
  fontFamily: 'PublicSans',
  fontSize: calloutFS,
);

// 14
TextStyle subheadline = TextStyle(
  fontFamily: 'PublicSans',
  fontSize: subheadlineFS,
);

// 13
TextStyle footnote = TextStyle(
  fontFamily: 'PublicSans',
  fontSize: footnoteFS,
);

// 12
TextStyle caption1 = TextStyle(
  fontFamily: 'PublicSans',
  fontSize: caption1FS,
);

// 10
TextStyle caption2 = TextStyle(
  fontFamily: 'PublicSans',
  fontSize: caption2FS,
);

// text style per color
TextStyle primaryTextStyle = TextStyle(
  color: primaryColor,
  fontFamily: 'PublicSans',
);

TextStyle secondaryTextStyle = TextStyle(
  color: secondaryColor,
  fontFamily: 'PublicSans',
);

TextStyle mutedTextStyle = TextStyle(
  color: mutedColor,
  fontFamily: 'PublicSans',
);

TextStyle whiteTextStyle = TextStyle(
  color: whiteColor,
  fontFamily: 'PublicSans',
);

TextStyle darkGreyTextStyle = TextStyle(
  color: darkGreyColor,
  fontFamily: 'PublicSans',
);

ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.zero,
  backgroundColor: primaryColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(defaultRadius),
  ),
);

ButtonStyle darkGreyButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.zero,
  backgroundColor: darkGreyColor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(defaultRadius),
  ),
);

Border primaryBorder = Border.all(
  width: 1,
  color: primaryColor,
);

BoxShadow primaryBoxShadow = BoxShadow(
  color: blackColor.withOpacity(0.10),
  spreadRadius: 0,
  blurRadius: 16,
  offset: const Offset(0, 0), // changes position of shadow
);

RoundedRectangleBorder cardBorderRadius = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(defaultRadius),
  ),
);

ShapeBorder radiusTopLeftRight = const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(defaultRadius * 3),
    topRight: Radius.circular(defaultRadius * 3),
  ),
);
