// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/scroll_picker_dialog.dart';

/// Allows selection of a string via a slot machine carousel
void showMaterialScrollPicker({
  BuildContext context,
  String title,
  List<String> items,
  String selectedItem,
  Color headerColor,
  Color headerTextColor,
  Color backgroundColor,
  Color buttonTextColor,
  double maxLongSide,
  double maxShortSide,
  ValueChanged<String> onChanged,
}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return ScrollPickerDialog(
        items: items,
        title: title,
        initialItem: selectedItem,
        headerColor: headerColor,
        headerTextColor: headerTextColor,
        backgroundColor: backgroundColor,
        buttonTextColor: buttonTextColor,
        maxLongSide: maxLongSide,
        maxShortSide: maxLongSide,
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}
