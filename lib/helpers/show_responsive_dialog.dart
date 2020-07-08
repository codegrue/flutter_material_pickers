// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/responsive_dialog.dart';

/// Extends Dialog by making it responsive to screen orientation changes
void showMaterialResponsiveDialog({
  BuildContext context,
  String title,
  Widget child,
  Color headerColor,
  Color headerTextColor,
  Color backgroundColor,
  Color buttonTextColor,
  String confirmText,
  String cancelText,
  double maxLongSide,
  double maxShortSide,
  bool hideButtons = false,
  ValueChanged<List<String>> onChanged,
}) {
  showDialog<List<String>>(
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
        maxShortSide: maxLongSide,
        hideButtons: hideButtons,
        child: child,
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}
