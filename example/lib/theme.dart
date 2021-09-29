import 'package:flutter/material.dart';

ThemeData buildTheme(Brightness brightness) {
  var theme = ThemeData(
    primarySwatch: Colors.indigo,
    brightness: brightness,
  ); // app background color

  // extract auto generated colors
  Color primaryColor = theme.primaryColor;
  Color backgroundColor = theme.backgroundColor;
  Color accentColor = theme.colorScheme.secondary;
  Color textColor = theme.textTheme.headline1!.color!;
  Color headerTextColor = textColor;

  // override colors for light themes
  if (brightness == Brightness.light) {
    backgroundColor = Colors.green[100]!;
    primaryColor = Colors.green;
    accentColor = Colors.green[900]!;
    textColor = Colors.green[700]!;
    headerTextColor = Colors.lightGreen[50]!;
  }

  theme = theme.copyWith(
    primaryColor: primaryColor, // background color of the header area
    backgroundColor: backgroundColor,
    colorScheme: theme.colorScheme.copyWith(
      primary: primaryColor, // new way to do title color
      surface: backgroundColor, // new way to do background color
      secondary: accentColor, // color of controls and button bar text
    ),
    dialogBackgroundColor: backgroundColor, // background color of the dialog
    primaryTextTheme: theme.primaryTextTheme.copyWith(
      headline6: theme.primaryTextTheme.headline6?.copyWith(
        color: headerTextColor, // text color of the header area
      ),
    ),
    textTheme: theme.textTheme.copyWith(
      bodyText2: theme.textTheme.bodyText2?.copyWith(
        color: textColor, // text color of dialog text
      ),
      button: theme.textTheme.button?.copyWith(
        color: textColor, // text color of the action bar buttons
      ),
    ),
    timePickerTheme: theme.timePickerTheme.copyWith(
      backgroundColor: backgroundColor,
    ),
  );

  return theme;
}
