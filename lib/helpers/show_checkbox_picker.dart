// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/checkbox_picker_dialog.dart';
import 'package:flutter_material_pickers/models/select_all_config.dart';

import '../flutter_material_pickers.dart';

/// Allows selection of many values from a checkbox list.
Future<List<T>?> showMaterialCheckboxPicker<T>({
  required BuildContext context,

  /// The title for the dialog box
  String? title,

  /// The list of items to use with the picker
  required List<T> items,

  /// The item that will be initially selected
  List<T>? selectedItems,

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

  /// Whether to display a cancel button
  bool cancellable = true,

  /// Text to display in the cancel button
  String? cancelText,

  /// Used to restrict how tall the dialog can be.
  double? maxLongSide,

  /// Used to restrict how wide the dialog can be.
  double? maxShortSide,

  /// Function that gets called when the value is changed
  ValueChanged<List<T>>? onChanged,

  /// Function that gets called each time the selection changes
  ValueChanged<List<T>>? onSelectionChanged,

  /// If enabled, adds a Select All / Deselect All button at the top
  SelectAllConfig? selectAllConfig,

  /// Function that gets called when the confirm button is pressed
  VoidCallback? onConfirmed,

  /// Function that gets called when the cancel button is pressed
  VoidCallback? onCancelled,

  /// Function that is called when each items renders which can be used to transform the content
  /// This is helpful, for example, to provide translations to other languages
  Transformer<T>? transformer,
}) {
  return showDialog<List<T>>(
    context: context,
    barrierDismissible: cancellable,
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
        onSelectionChanged: onSelectionChanged,
        selectAllConfig: selectAllConfig,
        cancelButtonVisible: cancellable,
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
