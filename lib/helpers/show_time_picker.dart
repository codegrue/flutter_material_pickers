// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// Allows selection of a time
void showMaterialTimePicker({
  BuildContext context,
  String title,
  TimeOfDay selectedTime,
  ValueChanged<TimeOfDay> onChanged,
}) {
  showTimePicker(
    context: context,
    initialTime: selectedTime,
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}
