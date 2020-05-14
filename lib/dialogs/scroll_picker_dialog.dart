// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/scroll_picker.dart';

import 'responsive_dialog.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class ScrollPickerDialog extends StatefulWidget {
  ScrollPickerDialog({
    this.title,
    this.items,
    this.initialItem,
    this.headerColor,
    this.headerTextColor,
    this.backgroundColor,
    this.buttonTextColor,
    this.maxLongSide,
    this.maxShortSide,
  });

  // Variables
  final List<String> items;
  final String initialItem;
  final String title;
  final Color headerColor;
  final Color headerTextColor;
  final Color backgroundColor;
  final Color buttonTextColor;
  final double maxLongSide;
  final double maxShortSide;

  @override
  State<ScrollPickerDialog> createState() =>
      _ScrollPickerDialogState(initialItem);
}

class _ScrollPickerDialogState extends State<ScrollPickerDialog> {
  _ScrollPickerDialogState(this.selectedItem);

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
      maxLongSide: widget.maxLongSide,
      maxShortSide: widget.maxLongSide,
      child: ScrollPicker(
        items: widget.items,
        initialValue: selectedItem,
        onChanged: (value) => setState(() => selectedItem = value),
      ),
      okPressed: () => Navigator.of(context).pop(selectedItem),
    );
  }
}
