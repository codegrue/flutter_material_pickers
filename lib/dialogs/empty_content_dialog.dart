// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter/material.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class EmptyContentDialog extends StatelessWidget {
  EmptyContentDialog({
    this.context,
    String title,
    Widget child,
    this.okPressed,
    this.cancelPressed,
  })  : title = title ?? "Title Here",
        child = child ?? Text("Content Here");

  // Variables
  final BuildContext context;
  final String title;
  final Widget child;

  // Events
  final VoidCallback cancelPressed;
  final VoidCallback okPressed;

  Widget header(BuildContext context, Orientation orientation) {
    var theme = Theme.of(context);

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
          title,
          style: TextStyle(
            fontSize: 20.0,
            color: const Color(0xffffffff),
          ),
        ),
      ),
      padding: EdgeInsets.all(20.0),
    );
  }

  Widget actionBar(BuildContext context, double contentWidth) {
    var localizations = MaterialLocalizations.of(context);

    return Container(
      width: contentWidth,
      height: kDialogActionBarHeight,
      child: ButtonBar(
        children: <Widget>[
          FlatButton(
            child: Text(localizations.cancelButtonLabel),
            onPressed: () => (cancelPressed == null)
                ? Navigator.of(context).pop()
                : cancelPressed(),
          ),
          FlatButton(
            child: Text(localizations.okButtonLabel),
            onPressed: () =>
                (okPressed == null) ? Navigator.of(context).pop() : okPressed(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(context != null);

    var theme = Theme.of(context);

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
                    header(context, orientation),
                    Container(
                      color: theme.dialogBackgroundColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            height: contentHeight,
                            width: contentWidth,
                            child: child,
                          ),
                          actionBar(context, contentWidth),
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
                    header(context, orientation),
                    Container(
                      color: theme.dialogBackgroundColor,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: contentHeight,
                            width: contentWidth,
                            child: child,
                          ),
                          actionBar(context, contentWidth),
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
