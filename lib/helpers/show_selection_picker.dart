// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/selection_picker_dialog.dart';

import '../flutter_material_pickers.dart';

/// Allows selection of a single value via an icon label list
Future<T?> showMaterialSelectionPicker<T>({
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
  ValueChanged<T>? onChanged,
  VoidCallback? onConfirmed,
  VoidCallback? onCancelled,
  Transformer<T>? transformer,
  Iconizer<T>? iconizer,
}) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return SelectionPickerDialog<T>(
        items: items,
        title: title,
        selectedItem: selectedItem,
        headerColor: headerColor,
        headerTextColor: headerTextColor,
        backgroundColor: backgroundColor,
        buttonTextColor: buttonTextColor,
        confirmText: confirmText,
        cancelText: cancelText,
        maxLongSide: maxLongSide,
        maxShortSide: maxLongSide,
        transformer: transformer,
        iconizer: iconizer,
      );
    },
  ).then((selection) {
    if (selection != null) {
      onChanged?.call(selection);
      onConfirmed?.call();
    } else {
      onCancelled?.call();
    }
    return selection;
  });
}
