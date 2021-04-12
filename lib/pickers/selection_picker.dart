// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// This helper widget manages a scrollable checkbox list inside a picker widget.
class SelectionPicker extends StatefulWidget {
  SelectionPicker({
    Key? key,
    required this.items,
    required this.values,
    required this.initialValue,
    required this.onChanged,
    this.icons,
  }) : super(key: key);

  // Constants
  static const double defaultItemHeight = 40.0;

  // Events
  final ValueChanged<String> onChanged;

  // Variables
  final List<String> items;
  final List<String> values;
  final String initialValue;
  final List<Icon>? icons;

  @override
  SelectionPickerState createState() {
    return SelectionPickerState(initialValue);
  }
}

class SelectionPickerState extends State<SelectionPicker> {
  SelectionPickerState(this.selectedValue);

  String selectedValue;

  @override
  Widget build(BuildContext context) {
    int itemCount = widget.items.length;
    var theme = Theme.of(context);

    return Container(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            bool isSelected = (widget.values[index] == selectedValue);
            Color? itemColor = (isSelected)
                ? theme.accentColor
                : theme.textTheme.bodyText2?.color;
            Icon? icon = (widget.icons == null) ? null : widget.icons?[index];
            if (icon != null && icon.color == null)
              icon = Icon(icon.icon, color: itemColor);

            return ListTile(
              leading: icon,
              title: Text(
                widget.items[index],
                style: TextStyle(color: itemColor),
              ),
              trailing:
                  (isSelected) ? Icon(Icons.check, color: itemColor) : null,
              onTap: () {
                setState(() {
                  selectedValue = widget.values[index];
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
