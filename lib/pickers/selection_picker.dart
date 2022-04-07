// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../flutter_material_pickers.dart';

/// This helper widget manages a scrollable checkbox list inside a picker widget.
class SelectionPicker<T> extends StatefulWidget {
  SelectionPicker({
    Key? key,
    required this.items,
    required this.initialValue,
    required this.onChanged,
    this.transformer,
    this.iconizer,
  }) : super(key: key);

  // Constants
  static const double defaultItemHeight = 40.0;

  // Events
  final ValueChanged<T> onChanged;

  // Variables
  final List<T> items;
  final T initialValue;

  // Callbacks
  final Transformer<T>? transformer;
  final Iconizer<T>? iconizer;

  @override
  SelectionPickerState<T> createState() {
    return SelectionPickerState(initialValue);
  }
}

class SelectionPickerState<T> extends State<SelectionPicker<T>> {
  SelectionPickerState(this.selectedValue);

  T selectedValue;

  @override
  Widget build(BuildContext context) {
    int itemCount = widget.items.length;
    var theme = Theme.of(context);

    return Container(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            T item = widget.items[index];
            bool isSelected = (item == selectedValue);
            Color? itemColor = (isSelected)
                ? theme.colorScheme.secondary
                : theme.textTheme.bodyText2?.color;
            Icon? icon = widget.iconizer?.call(item);
            if (icon != null && icon.color == null)
              icon = Icon(icon.icon, color: itemColor);

            return ListTile(
              leading: icon,
              title: Text(
                widget.transformer?.call(item) ?? '$item',
                style: TextStyle(color: itemColor),
              ),
              trailing:
                  (isSelected) ? Icon(Icons.check, color: itemColor) : null,
              onTap: () {
                setState(() {
                  selectedValue = widget.items[index];
                  widget.onChanged(selectedValue);
                });
              },
            );
          },
        ),
      ),
    );
  }
}
