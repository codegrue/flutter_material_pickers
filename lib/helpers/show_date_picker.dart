import 'package:flutter/material.dart';

void showMaterialDatePicker({
  BuildContext context,
  String title,
  DateTime firstDate,
  DateTime lastDate,
  DateTime selectedDate,
  ValueChanged<DateTime> onChanged,
}) {
  if (firstDate == null) firstDate = DateTime(1990, 1, 1);
  if (lastDate == null) lastDate = DateTime(2050, 12, 31);

  showDatePicker(
    context: context,
    firstDate: firstDate,
    lastDate: lastDate,
    initialDate: selectedDate,
  ).then((selection) {
    if (onChanged != null) onChanged(selection);
  });
}
