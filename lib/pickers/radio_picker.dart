// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../flutter_material_pickers.dart';

/// This helper widget manages a scrollable checkbox list inside a picker widget.
class RadioPicker<T> extends StatefulWidget {
  RadioPicker({
    Key? key,
    required this.items,
    this.initialValue,
    required this.onChanged,
    this.transformer,
  }) : super(key: key);

  // Constants
  static const double defaultItemHeight = 40.0;

  // Events
  final ValueChanged<T?> onChanged;

  // Variables
  final List<T> items;
  final T? initialValue;

  // Callbacks
  final Transformer<T>? transformer;

  @override
  RadioPickerState createState() {
    return RadioPickerState<T>(initialValue);
  }
}

class RadioPickerState<T> extends State<RadioPicker<T>> {
  RadioPickerState(this.selectedValue);

  T? selectedValue;

  @override
  Widget build(BuildContext context) {
    int itemCount = widget.items.length;
    var theme = Theme.of(context);

    return Container(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            final item = widget.items[index];
            bool isSelectedItem = item == selectedValue;

            return RadioListTile<T>(
              groupValue: selectedValue,
              activeColor: theme.colorScheme.secondary,
              title: Text(
                widget.transformer?.call(item) ?? '$item',
                style: (isSelectedItem)
                    ? TextStyle(color: theme.colorScheme.secondary)
                    : TextStyle(color: theme.textTheme.bodyText2?.color),
              ),
              value: item,
              onChanged: (T? value) {
                setState(() {
                  selectedValue = value;
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
