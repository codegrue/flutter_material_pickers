// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/checkbox_picker_dialog.dart';

/// Allows selection of many values from a checkbox list.
void showMaterialCheckboxPicker({
  BuildContext context,
  String title,
  List<String> items,
  List<String> selectedItems,
  ValueChanged<List<String>> onChanged,
}) {
  showDialog<List<String>>(
    context: context,
    builder: (BuildContext context) {
      return CheckboxPickerDialog(
        title: title,
        items: items,
        initialItems: selectedItems,
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}
