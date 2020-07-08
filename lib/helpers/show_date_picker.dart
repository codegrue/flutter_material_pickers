// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// Allows selection of a date.
void showMaterialDatePicker({
  BuildContext context,
  String title,
  DateTime firstDate,
  DateTime lastDate,
  DateTime selectedDate,
  String okButtonLabel,
  String cancelButtonLabel,
  ValueChanged<DateTime> onChanged,
  VoidCallback onCancelled,
}) {
  if (firstDate == null) firstDate = DateTime(1990, 1, 1);
  if (lastDate == null) lastDate = DateTime(2050, 12, 31);

  showDatePicker(
    context: context,
    firstDate: firstDate,
    lastDate: lastDate,
    initialDate: selectedDate,
    cancelText: cancelButtonLabel,
    confirmText: okButtonLabel,
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
    if (onCancelled != null && selection == null) onCancelled();
  });
}
