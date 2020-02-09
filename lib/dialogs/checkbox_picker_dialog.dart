// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter_material_pickers/pickers/checkbox_picker.dart';
import 'package:flutter/material.dart';

import 'empty_content_dialog.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class CheckboxPickerDialog extends StatefulWidget {
  CheckboxPickerDialog({
    this.title,
    this.items,
    this.initialItems,
  });

  // Variables
  final List<String> items;
  final List<String> initialItems;
  final String title;

  @override
  State<CheckboxPickerDialog> createState() =>
      _CheckboxPickerDialogState(initialItems);
}

class _CheckboxPickerDialogState extends State<CheckboxPickerDialog> {
  _CheckboxPickerDialogState(List<String> initialItems) {
    // make a shallow copy so we don't modify the original list
    selectedItems = List<String>.from(initialItems);
  }

  List<String> selectedItems;

  void valueChanged(List<String> value) {
    setState(() => selectedItems = value);
  }

  void dialogClosed(bool saveChanges) {
    if (saveChanges)
      Navigator.of(context).pop(selectedItems);
    else
      Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    assert(context != null);

    return EmptyContentDialog(
      context: context,
      child: CheckboxPicker(
        items: widget.items,
        initialItems: selectedItems,
        onChanged: valueChanged,
      ),
      dialogClosed: (value) => dialogClosed(value),
    );
  }
}
