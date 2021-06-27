import 'package:flutter/material.dart';

class ThemeManager {
  static getThemes() {
    return ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,

      brightness: Brightness.light,
      primaryColor: Colors.green,
      accentColor: Colors.deepOrangeAccent,
      fontFamily: 'Georgia',

      //text styling
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );
  }
}
