// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// This helper widget manages a scrollable checkbox list inside a picker widget.
class CheckboxPicker extends StatefulWidget {
  CheckboxPicker({
    Key key,
    @required this.items,
    @required this.initialItems,
  })  : assert(items != null),
        super(key: key);

  // Constants
  static const double defaultItemHeight = 40.0;

  // Variables
  final List<String> items;
  final List<String> initialItems;

  @override
  CheckboxPickerState createState() {
    return CheckboxPickerState(initialItems);
  }
}

class CheckboxPickerState extends State<CheckboxPicker> {
  CheckboxPickerState(this.selectedValues);

  List<String> selectedValues;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    if (selectedValues == null) selectedValues = List<String>();

    int itemCount = widget.items.length;

    return Container(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            bool isSelected = selectedValues.contains(widget.items[index]);

            return CheckboxListTile(
              activeColor: theme.accentColor,
              checkColor: theme.dialogBackgroundColor,
              title: Text(
                widget.items[index],
                style: (isSelected)
                    ? TextStyle(color: theme.accentColor)
                    : TextStyle(color: theme.textTheme.body1.color),
              ),
              value: isSelected,
              onChanged: (bool value) {
                setState(() {
                  if (value == true) {
                    selectedValues.add(widget.items[index]);
                  } else {
                    selectedValues.remove(widget.items[index]);
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
