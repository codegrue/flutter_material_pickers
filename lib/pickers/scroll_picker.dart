// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

import '../flutter_material_pickers.dart';

/// This helper widget manages the scrollable content inside a picker widget.
class ScrollPicker<T> extends StatefulWidget {
  ScrollPicker({
    Key? key,
    required this.items,
    required this.selectedItem,
    required this.onChanged,
    this.showDivider: true,
    this.transformer,
  }) : super(key: key);

  // Events
  final ValueChanged<T> onChanged;

  // Variables
  final List<T> items;
  final T selectedItem;
  final bool showDivider;

  // Callbacks
  final Transformer<T>? transformer;

  @override
  _ScrollPickerState createState() => _ScrollPickerState<T>(selectedItem);
}

class _ScrollPickerState<T> extends State<ScrollPicker<T>> {
  _ScrollPickerState(this.selectedValue);

  // Constants
  static const double itemHeight = 50.0;

  // Variables
  late double widgetHeight;
  late int numberOfVisibleItems;
  late int numberOfPaddingRows;
  late double visibleItemsHeight;
  late double offset;

  T selectedValue;

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    int initialItem = widget.items.indexOf(selectedValue);
    scrollController = FixedExtentScrollController(initialItem: initialItem);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    TextStyle? defaultStyle = themeData.textTheme.bodyText2;
    TextStyle? selectedStyle = themeData.textTheme.headline5
        ?.copyWith(color: themeData.colorScheme.secondary);

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

                  var value = widget.items[index];

                  final TextStyle? itemStyle =
                      (value == selectedValue) ? selectedStyle : defaultStyle;

                  return Center(
                    child: Text(widget.transformer?.call(value) ?? '$value',
                        style: itemStyle),
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
                    top: BorderSide(
                        color: themeData.colorScheme.secondary, width: 1.0),
                    bottom: BorderSide(
                        color: themeData.colorScheme.secondary, width: 1.0),
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
    T newValue = widget.items[index];
    if (newValue != selectedValue) {
      selectedValue = newValue;
      widget.onChanged(newValue);
    }
  }
}
