// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/material_picker.dart';
import 'package:flutter_material_pickers/dialogs/responsive_dialog.dart';

const double _kPickerHeaderPortraitHeight = 60.0;

void showMaterialPalettePicker({
  BuildContext context,
  String title = "Pick a color",
  Color selectedColor,
  ValueChanged<Color> onChanged,
}) {
  showDialog<Color>(
    context: context,
    builder: (BuildContext context) {
      return OrientationBuilder(
        builder: (context, orientation) {
          return ResponsiveDialog(
            context: context,
            title: title,
            child: MaterialPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) => selectedColor = color,
              enableLabel: true, // only on portrait mode
            ),
          );
        },
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}
