import 'package:flutter/material.dart';

ThemeData buildTheme(Brightness brightness) {
  var theme = ThemeData(
    primarySwatch: Colors.indigo,
    brightness: brightness,
  ); // app background color

  // extract auto generated colors
  Color primaryColor = theme.primaryColor;
  Color backgroundColor = theme.colorScheme.background;
  Color accentColor = theme.colorScheme.secondary;
  Color textColor = theme.textTheme.displayLarge!.color!;
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
    primaryColor: primaryColor,
    dialogBackgroundColor: backgroundColor, // background color of the dialog
    primaryTextTheme: theme.primaryTextTheme.copyWith(
      titleLarge: theme.primaryTextTheme.titleLarge?.copyWith(
        color: headerTextColor, // text color of the header area
      ),
    ),
    textTheme: theme.textTheme.copyWith(
      bodyMedium: theme.textTheme.bodyMedium?.copyWith(
        color: textColor, // text color of dialog text
      ),
      labelLarge: theme.textTheme.labelLarge?.copyWith(
        color: textColor, // text color of the action bar buttons
      ),
    ),
    timePickerTheme: theme.timePickerTheme.copyWith(
      backgroundColor: backgroundColor,
    ), colorScheme: theme.colorScheme.copyWith(
      primary: primaryColor, // new way to do title color
      surface: backgroundColor, // new way to do background color
      secondary: accentColor, // color of controls and button bar text
    ).copyWith(background: backgroundColor),
  );

  return theme;
}
