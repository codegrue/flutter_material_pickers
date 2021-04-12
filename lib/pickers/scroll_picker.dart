// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// This helper widget manages the scrollable content inside a picker widget.
class ScrollPicker extends StatefulWidget {
  ScrollPicker({
    Key? key,
    required this.items,
    required this.values,
    this.initialValue,
    required this.onChanged,
    this.showDivider: true,
  }) : super(key: key);

  // Events
  final ValueChanged<String> onChanged;

  // Variables
  final List<String> items;
  final List<String> values;
  final String? initialValue;
  final bool showDivider;

  @override
  _ScrollPickerState createState() => _ScrollPickerState(initialValue);
}

class _ScrollPickerState extends State<ScrollPicker> {
  _ScrollPickerState(this.selectedValue);

  // Constants
  static const double itemHeight = 50.0;

  // Variables
  late double widgetHeight;
  late int numberOfVisibleItems;
  late int numberOfPaddingRows;
  late double visibleItemsHeight;
  late double offset;

  String? selectedValue;

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    int initialItem =
        (selectedValue == null) ? 0 : widget.values.indexOf(selectedValue!);
    scrollController = FixedExtentScrollController(initialItem: initialItem);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    TextStyle? defaultStyle = themeData.textTheme.bodyText2;
    TextStyle? selectedStyle =
        themeData.textTheme.headline5?.copyWith(color: themeData.accentColor);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        widgetHeight = constraints.maxHeight;

        return Stack(
          children: <Widget>[
            GestureDetector(
              onTapUp: _itemTapped,
              child: ListWheelScrollView.useDelegate(
                childDelegate: ListWheelChildBuilderDelegate(
                    builder: (BuildContext context, int index) {
                  if (index < 0 || index > widget.items.length - 1) {
                    return null;
                  }

                  var value = widget.values[index];

                  final TextStyle? itemStyle =
                      (value == selectedValue) ? selectedStyle : defaultStyle;

                  return Center(
                    child: Text(value, style: itemStyle),
                  );
                }),
                controller: scrollController,
                itemExtent: itemHeight,
                onSelectedItemChanged: _onSelectedItemChanged,
                physics: FixedExtentScrollPhysics(),
              ),
            ),
            Center(child: widget.showDivider ? Divider() : Container()),
            Center(
              child: Container(
                height: itemHeight,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: themeData.accentColor, width: 1.0),
                    bottom:
                        BorderSide(color: themeData.accentColor, width: 1.0),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void _itemTapped(TapUpDetails details) {
    Offset position = details.localPosition;
    double center = widgetHeight / 2;
    double changeBy = position.dy - center;
    double newPosition = scrollController.offset + changeBy;

    // animate to and center on the selected item
    scrollController.animateTo(newPosition,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  void _onSelectedItemChanged(int index) {
    String newValue = widget.values[index];
    if (newValue != selectedValue) {
      selectedValue = newValue;
      widget.onChanged(newValue);
    }
  }
}
