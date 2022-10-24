// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/pickers/scroll_picker.dart';

import '../flutter_material_pickers.dart';
import '../interfaces/common_dialog_properties.dart';
import 'responsive_dialog.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class ScrollPickerDialog<T> extends StatefulWidget
    implements ICommonDialogProperties {
  ScrollPickerDialog({
    this.title,
    required this.items,
    required this.selectedItem,
    this.transformer,
    this.headerColor,
    this.headerTextColor,
    this.backgroundColor,
    this.buttonTextColor,
    this.maxLongSide,
    this.maxShortSide,
    this.showDivider: true,
    this.confirmText,
    this.cancelText,
    this.cancelButtonVisible = true,
  });

  // Variables
  final List<T> items;
  final T? selectedItem;
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
  final bool cancelButtonVisible;

  final bool showDivider;

  @override
  State<ScrollPickerDialog> createState() =>
      _ScrollPickerDialogState<T>(selectedItem ?? items[0]);
}

class _ScrollPickerDialogState<T> extends State<ScrollPickerDialog<T>> {
  _ScrollPickerDialogState(this.selectedItem);

  T selectedItem;

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
      child: ScrollPicker<T>(
        items: widget.items,
        selectedItem: selectedItem,
        showDivider: widget.showDivider,
        onChanged: (value) => setState(() => selectedItem = value),
        transformer: widget.transformer,
      ),
      okPressed: () => Navigator.of(context).pop(selectedItem),
    );
  }
}
