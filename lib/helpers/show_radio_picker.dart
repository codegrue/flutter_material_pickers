// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/radio_picker_dialog.dart';

import '../flutter_material_pickers.dart';

/// Allows selection of a single from a radio list
Future<T?> showMaterialRadioPicker<T>({
  required BuildContext context,
  String? title,
  required List<T> items,
  T? selectedItem,
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
}) {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return RadioPickerDialog<T>(
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
