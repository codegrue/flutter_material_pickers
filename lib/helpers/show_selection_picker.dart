// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/selection_picker_dialog.dart';

void showMaterialSelectionPicker({
  BuildContext context,
  String title,
  List<String> items,
  String selectedItem,
  List<Icon> icons,
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
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}
