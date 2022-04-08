// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// Allows selection of a time
Future<TimeOfDay?> showMaterialTimePicker({
  required BuildContext context,

  /// The title for the dialog box
  String? title,

  /// The initially selected time
  required TimeOfDay selectedTime,

  /// Text to display in the confirm button
  String? confirmText,

  /// Text to display in the cancel button
  String? cancelText,

  /// Function that gets called when the value is changed
  ValueChanged<TimeOfDay>? onChanged,

  /// Function that gets called when the confirm button is pressed
  VoidCallback? onConfirmed,

  /// Function that gets called when the cancel button is pressed
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
