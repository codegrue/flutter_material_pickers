// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/scroll_picker_dialog.dart';

import '../flutter_material_pickers.dart';

/// Allows selection of a number via a slot machine carousel
Future<int?> showMaterialNumberPicker({
  required BuildContext context,
  String? title,
  required final int minNumber,
  required final int maxNumber,
  final int? selectedNumber,
  final int step = 1,
  Color? headerColor,
  Color? headerTextColor,
  Color? backgroundColor,
  Color? buttonTextColor,
  String? confirmText,
  String? cancelText,
  double? maxLongSide,
  double? maxShortSide,
  ValueChanged<int>? onChanged,
  VoidCallback? onConfirmed,
  VoidCallback? onCancelled,
  Transformer<int>? transformer,
}) {
  List<int> items = [];

  for (int i = minNumber; i <= maxNumber; i += step) {
    items.add(i);
  }

  return showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      return ScrollPickerDialog<int>(
        items: items,
        title: title,
        selectedItem: selectedNumber,
        headerColor: headerColor,
        headerTextColor: headerTextColor,
        backgroundColor: backgroundColor,
        buttonTextColor: buttonTextColor,
        confirmText: confirmText,
        cancelText: cancelText,
        maxLongSide: maxLongSide,
        maxShortSide: maxLongSide,
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
