// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Allows selection of a file.
Future<void> showMaterialFilePicker({
  BuildContext context,
  FileType fileType = FileType.image,
  String fileExtension,
  ValueChanged<Uint8List> onChanged,
}) async {
  // FilePicker filePicker = FilePicker(
  //   fileExtension: fileExtension,
  //   type: fileType,
  // );
  try {
    File file = await FilePicker.getFile(type: fileType);
    var data = file.readAsBytesSync();
    if (onChanged != null && file != null) onChanged(data);
  } catch (error) {
    if (error.runtimeType is PlatformException) return; // user clicked twice
    if (error.runtimeType is NoSuchMethodError) return; // user canceled dialog
    throw error;
  }

  // FilePicker.getFile().then(
  //   (_) {
  //     final file = filePicker.toUint8List();
  //     if (onChanged != null && file != null) onChanged(file);
  //   },
  // ).catchError((dynamic error) {
  //   if (error.runtimeType is PlatformException) return; // user clicked twice
  //   if (error.runtimeType is NoSuchMethodError) return; // user canceled dialog
  //   throw error;
  // });
}
