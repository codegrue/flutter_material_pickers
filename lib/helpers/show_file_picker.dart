// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

/// Allows selection of a file.
Future<void> showMaterialFilePicker({
  BuildContext context,
  FileType fileType = FileType.image,
  String fileExtension,
  ValueChanged<Uint8List> onChanged,
}) async {
  FilePickerResult result = await FilePicker.platform
      .pickFiles(type: fileType, withData: true, allowMultiple: false);
  if (result != null && result.files.length == 1) {
    PlatformFile file = result.files.single;
    var data = file.bytes;
    if (onChanged != null && data != null) onChanged(data);
  }
}
