import 'package:flutter/material.dart';

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
