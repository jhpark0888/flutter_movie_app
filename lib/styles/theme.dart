import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_movies/styles/color.dart';
import 'package:flutter_bloc_movies/styles/textstyle.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorsStyle.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsStyle.black)),
    canvasColor: ColorsStyle.black,
    textTheme: textTheme.apply(bodyColor: ColorsStyle.black),
  );

  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorsStyle.black,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsStyle.white)),
    canvasColor: ColorsStyle.black,
    textTheme: textTheme.apply(bodyColor: ColorsStyle.white),
  );

  static TextTheme textTheme = TextTheme(
    headline1: TextStyles.header,
    bodyText1: TextStyles.body,
    caption: TextStyles.caption,
  );
}
