// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/scroll_picker_dialog.dart';

import '../flutter_material_pickers.dart';

/// Allows selection of a number via a slot machine carousel
Future<int?> showMaterialNumberPicker({
  required BuildContext context,

  /// The title for the dialog box
  String? title,

  /// The lowest or starting number for the selections
  required final int minNumber,

  /// The highest or max number for the selections
  required final int maxNumber,

  /// The number to begin on
  final int? selectedNumber,

  /// The number step, in case you don't to skip ranges.
  final int step = 1,

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

  /// Function that gets called when the value is changed
  ValueChanged<int>? onChanged,

  /// Function that gets called when the confirm button is pressed
  VoidCallback? onConfirmed,

  /// Function that gets called when the cancel button is pressed
  VoidCallback? onCancelled,

  /// Function that is called when each items renders which can be used to transform the content
  /// This is helpful, for example, to provide translations to other languages
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
