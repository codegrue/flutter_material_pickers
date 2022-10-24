// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/checkbox_picker.dart';

import '../flutter_material_pickers.dart';
import '../interfaces/common_dialog_properties.dart';
import 'responsive_dialog.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class CheckboxPickerDialog<T> extends StatefulWidget
    implements ICommonDialogProperties {
  CheckboxPickerDialog(
      {this.title,
      required this.items,
      required this.selectedItems,
      this.transformer,
      this.headerColor,
      this.headerTextColor,
      this.backgroundColor,
      this.buttonTextColor,
      this.maxLongSide,
      this.maxShortSide,
      this.confirmText,
      this.cancelButtonVisible = true,
      this.cancelText,
      this.onSelectionChanged,
      this.selectAllConfig});

  // Variables
  final List<T> items;
  final List<T>? selectedItems;
  final Transformer<T>? transformer;
  @override
  final String? title;
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
  final ValueChanged<List<T>>? onSelectionChanged;
  final SelectAllConfig? selectAllConfig;
  final bool cancelButtonVisible;

  @override
  State<CheckboxPickerDialog> createState() =>
      _CheckboxPickerDialogState<T>(selectedItems);
}

class _CheckboxPickerDialogState<T> extends State<CheckboxPickerDialog<T>> {
  _CheckboxPickerDialogState(List<T>? selectedItems) {
    // make a shallow copy so we don't modify the original list
    this.selectedItems = (selectedItems == null)
        ? List<T>.empty(growable: true)
        : List<T>.from(selectedItems);
  }

  late List<T> selectedItems;

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
      cancelButtonVisible: widget.cancelButtonVisible,
      child: CheckboxPicker<T>(
        items: widget.items,
        selectedItems: selectedItems,
        transformer: widget.transformer,
        onSelectionChanged: widget.onSelectionChanged,
        selectAllConfig: widget.selectAllConfig,
      ),
      okPressed: () => Navigator.of(context).pop(selectedItems),
    );
  }
}
