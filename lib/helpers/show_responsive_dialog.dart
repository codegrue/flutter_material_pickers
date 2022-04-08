// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/responsive_dialog.dart';

/// Extends Dialog by making it responsive to screen orientation changes
Future<T?> showMaterialResponsiveDialog<T>({
  required BuildContext context,

  /// The title for the dialog box
  String? title,

  /// The content to place inside the dialog
  Widget? child,

  /// Don't include the buttons
  bool hideButtons = false,

  /// The dialog header color (overrides theme)
  Color? headerColor,

  /// The dialog header text color (overrides theme)
  Color? headerTextColor,

  /// The dialog background color (overrides theme)
  Color? backgroundColor,

  /// The button text color (overrides theme)
  Color? buttonTextColor,

  /// Text to display in the confirm button
  String? confirmText,

  /// Text to display in the cancel button
  String? cancelText,

  /// Used to restrict how tall the dialog can be.
  double? maxLongSide,

  /// Used to restrict how wide the dialog can be.
  double? maxShortSide,

  /// Function that gets called when the confirm button is pressed
  VoidCallback? onConfirmed,

  /// Function that gets called when the cancel button is pressed
  VoidCallback? onCancelled,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: hideButtons,
    builder: (BuildContext context) {
      return ResponsiveDialog(
        context: context,
        title: title,
        headerColor: headerColor,
        headerTextColor: headerTextColor,
        backgroundColor: backgroundColor,
        buttonTextColor: buttonTextColor,
        confirmText: confirmText,
        cancelText: cancelText,
        maxLongSide: maxLongSide,
        maxShortSide: maxShortSide,
        hideButtons: hideButtons,
        child: child,
        okPressed: () {
          if (onConfirmed != null) onConfirmed();
          Navigator.of(context).pop();
        },
        cancelPressed: () {
          if (onCancelled != null) onCancelled();
          Navigator.of(context).pop();
        },
      );
    },
  );
}
