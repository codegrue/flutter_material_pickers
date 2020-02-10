// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// This helper widget manages the scrollable content inside a picker widget.
class ScrollPicker extends StatelessWidget {
  ScrollPicker({
    Key key,
    @required this.items,
    @required String initialValue,
    @required this.onChanged,
  })  : assert(items != null),
        selectedValue = initialValue,
        scrollController = ScrollController(
          initialScrollOffset: items.contains(initialValue)
              ? (items.indexOf(initialValue)) * itemHeight
              : 0.0,
        ),
        super(key: key);

  // Constants
  static const double itemHeight = 50.0;

  // Events
  final ValueChanged<String> onChanged;

  // Variables
  final List<String> items;

  // Determined during build by the LayoutBuilder
  static double widgetHeight;
  static int numberOfVisibleItems;
  static int numberOfPaddingRows;
  static double visibleItemsHeight;

  final ScrollController scrollController;

  final String selectedValue;

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
          numberOfPaddingRows = numberOfVisibleItems ~/ 2;
          visibleItemsHeight = numberOfVisibleItems * itemHeight;

          int itemCount = items.length + numberOfPaddingRows * 2;

          return Stack(
            children: <Widget>[
              Container(
                child: ListView.builder(
                  controller: scrollController,
                  itemExtent: itemHeight,
                  itemCount: itemCount,
                  itemBuilder: (BuildContext context, int index) {
                    bool isPaddingRow = index < numberOfPaddingRows ||
                        index >= itemCount - numberOfPaddingRows;

                    String value = (isPaddingRow)
                        ? null
                        : items[index - numberOfPaddingRows];

                    //define special style for selected (middle) element
                    final TextStyle itemStyle =
                        (value == selectedValue) ? selectedStyle : defaultStyle;

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
              Container(
                height: visibleItemsHeight,
                child: Center(
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
                ),
              )
            ],
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
    String newValue = items[itemIndex];
    if (newValue != selectedValue) {
      onChanged(newValue);
    }

    // animate to and center on the selected item
    scrollController.animateTo(itemIndex * itemHeight,
        duration: Duration(seconds: 1), curve: ElasticOutCurve());
  }

  // indicates if user has stopped scrolling so we can center value in the middle
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
