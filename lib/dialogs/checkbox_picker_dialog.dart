// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter_material_pickers/pickers/checkbox_picker.dart';
import 'package:flutter/material.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class CheckboxPickerDialog extends StatefulWidget {
  CheckboxPickerDialog({
    this.title,
    this.items,
    this.selectedItems,
    Widget confirmWidget,
    Widget cancelWidget,
  })  : confirmWidget = confirmWidget ?? Text("OK"),
        cancelWidget = cancelWidget ?? Text("CANCEL");

  // Variables
  final List<String> items;
  final List<String> selectedItems;
  final String title;
  final Widget confirmWidget;
  final Widget cancelWidget;

  @override
  State<CheckboxPickerDialog> createState() =>
      _CheckboxPickerDialogState(selectedItems);
}

class _CheckboxPickerDialogState extends State<CheckboxPickerDialog> {
  _CheckboxPickerDialogState(this.selectedValues);

  List<String> selectedValues;

  MaterialLocalizations localizations;
  ThemeData theme;
  final GlobalKey _pickerKey = GlobalKey();

  void _handleValueChanged(List<String> value) {
    setState(() => selectedValues = value);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    localizations = MaterialLocalizations.of(context);
    theme = Theme.of(context);
  }

  Widget actionBar(double contentWidth) {
    return Container(
      width: contentWidth,
      height: kDialogActionBarHeight,
      child: ButtonBar(
        children: <Widget>[
          FlatButton(
            child: Text(localizations.cancelButtonLabel),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text(localizations.okButtonLabel),
            onPressed: () => Navigator.of(context).pop(selectedValues),
          ),
        ],
      ),
    );
  }

  Widget pickerContent(double width, double height) {
    return CheckboxPicker(
      key: _pickerKey,
      items: widget.items,
      initialValues: selectedValues,
      onChanged: _handleValueChanged,
      width: width,
      height: height,
    );
  }

  Widget header(Orientation orientation) {
    return Container(
      color: theme.primaryColor,
      height: (orientation == Orientation.portrait)
          ? kPickerHeaderPortraitHeight
          : null,
      width: (orientation == Orientation.landscape)
          ? kPickerHeaderLandscapeWidth
          : null,
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20.0,
            color: const Color(0xffffffff),
          ),
        ),
      ),
      padding: EdgeInsets.all(20.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(context != null);

    return Dialog(
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          assert(orientation != null);
          assert(context != null);

          var screenSize = MediaQuery.of(context).size;
          var dialogWidth = screenSize.width - (kDialogMargin * 2);
          var dialogHeight = screenSize.height - (kDialogMargin * 2);
          var contentWidth = (orientation == Orientation.landscape)
              ? dialogWidth - kPickerHeaderLandscapeWidth - 20.0
              : dialogWidth;
          var contentHeight = (orientation == Orientation.landscape)
              ? dialogHeight - kDialogActionBarHeight
              : dialogHeight - kDialogActionBarHeight - 88.0;

          switch (orientation) {
            case Orientation.portrait:
              return SizedBox(
                width: dialogWidth,
                height: dialogHeight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    header(orientation),
                    Container(
                      color: theme.dialogBackgroundColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          pickerContent(contentWidth, contentHeight),
                          actionBar(contentWidth),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case Orientation.landscape:
              return SizedBox(
                width: dialogWidth,
                height: dialogHeight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    header(orientation),
                    Container(
                      color: theme.dialogBackgroundColor,
                      child: Column(
                        children: <Widget>[
                          pickerContent(contentWidth, contentHeight),
                          actionBar(contentWidth),
                        ],
                      ),
                    )
                  ],
                ),
              );
          }
          return null;
        },
      ),
    );
  }
}
