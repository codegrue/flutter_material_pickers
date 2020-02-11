// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/dialogs/responsive_dialog.dart';

void showMaterialResponsiveDialog({
  BuildContext context,
  String title,
  Widget child,
  ValueChanged<List<String>> onChanged,
}) {
  showDialog<List<String>>(
    context: context,
    builder: (BuildContext context) {
      return ResponsiveDialog(
        context: context,
        title: title,
        child: child,
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
  });
}
