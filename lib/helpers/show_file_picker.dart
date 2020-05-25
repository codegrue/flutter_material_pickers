// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'dart:typed_data';

import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Allows selection of a file.
void showMaterialFilePicker({
  BuildContext context,
  FileTypeCross fileType = FileTypeCross.image,
  String fileExtension,
  ValueChanged<Uint8List> onChanged,
}) {
  FilePickerCross filePicker = FilePickerCross(
    fileExtension: fileExtension,
    type: fileType,
  );
  filePicker.pick().then(
    (_) {
      final file = filePicker.toUint8List();
      if (onChanged != null && file != null) onChanged(file);
    },
  ).catchError((dynamic error) {
    if (error.runtimeType is PlatformException) return; // user clicked twice
    if (error.runtimeType is NoSuchMethodError) return; // user canceled dialog
    throw error;
  });
}
