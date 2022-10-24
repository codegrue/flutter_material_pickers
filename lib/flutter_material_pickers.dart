// Copyright (c) 2018, codegrue. All rights reserved. Use of this source code
// is governed by the MIT license that can be found in the LICENSE file.

/// Package for building card based settings forms
library flutter_material_pickers;

import 'package:flutter/cupertino.dart';

export 'package:file_picker/file_picker.dart' show FileType;
export 'package:flutter_material_pickers/helpers/show_checkbox_picker.dart';
export 'package:flutter_material_pickers/helpers/show_color_picker.dart';
export 'package:flutter_material_pickers/helpers/show_date_picker.dart';
export 'package:flutter_material_pickers/helpers/show_file_picker.dart';
export 'package:flutter_material_pickers/helpers/show_number_picker.dart';
export 'package:flutter_material_pickers/helpers/show_palette_picker.dart';
export 'package:flutter_material_pickers/helpers/show_radio_picker.dart';
export 'package:flutter_material_pickers/helpers/show_responsive_dialog.dart';

/// Models
export 'package:flutter_material_pickers/models/picker_model.dart';
export 'package:flutter_material_pickers/models/select_all_config.dart';

/// Helpers
export 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';
export 'package:flutter_material_pickers/helpers/show_selection_picker.dart';
export 'package:flutter_material_pickers/helpers/show_swatch_picker.dart';
export 'package:flutter_material_pickers/helpers/show_time_picker.dart';

// Constants
const double kPickerHeaderPortraitHeight = 80.0;
const double kPickerHeaderLandscapeWidth = 168.0;
const double kDialogActionBarHeight = 52.0;
const double kDialogMargin = 30.0;

// Typedefs
typedef Transformer<T> = String? Function(T item);
typedef Iconizer<T> = Icon? Function(T item);
