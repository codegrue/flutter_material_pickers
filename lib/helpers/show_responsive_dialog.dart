// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/responsive_dialog.dart';

/// Extends Dialog by making it responsive to screen orientation changes
Future<T?> showMaterialResponsiveDialog<T>({
  required BuildContext context,
  String? title,
  Widget? child,
  Color? headerColor,
  Color? headerTextColor,
  Color? backgroundColor,
  Color? buttonTextColor,
  String? confirmText,
  String? cancelText,
  double? maxLongSide,
  double? maxShortSide,
  bool hideButtons = false,
  VoidCallback? onConfirmed,
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
