import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/checkbox_picker_dialog.dart';

void showMaterialCheckboxPicker({
  BuildContext context,
  String title,
  List<String> items,
  List<String> selectedItems,
  ValueChanged<List<String>> onChanged,
}) {
  showDialog<List<String>>(
    context: context,
    builder: (BuildContext context) {
      return CheckboxPickerDialog(
        title: title,
        items: items,
        selectedItems: selectedItems,
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}
