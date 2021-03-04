// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// Allows selection of a date.
void showMaterialDatePicker({
  required BuildContext context,
  String? title,
  required DateTime firstDate,
  required DateTime lastDate,
  required DateTime selectedDate,
  String? okButtonLabel,
  String? cancelButtonLabel,
  ValueChanged<DateTime>? onChanged,
  VoidCallback? onConfirmed,
  VoidCallback? onCancelled,
}) {
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
    if (onConfirmed != null && selection != null) onConfirmed();
  });
}
