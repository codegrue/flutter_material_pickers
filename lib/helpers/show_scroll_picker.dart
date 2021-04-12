// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/scroll_picker_dialog.dart';

/// Allows selection of a string via a slot machine carousel
void showMaterialScrollPicker({
  required BuildContext context,
  String? title,
  required List<String> items,
  List<String>? values,
  String? selectedValue,
  Color? headerColor,
  Color? headerTextColor,
  Color? backgroundColor,
  Color? buttonTextColor,
  String? confirmText,
  String? cancelText,
  double? maxLongSide,
  double? maxShortSide,
  bool showDivider: true,
  ValueChanged<String>? onChanged,
  VoidCallback? onConfirmed,
  VoidCallback? onCancelled,
}) {
  assert(values == null || items.length == values.length);

  if (values == null) values = items;

  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return ScrollPickerDialog(
        items: items,
        values: values!,
        title: title,
        initialValue: selectedValue,
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
  });
}
