// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/checkbox_picker_dialog.dart';

import '../flutter_material_pickers.dart';

/// Allows selection of many values from a checkbox list.
Future<List<T>?> showMaterialCheckboxPicker<T>({
  required BuildContext context,
  String? title,
  required List<T> items,
  List<T>? selectedItems,
  Color? headerColor,
  Color? headerTextColor,
  Color? backgroundColor,
  Color? buttonTextColor,
  String? confirmText,
  String? cancelText,
  double? maxLongSide,
  double? maxShortSide,
  ValueChanged<List<T>>? onChanged,
  VoidCallback? onConfirmed,
  VoidCallback? onCancelled,
  Transformer<T>? transformer,
}) {
  return showDialog<List<T>>(
    context: context,
    builder: (BuildContext context) {
      return CheckboxPickerDialog<T>(
        title: title,
        items: items,
        selectedItems: selectedItems,
        headerColor: headerColor,
        headerTextColor: headerTextColor,
        backgroundColor: backgroundColor,
        buttonTextColor: buttonTextColor,
        confirmText: confirmText,
        cancelText: cancelText,
        maxLongSide: maxLongSide,
        maxShortSide: maxLongSide,
        transformer: transformer,
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
