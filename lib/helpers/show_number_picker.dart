// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/scroll_picker_dialog.dart';

/// Allows selection of a number via a slot machine carousel
void showMaterialNumberPicker({
  BuildContext context,
  String title,
  @required
  final int minNumber,
  @required
  final int maxNumber,
  final int selectedNumber,
  final int step = 1,
  Color headerColor,
  Color headerTextColor,
  Color backgroundColor,
  Color buttonTextColor,
  String confirmText,
  String cancelText,
  double maxLongSide,
  double maxShortSide,
  ValueChanged<int> onChanged,
  VoidCallback onConfirmed,
  VoidCallback onCancelled,
}) {
  List<String> items = [];

  for(int i = minNumber; i <= maxNumber; i += step){
    items.add(i.toString());
  }

  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return ScrollPickerDialog(
        items: items,
        title: title,
        initialItem: selectedNumber.toString(),
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
    if (onChanged != null && selection != null) onChanged(int.parse(selection));
    if (onCancelled != null && selection == null) onCancelled();
    if (onConfirmed != null && selection != null) onConfirmed();
  });
}
