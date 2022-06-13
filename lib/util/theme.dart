
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:krss/util/style.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: scaffoldColor,
    fontFamily: "Muli",
    textTheme: textTheme(),
    appBarTheme: appBarTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: kTextColor), systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}