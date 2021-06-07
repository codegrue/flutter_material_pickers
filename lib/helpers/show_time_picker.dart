// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// Allows selection of a time
Future<TimeOfDay?> showMaterialTimePicker({
  required BuildContext context,
  String? title,
  required TimeOfDay selectedTime,
  String? confirmText,
  String? cancelText,
  ValueChanged<TimeOfDay>? onChanged,
  VoidCallback? onConfirmed,
  VoidCallback? onCancelled,
}) {
  return showTimePicker(
    context: context,
    initialTime: selectedTime,
    cancelText: cancelText,
    confirmText: confirmText,
  ).then((selection) {
    if (selection != null) {
      onChanged?.call(selection);
      onConfirmed?.call();
    } else {
      onCancelled?.call();
    }
    return selection;
  });
}
