// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// Allows selection of a time
void showMaterialTimePicker({
  required BuildContext context,
  String? title,
  required TimeOfDay selectedTime,
  ValueChanged<TimeOfDay>? onChanged,
  VoidCallback? onConfirmed,
  VoidCallback? onCancelled,
}) {
  showTimePicker(
    context: context,
    initialTime: selectedTime,
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
    if (onCancelled != null && selection == null) onCancelled();
    if (onConfirmed != null && selection != null) onConfirmed();
  });
}
