// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter/material.dart';

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class ResponsiveDialog extends StatelessWidget {
  ResponsiveDialog({
    this.context,
    String title,
    Widget child,
    this.forcePortrait = false,
    this.okPressed,
    this.cancelPressed,
  })  : title = title ?? "Title Here",
        child = child ?? Text("Content Here");

  // Variables
  final BuildContext context;
  final String title;
  final Widget child;
  final bool forcePortrait;

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

  Widget actionBar(BuildContext context) {
    var localizations = MaterialLocalizations.of(context);

    return Container(
      height: kDialogActionBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ButtonBar(
            children: <Widget>[
              FlatButton(
                child: Text(localizations.cancelButtonLabel),
                onPressed: () => (cancelPressed == null)
                    ? Navigator.of(context).pop()
                    : cancelPressed(),
              ),
              FlatButton(
                child: Text(localizations.okButtonLabel),
                onPressed: () => (okPressed == null)
                    ? Navigator.of(context).pop()
                    : okPressed(),
              ),
            ],
          ),
        ],
      ),
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

          if (forcePortrait) orientation = Orientation.portrait;

          switch (orientation) {
            case Orientation.portrait:
              return Column(
                children: <Widget>[
                  header(context, orientation),
                  Expanded(
                    child: Container(
                      child: child,
                    ),
                  ),
                  actionBar(context),
                ],
              );
            case Orientation.landscape:
              return Row(
                children: <Widget>[
                  header(context, orientation),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: child,
                        ),
                        actionBar(context),
                      ],
                    ),
                  ),
                ],
              );
          }
          return null;
        },
      ),
    );
  }
}
