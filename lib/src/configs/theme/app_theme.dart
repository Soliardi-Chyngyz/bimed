import 'package:bimed/src/core/resources/colors.dart' as color;
import 'package:bimed/src/core/resources/colors.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
        fontFamily: 'Inter',
        splashColor: color.lightBlue,
        highlightColor: color.secondaryGray.withOpacity(0.5),
        // primarySwatch: ,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
          },
        ),
        unselectedWidgetColor: secondaryGray,
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 24.0, fontWeight: FontWeight.bold, color: titleColor),
            headline2: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: titleColor),
            headline3: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: titleColor),
            headline6: TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic),
            bodyText1: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.normal,
                color: Colors.brown),
            bodyText2: TextStyle(
                color: color.secondaryGray,
                fontSize: 14.0,
                fontWeight: FontWeight.w400),
            button: TextStyle(color: Colors.cyan)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                primary: blue,
                // background color
                onPrimary: Colors.white,
                //text color
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 14))),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1.0, color: color.light),
                primary: purpleDark,
                padding: const EdgeInsets.all(16),
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ))),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          primary: blue,
          textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        )));
  }
}

const smallText = TextStyle(
    color: secondaryGray, fontSize: 15.0, fontWeight: FontWeight.w500);
