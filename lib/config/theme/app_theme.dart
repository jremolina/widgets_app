import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.red,
  Colors.deepOrange,
  Colors.green,
];

class AppTheme {
  final int selectedColor;
  final bool isdarkMode;

  AppTheme({this.selectedColor = 0,
  this.isdarkMode = false})
      : assert(selectedColor >= 0 && selectedColor < colorList.length);

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: isdarkMode ? Brightness.light : Brightness.dark,
      colorSchemeSeed: colorList[selectedColor],
    );
  }
}
