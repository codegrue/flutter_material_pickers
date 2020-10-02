// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter_material_pickers/pickers/checkbox_picker.dart';
import 'package:flutter/material.dart';

import 'responsive_dialog.dart';
import '../interfaces/common_dialog_properties.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class CheckboxPickerDialog extends StatefulWidget
    implements ICommonDialogProperties {
  CheckboxPickerDialog({
    this.title,
    this.items,
    this.initialItems,
    this.headerColor,
    this.headerTextColor,
    this.backgroundColor,
    this.buttonTextColor,
    this.maxLongSide,
    this.maxShortSide,
    this.confirmText,
    this.cancelText,
    this.customDialogBuilder
  });

  // Variables
  final List<String> items;
  final List<String> initialItems;
  @override
  final String title;
  @override
  final Color headerColor;
  @override
  final Color headerTextColor;
  @override
  final Color backgroundColor;
  @override
  final Color buttonTextColor;
  @override
  final double maxLongSide;
  @override
  final double maxShortSide;
  @override
  final String confirmText;
  @override
  final String cancelText;
  @override 
  final CustomDialogBuilder customDialogBuilder;

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
      confirmText: widget.confirmText,
      cancelText: widget.cancelText,
      child: CheckboxPicker(
        items: widget.items,
        initialItems: selectedItems,
      ),
      okPressed: () => Navigator.of(context).pop(selectedItems),
      customDialogBuilder: widget.customDialogBuilder,
    );
  }
}
