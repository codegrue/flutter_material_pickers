// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/responsive_dialog.dart';

/// Allows selection of a date.
void showMaterialDatePicker({
  required BuildContext context,
  String? title,
  required DateTime firstDate,
  required DateTime lastDate,
  required DateTime selectedDate,
  Color? headerColor,
  Color? headerTextColor,
  Color? backgroundColor,
  Color? buttonTextColor,
  String? confirmText,
  String? cancelText,
  double? maxLongSide,
  double? maxShortSide,
  ValueChanged<DateTime>? onChanged,
  VoidCallback? onConfirmed,
  VoidCallback? onCancelled,
}) {
  showDialog<DateTime>(
    context: context,
    builder: (BuildContext context) {
      return OrientationBuilder(
        builder: (context, orientation) {
          return ResponsiveDialog(
            context: context,
            title: title,
            headerColor: headerColor,
            headerTextColor: headerTextColor,
            backgroundColor: backgroundColor,
            buttonTextColor: buttonTextColor,
            confirmText: confirmText,
            cancelText: cancelText,
            maxLongSide: maxLongSide,
            maxShortSide: maxLongSide,
            child: SingleChildScrollView(
              child: CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: firstDate,
                lastDate: lastDate,
                onDateChanged: (date) => selectedDate = date,
              ),
            ),
            okPressed: () => Navigator.of(context).pop(selectedDate),
          );
        },
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
    if (onCancelled != null && selection == null) onCancelled();
    if (onConfirmed != null && selection != null) onConfirmed();
  });
}
