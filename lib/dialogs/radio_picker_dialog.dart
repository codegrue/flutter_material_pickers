// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/radio_picker.dart';

import 'responsive_dialog.dart';
import '../interfaces/common_dialog_properties.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class RadioPickerDialog extends StatefulWidget
    implements ICommonDialogProperties {
  RadioPickerDialog({
    this.title,
    this.items,
    this.initialItem,
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
  final String initialItem;
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
  State<RadioPickerDialog> createState() =>
      _RadioPickerDialogState(initialItem);
}

class _RadioPickerDialogState extends State<RadioPickerDialog> {
  _RadioPickerDialogState(this.selectedItem);

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
      confirmText: widget.confirmText,
      cancelText: widget.cancelText,
      child: RadioPicker(
        items: widget.items,
        initialItem: selectedItem,
        onChanged: (value) => setState(() => selectedItem = value),
      ),
      okPressed: () => Navigator.of(context).pop(selectedItem),
      customDialogBuilder: widget.customDialogBuilder,
    );
  }
}
