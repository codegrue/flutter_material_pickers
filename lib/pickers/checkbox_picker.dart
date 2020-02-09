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
    @required this.onChanged,
    // @required this.height,
    // @required this.width,
    // this.itemHeight = defaultItemHeight,
  })  : assert(items != null),
        super(key: key);

  // Constants
  static const double defaultItemHeight = 40.0;

  // Events
  final ValueChanged<List<String>> onChanged;

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
    final ThemeData themeData = Theme.of(context);

    if (selectedValues == null) selectedValues = List<String>();

    TextStyle defaultStyle = themeData.textTheme.body1;

    int itemCount = widget.items.length;

    return Container(
      child: Scrollbar(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return CheckboxListTile(
              title: Text(
                widget.items[index],
                style: defaultStyle,
              ),
              value: selectedValues.contains(widget.items[index]),
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
