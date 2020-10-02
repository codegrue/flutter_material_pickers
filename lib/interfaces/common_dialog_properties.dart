import 'package:flutter/material.dart';

typedef CustomDialogBuilder = Widget Function(
  {
    BuildContext context, 
    Widget child,
    String title,
    Color headerColor,
    Color headerTextColor,
    Color backgroundColor,
    Color buttonTextColor,
    double maxLongSide,
    double maxShortSide,
    String confirmText,
    String cancelText,
    VoidCallback okPressed
  }
);

abstract class ICommonDialogProperties {
  final String title = null;
  final Color headerColor = null;
  final Color headerTextColor = null;
  final Color backgroundColor = null;
  final Color buttonTextColor = null;
  final double maxLongSide = null;
  final double maxShortSide = null;
  final String confirmText = null;
  final String cancelText = null;
  final CustomDialogBuilder customDialogBuilder = null;
}
