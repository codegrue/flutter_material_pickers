import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/list_picker_dialog.dart';

void showMaterialListPicker({
  BuildContext context,
  String title,
  List<String> items,
  String selectedItem,
  ValueChanged<String> onChanged,
}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return ListPickerDialog(
        items: items,
        title: title,
        initialValue: selectedItem,
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}
