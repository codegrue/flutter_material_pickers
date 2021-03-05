// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter/material.dart';
import '../interfaces/common_dialog_properties.dart';

// copied from flutter calendar picker
const Duration _dialogSizeAnimationDuration = Duration(milliseconds: 200);

/// This is a support widget that returns an Dialog with checkboxes as a Widget.
/// It is designed to be used in the showDialog method of other fields.
class ResponsiveDialog extends StatefulWidget
    implements ICommonDialogProperties {
  ResponsiveDialog({
    required this.context,
    String? title,
    Widget? child,
    this.headerColor,
    this.headerTextColor,
    this.backgroundColor,
    this.buttonTextColor,
    this.forcePortrait = false,
    double? maxLongSide,
    double? maxShortSide,
    this.hideButtons = false,
    this.okPressed,
    this.cancelPressed,
    this.confirmText,
    this.cancelText,
  })  : title = title ?? "Title Here",
        child = child ?? Text("Content Here"),
        maxLongSide = maxLongSide ?? 600,
        maxShortSide = maxShortSide ?? 400;

  // Variables
  final BuildContext context;
  @override
  final String? title;
  final Widget child;
  final bool forcePortrait;
  @override
  final Color? headerColor;
  @override
  final Color? headerTextColor;
  @override
  final Color? backgroundColor;
  @override
  final Color? buttonTextColor;
  @override
  final double? maxLongSide;
  @override
  final double? maxShortSide;
  final bool hideButtons;
  @override
  final String? confirmText;
  @override
  final String? cancelText;

  // Events
  final VoidCallback? cancelPressed;
  final VoidCallback? okPressed;

  @override
  _ResponsiveDialogState createState() => _ResponsiveDialogState();
}

class _ResponsiveDialogState extends State<ResponsiveDialog> {
  late Color _headerColor;
  late Color? _headerTextColor;
  late Color _backgroundColor;
  late Color? _buttonTextColor;

  Widget header(BuildContext context, Orientation orientation) {
    return Container(
      color: _headerColor,
      height: (orientation == Orientation.portrait)
          ? kPickerHeaderPortraitHeight
          : null,
      width: (orientation == Orientation.landscape)
          ? kPickerHeaderLandscapeWidth
          : null,
      child: Center(
        child: Text(
          widget.title!,
          style: TextStyle(
            fontSize: 20.0,
            color: _headerTextColor,
          ),
        ),
      ),
      padding: EdgeInsets.all(20.0),
    );
  }

  Widget actionBar(BuildContext context) {
    if (widget.hideButtons) return Container();

    var localizations = MaterialLocalizations.of(context);

    return Container(
      height: kDialogActionBarHeight,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: _headerColor),
          ),
        ),
        child: ButtonBar(
          children: <Widget>[
            TextButton(
              child: Text(
                widget.cancelText ?? localizations.cancelButtonLabel,
                style: TextStyle(color: _buttonTextColor),
              ),
              onPressed: () => (widget.cancelPressed == null)
                  ? Navigator.of(context).pop()
                  : widget.cancelPressed!(),
            ),
            TextButton(
              child: Text(
                widget.confirmText ?? localizations.okButtonLabel,
                style: TextStyle(color: _buttonTextColor),
              ),
              onPressed: () => (widget.okPressed == null)
                  ? Navigator.of(context).pop()
                  : widget.okPressed!(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    _headerColor = widget.headerColor ?? theme.primaryColor;
    _headerTextColor =
        widget.headerTextColor ?? theme.primaryTextTheme.headline6?.color;
    _buttonTextColor = widget.buttonTextColor ?? theme.textTheme.button?.color;
    _backgroundColor = widget.backgroundColor ?? theme.dialogBackgroundColor;

    final Orientation orientation = MediaQuery.of(context).orientation;

    // constrain the dialog from expanding to full screen
    final Size dialogSize = (orientation == Orientation.portrait)
        ? Size(widget.maxShortSide!, widget.maxLongSide!)
        : Size(widget.maxLongSide!, widget.maxShortSide!);

    return Dialog(
      backgroundColor: _backgroundColor,
      child: AnimatedContainer(
        width: dialogSize.width,
        height: dialogSize.height,
        duration: _dialogSizeAnimationDuration,
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (widget.forcePortrait) orientation = Orientation.portrait;

            switch (orientation) {
              case Orientation.portrait:
                return Column(
                  children: <Widget>[
                    header(context, orientation),
                    Expanded(
                      child: Container(
                        child: widget.child,
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
                            child: widget.child,
                          ),
                          actionBar(context),
                        ],
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
