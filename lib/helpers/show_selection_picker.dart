// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/selection_picker_dialog.dart';

/// Allows selection of a single value via an icon label list
void showMaterialSelectionPicker({
  BuildContext context,
  String title,
  List<String> items,
  String selectedItem,
  List<Icon> icons,
  Color headerColor,
  Color headerTextColor,
  Color backgroundColor,
  Color buttonTextColor,
  ValueChanged<String> onChanged,
}) {
  assert(items != null);
  assert(icons == null || items.length == icons.length);

  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SelectionPickerDialog(
        items: items,
        title: title,
        initialItem: selectedItem,
        icons: icons,
        headerColor: headerColor,
        headerTextColor: headerTextColor,
        backgroundColor: backgroundColor,
        buttonTextColor: buttonTextColor,
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}
