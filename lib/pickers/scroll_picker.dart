// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// This helper widget manages the scrollable content inside a picker widget.
class ScrollPicker extends StatefulWidget {
  ScrollPicker({
    Key key,
    @required this.items,
    @required this.initialValue,
    @required this.onChanged,
  })  : assert(items != null),
        super(key: key);

  // Events
  final ValueChanged<String> onChanged;

  // Variables
  final List<String> items;
  final String initialValue;

  @override
  _ScrollPickerState createState() => _ScrollPickerState(initialValue);
}

class _ScrollPickerState extends State<ScrollPicker> {
  _ScrollPickerState(this.selectedValue);

  // Constants
  static const double itemHeight = 50.0;

  // Variables
  double widgetHeight;
  int numberOfVisibleItems;
  int numberOfPaddingRows;
  double visibleItemsHeight;
  double offset;

  ScrollController scrollController;

  String selectedValue;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    TextStyle defaultStyle = themeData.textTheme.body1;
    TextStyle selectedStyle =
        themeData.textTheme.headline.copyWith(color: themeData.accentColor);

    return NotificationListener(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          widgetHeight = constraints.maxHeight;
          numberOfVisibleItems = widgetHeight ~/ itemHeight;

          // add padding (empty) rows so you can scroll to the extents
          numberOfPaddingRows = numberOfVisibleItems ~/ 2;
          int itemCount = widget.items.length + numberOfPaddingRows * 2;

          // ensure odd rows to allow a centered item
          if (numberOfVisibleItems.isEven) numberOfVisibleItems++;

          // area the visible items desire to take
          visibleItemsHeight = numberOfVisibleItems * itemHeight;

          // amount shifted from center because desired area doesn't fit in visible area
          offset = (widgetHeight - visibleItemsHeight) / 2;
          scrollController = ScrollController(
            initialScrollOffset: widget.items.contains(selectedValue)
                ? (widget.items.indexOf(selectedValue)) * itemHeight - offset
                : 0.0,
          );

          return Container(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                    height: widgetHeight,
                    child: ListView.builder(
                      controller: scrollController,
                      itemExtent: itemHeight,
                      itemCount: itemCount,
                      itemBuilder: (BuildContext context, int index) {
                        bool isPaddingRow = index < numberOfPaddingRows ||
                            index >= itemCount - numberOfPaddingRows;

                        String value = (isPaddingRow)
                            ? null
                            : widget.items[index - numberOfPaddingRows];

                        //define special style for selected (middle) element
                        final TextStyle itemStyle = (value == selectedValue)
                            ? selectedStyle
                            : defaultStyle;

                        return isPaddingRow
                            ? Container() //empty items for padding rows
                            : GestureDetector(
                                onTap: () {
                                  _itemTapped(index);
                                },
                                child: Container(
                                  color: Colors
                                      .transparent, // seems to be necessary to allow touches outside the item text
                                  child: Center(
                                    child: Text(value, style: itemStyle),
                                  ),
                                ),
                              );
                      },
                    ),
                  ),
                ),
                Center(child: Divider()),
                Center(
                  child: Container(
                    height: itemHeight,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: themeData.accentColor, width: 1.0),
                        bottom: BorderSide(
                            color: themeData.accentColor, width: 1.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
      onNotification: _onNotification,
    );
  }

  void _itemTapped(int itemIndex) {
    int selectedIndex = itemIndex - numberOfPaddingRows;
    _changeSelectedItem(selectedIndex);
  }

  bool _onNotification(Notification notification) {
    if (notification is ScrollNotification) {
      if (_userStoppedScrolling(notification, scrollController)) {
        int indexOfMiddleElement =
            ((notification.metrics.pixels + visibleItemsHeight / 2) ~/
                    itemHeight) -
                numberOfPaddingRows;
        _changeSelectedItem(indexOfMiddleElement);
      }
    }
    return true;
  }

  void _changeSelectedItem(int itemIndex) {
    // update value with selected item
    String newValue = widget.items[itemIndex];
    if (newValue != selectedValue) {
      selectedValue = newValue;
      widget.onChanged(newValue);
    }

    // animate to and center on the selected item
    scrollController.animateTo(itemIndex * itemHeight - offset,
        duration: Duration(milliseconds: 500), curve: ElasticOutCurve());
  }

  bool _userStoppedScrolling(
    Notification notification,
    ScrollController scrollController,
  ) {
    return notification is UserScrollNotification &&
        notification.direction == ScrollDirection.idle &&
        // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
        scrollController.position.activity is! HoldScrollActivity;
  }
}
