// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/selection_picker.dart';

import 'responsive_dialog.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class SelectionPickerDialog extends StatefulWidget {
  SelectionPickerDialog({
    this.title,
    @required this.items,
    @required this.initialItem,
    this.icons,
    this.headerColor,
    this.headerTextColor,
    this.backgroundColor,
    this.buttonTextColor,
  });

  // Variables
  final List<String> items;
  final String initialItem;
  final String title;
  final List<Icon> icons;
  final Color headerColor;
  final Color headerTextColor;
  final Color backgroundColor;
  final Color buttonTextColor;

  @override
  State<SelectionPickerDialog> createState() =>
      _SelectionPickerDialogState(initialItem);
}

class _SelectionPickerDialogState extends State<SelectionPickerDialog> {
  _SelectionPickerDialogState(this.selectedItem);

  String selectedItem;

  @override
  Widget build(BuildContext context) {
    assert(context != null);

    return ResponsiveDialog(
      context: context,
      title: widget.title,
      headerColor: widget.headerColor,
      headerTextColor: widget.headerTextColor,
      backgroundColor: widget.backgroundColor,
      buttonTextColor: widget.buttonTextColor,
      child: SelectionPicker(
        items: widget.items,
        initialItem: selectedItem,
        icons: widget.icons,
        onChanged: (value) => setState(() => selectedItem = value),
      ),
      okPressed: () => Navigator.of(context).pop(selectedItem),
    );
  }
}
