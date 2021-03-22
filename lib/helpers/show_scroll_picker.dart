// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/scroll_picker_dialog.dart';

/// Allows selection of a string via a slot machine carousel
Future<T?> showMaterialScrollPicker<T>({
  required BuildContext context,
  String? title,
  required List<T> items,
  required T selectedItem,
  Color? headerColor,
  Color? headerTextColor,
  Color? backgroundColor,
  Color? buttonTextColor,
  String? confirmText,
  String? cancelText,
  double? maxLongSide,
  double? maxShortSide,
  bool showDivider: true,
  ValueChanged<T>? onChanged,
  VoidCallback? onConfirmed,
  VoidCallback? onCancelled,
}) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return ScrollPickerDialog<T>(
        items: items,
        title: title,
        initialItem: selectedItem,
        headerColor: headerColor,
        headerTextColor: headerTextColor,
        backgroundColor: backgroundColor,
        buttonTextColor: buttonTextColor,
        confirmText: confirmText,
        cancelText: cancelText,
        maxLongSide: maxLongSide,
        maxShortSide: maxLongSide,
        showDivider: showDivider,
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
    if (onCancelled != null && selection == null) onCancelled();
    if (onConfirmed != null && selection != null) onConfirmed();
    return selection;
  });
}
