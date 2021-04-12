// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/selection_picker.dart';

import 'responsive_dialog.dart';
import '../interfaces/common_dialog_properties.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class SelectionPickerDialog extends StatefulWidget
    implements ICommonDialogProperties {
  SelectionPickerDialog({
    this.title,
    required this.items,
    required this.values,
    required this.initialValue,
    this.icons,
    this.headerColor,
    this.headerTextColor,
    this.backgroundColor,
    this.buttonTextColor,
    this.maxLongSide,
    this.maxShortSide,
    this.confirmText,
    this.cancelText,
  });

  final List<String> items;
  final List<String> values;
  final String initialValue;
  @override
  final String? title;
  final List<Icon>? icons;
  @override
  final Color? headerColor;
  @override
  final Color? headerTextColor;
  @override
  final Color? backgroundColor;
  @override
  final Color? buttonTextColor;
  @override
  final double? maxLongSide;
  @override
  final double? maxShortSide;
  @override
  final String? confirmText;
  @override
  final String? cancelText;

  @override
  State<SelectionPickerDialog> createState() =>
      _SelectionPickerDialogState(initialValue);
}

class _SelectionPickerDialogState extends State<SelectionPickerDialog> {
  _SelectionPickerDialogState(this.selectedValue);

  String selectedValue;

  @override
  Widget build(BuildContext context) {
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
      child: SelectionPicker(
        items: widget.items,
        values: widget.values,
        initialValue: selectedValue,
        icons: widget.icons,
        onChanged: (value) => setState(() => selectedValue = value),
      ),
      okPressed: () => Navigator.of(context).pop(selectedValue),
    );
  }
}
