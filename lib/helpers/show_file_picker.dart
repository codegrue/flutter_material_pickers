// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

/// Allows selection of a file.
Future<void> showMaterialFilePicker({
  BuildContext? context,
  FileType fileType = FileType.any,
  List<String>? allowedExtensions,
  ValueChanged<PlatformFile>? onChanged,
}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    withData: true,
    allowMultiple: false,
    allowedExtensions: allowedExtensions,
  );
  if (result != null && result.files.length == 1) {
    PlatformFile file = result.files.single;
    if (onChanged != null) onChanged(file);
  }
}
