// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// This helper widget manages a scrollable checkbox list inside a picker widget.
class CheckboxPicker extends StatefulWidget {
  CheckboxPicker({
    Key? key,
    required this.items,
    required this.values,
    required this.selectedValues,
  }) : super(key: key);

  // Constants
  static const double defaultItemHeight = 40.0;

  // Variables
  final List<String> items;
  final List<String> values;
  final List<String> selectedValues;

  @override
  CheckboxPickerState createState() {
    return CheckboxPickerState(selectedValues);
  }
}

class CheckboxPickerState extends State<CheckboxPicker> {
  CheckboxPickerState(this.selectedValues);

  List<String> selectedValues;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    int itemCount = widget.items.length;

    return Container(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            bool isSelected = selectedValues.contains(widget.values[index]);

            return CheckboxListTile(
              activeColor: theme.accentColor,
              checkColor: theme.dialogBackgroundColor,
              title: Text(
                widget.items[index],
                style: (isSelected)
                    ? TextStyle(color: theme.accentColor)
                    : TextStyle(color: theme.textTheme.bodyText2?.color),
              ),
              value: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedValues.add(widget.values[index]);
                  } else {
                    selectedValues.remove(widget.values[index]);
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }
}
