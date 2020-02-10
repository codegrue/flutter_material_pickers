// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// This helper widget manages a scrollable checkbox list inside a picker widget.
class RadioPicker extends StatefulWidget {
  RadioPicker({
    Key key,
    @required this.items,
    @required this.initialItem,
    @required this.onChanged,
  })  : assert(items != null),
        super(key: key);

  // Constants
  static const double defaultItemHeight = 40.0;

  // Events
  final ValueChanged<String> onChanged;

  // Variables
  final List<String> items;
  final String initialItem;

  @override
  RadioPickerState createState() {
    return RadioPickerState(initialItem);
  }
}

class RadioPickerState extends State<RadioPicker> {
  RadioPickerState(this.selectedValue);

  String selectedValue;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

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
              value: (widget.items[index] == selectedValue),
              onChanged: (bool value) {
                setState(() {
                  if (value == true) {
                    selectedValue = widget.items[index];
                    widget.onChanged(selectedValue);
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
