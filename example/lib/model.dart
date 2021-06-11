// example viewmodel for the form
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class ExampleModel {
  // Scroll/Radio Picker Model
  static const List<PickerModel> usStates = <PickerModel>[
    PickerModel('Alabama', code: 'AL'),
    PickerModel('Alaska', code: 'AK'),
    PickerModel('Arizona', code: 'AZ'),
    PickerModel('Arkansas', code: 'AR'),
    PickerModel('California', code: 'CA'),
    PickerModel('Colorado', code: 'CO'),
    PickerModel('Connecticut', code: 'CT'),
    PickerModel('Delaware', code: 'DE'),
    PickerModel('Florida', code: 'FL'),
    PickerModel('Georgia', code: 'GA'),
    PickerModel('Hawaii', code: 'HW'),
    PickerModel('Idaho', code: 'ID'),
    PickerModel('Illinois', code: 'IL'),
    PickerModel('Indiana', code: 'IN'),
    PickerModel('Iowa', code: 'IO'),
    PickerModel('Kansas', code: 'KA'),
    PickerModel('Kentucky', code: 'KE'),
    PickerModel('Louisiana', code: 'LO'),
    PickerModel('Maine', code: 'MA'),
    PickerModel('Maryland', code: 'ML'),
    PickerModel('Massachusetts', code: 'MA'),
    PickerModel('Michigan', code: 'MI'),
    PickerModel('Minnesota', code: 'MN'),
    PickerModel('Mississippi', code: 'MS'),
    PickerModel('Missouri', code: 'MO'),
    PickerModel('Montana', code: 'MO'),
    PickerModel('Nebraska', code: 'NE'),
    PickerModel('Nevada', code: 'NV'),
    PickerModel('New Hampshire', code: 'NH'),
    PickerModel('New Jersey', code: 'NJ'),
    PickerModel('New Mexico', code: 'NM'),
    PickerModel('New York', code: 'NY'),
    PickerModel('North Carolina', code: 'NC'),
    PickerModel('North Dakota', code: 'ND'),
    PickerModel('Ohio', code: 'OH'),
    PickerModel('Oklahoma', code: 'OK'),
    PickerModel('Oregon', code: 'OR'),
    PickerModel('Pennsylvania', code: 'PA'),
    PickerModel('Rhode Island', code: 'RI'),
    PickerModel('South Carolina', code: 'SC'),
    PickerModel('South Dakota', code: 'SD'),
    PickerModel('Tennessee', code: 'TN'),
    PickerModel('Texas', code: 'TX'),
    PickerModel('Utah', code: 'UT'),
    PickerModel('Vermont', code: 'VT'),
    PickerModel('Virginia', code: 'VA'),
    PickerModel('Washington', code: 'WA'),
    PickerModel('West Virginia', code: 'WV'),
    PickerModel('Wisconsin', code: 'WI'),
    PickerModel('Wyoming', code: 'WY'),
  ];
  PickerModel selectedUsState = usStates[0];

  // Checkbox Picker Model
  static const List<PickerModel> iceCreamToppings = <PickerModel>[
    PickerModel('Hot Fudge', code: 'FUDGE'),
    PickerModel('Sprinkles', code: 'SPRINK'),
    PickerModel('Caramel', code: 'CARM'),
    PickerModel('Oreos', code: 'OREO'),
    PickerModel('Peanut Butter', code: 'PB'),
    PickerModel('Cookie Dough', code: 'COOKIE'),
    PickerModel('Whipped Cream', code: 'WHIP'),
    PickerModel('Marshmallow', code: 'MARSH'),
    PickerModel('Nuts', code: 'NUTS'),
    PickerModel('Heath Bar', code: 'HEATH'),
    PickerModel('Butterscotch', code: 'SCOTCH'),
    PickerModel("m&m's", code: 'MM'),
    PickerModel('Gummy worms', code: 'GUMMY'),
    PickerModel('Fruit', code: 'FRUIT'),
  ];
  List<PickerModel> selectedIceCreamToppings = [
    iceCreamToppings[0],
    iceCreamToppings[5],
  ];

  // Selection Picker Model
  static const List<PickerModel> speedOptions = <PickerModel>[
    PickerModel('Light', code: 1, icon: Icon(Icons.sort)),
    PickerModel('Ridiculous', code: 2, icon: Icon(Icons.clear_all)),
    PickerModel('Ludicrous', code: 3, icon: Icon(Icons.swap_calls)),
    PickerModel('Plaid', code: 4, icon: Icon(Icons.select_all)),
  ];
  PickerModel speed = speedOptions[2];

  // Number Picker Model
  var age = 25;

  // Time Picker Model
  var time = TimeOfDay.now();

  // Date Picker Model
  var date = DateTime.now();

  // Color Picker Model
  Color color = Colors.red;

  // Palette Picker Model
  Color palette = Colors.green;

  // Swatch Picker Model
  Color swatch = Colors.blue;

  // File Picker Model
  PlatformFile file = PlatformFile(
      name: 'somefile.ext',
      size: 1024 * 1024 * 15,
      bytes: Uint8List(1024 * 1024 * 15));
}
