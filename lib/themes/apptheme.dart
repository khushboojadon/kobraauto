import 'package:flutter/material.dart';

class AppTheme {
//  AppTheme._();

//Used
  static const Color primaryColor = Colors.white;
  static const Color accentColor = Color(0xFFFE4F60);
  static const Color secondaryColor = Color(0xff4D4E59);
  static const Color backgroundColor = Color(0xFFFFFFFF);

  static const Color boldTextColor = Color(0xFF4D4E59);
  static const Color regularTextColor = Color(0xFF3B3B3B);
  static const Color thinTextColor = Color(0xFF3B3B3B);

  static const Color borderColor = Color(0xFFE0E0E0);

  static const Color buttonBg = Color(0xFF5C6AC4);
  static const Color buttonBgColor = Color(0xFFF2F3FA);



// unUsed

  static const Color tabItemColor = Color(0xFF61606A);
  static const Color menuItemColor = Color(0xFF999DA3);
  static const Color bottomBarItemColor = Color(0xFF83829A);


  static const Color nearlyRed = Color(0xFFFF1929);
  static const Color nearlyOrange = Color(0xFFFF8648);
  static const Color nearlyGrey = Color(0xFFBCBCBC);

  static const Color editTextBgColor = Colors.white;
  static const Color radioButtonBgColor = Color(0xFF2D2F35);

  static const Color buttonRedBg = Color(0xFFCF2A27);
  static const Color buttonBlueBg = Color(0xFF1A9CEB);
  static const Color buttonBorderBg = Color(0xFF7683AE);
  static const Color toggleButtonBgColor = Color(0xFF2D2F35);
  static const Color successToastBg = Color(0xFF0BA85F);
  static const Color errorToastBg = Color(0xFFBC353F);

  static const Color dialogBgColor = Color(0xFFDBDFE6);
  static const Color bottomSheetBgColor = Color(0xFF24272D);

  static const Color textColor = Colors.white;
  static const Color hintTextColor = Color(0xff3E4146);
  static const Color SecondTextColor = Color(0xff61606A);
  static const Color descriptionTextColor = Color(0xff999DA3);
  static const Color errorColor = Color(0xffEF2E2E);
  static const Color dividerColor = Color(0xff2E3239);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const Color boxShadowColor = Color(0xff707070);
  static const Color dropDownItemIconColor = Color(0xff737475);
  static const Color greyTrophyColor = Color(0xFF7E8187);
  static const Color greenTrophyColor = Color(0xFF0BA85F);

  static const Color textGreenColor = Color(0xff0BA85F);
  static const Color textLightGreyColor = Color(0xff999DA3);

  static const String fontName = 'Roboto';

  static double appBarHeight = AppBar().preferredSize.height;
  static double appBarWidth = AppBar().preferredSize.height + 40;

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    letterSpacing: 0.18,
    color: white,
  );

  static const TextStyle body1 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    letterSpacing: 0,
    color: descriptionTextColor,
  );

  static const TextStyle body2 = TextStyle(
    // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0,
    color: descriptionTextColor,
  );

  static const TextStyle button = TextStyle(
    // h4 -> display1
    fontFamily: fontName,
    letterSpacing: 0.4,
    height: 0.9,
    color: white,
  );

  static const TextTheme textTheme = TextTheme(
    title: title,
    body1: body1,
    body2: body2,
    button: button,
  );



  static FloatingActionButtonThemeData floatingActionButtonThemeData =
  FloatingActionButtonThemeData(
    backgroundColor: buttonBlueBg,
    splashColor: Colors.transparent,
    hoverColor: Colors.white,
    focusColor: Colors.transparent,
  );

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        width: 0,
        style: BorderStyle.none,
      ),
    ),
    contentPadding: EdgeInsets.only(left: 19.0),
    fillColor: editTextBgColor,
    filled: true,
    hintStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'Inter',
        color: hintTextColor == null
            ? Colors.white.withOpacity(0.58)
            : hintTextColor),
    hasFloatingPlaceholder: false,
  );

  static ThemeData appThemeData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    accentColor: accentColor,
    buttonColor: secondaryColor,
    cardColor: accentColor,
    backgroundColor: backgroundColor,
    dialogBackgroundColor: dialogBgColor,
    hintColor: hintTextColor,
    dividerColor: dividerColor,
    brightness: Brightness.light,
    errorColor: errorColor,
    fontFamily: fontName,
    textTheme: textTheme,
    platform: TargetPlatform.iOS,
    canvasColor: primaryColor,
    floatingActionButtonTheme: floatingActionButtonThemeData,
    inputDecorationTheme: inputDecorationTheme,
  );
}
