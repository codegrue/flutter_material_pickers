import 'package:flutter/material.dart';

abstract class ICommonDialogProperties {
  /// The title for the dialog box
  final String? title = null;

  /// The dialog header color (overrides theme)
  final Color? headerColor = null;

  /// The dialog header text color (overrides theme)
  final Color? headerTextColor = null;

  /// The dialog background color (overrides theme)
  final Color? backgroundColor = null;

  /// The button text color (overrides theme)
  final Color? buttonTextColor = null;

  /// Used to restrict how tall the dialog can be.
  final double? maxLongSide = null;

  /// Used to restrict how wide the dialog can be.
  final double? maxShortSide = null;

  /// Text to display in the confirm button
  final String? confirmText = null;

  /// Text to display in the cancel button
  final String? cancelText = null;
}
