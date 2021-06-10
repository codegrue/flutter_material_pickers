// example viewmodel for the form
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SpeedModel {
  const SpeedModel(this.name, this.icon);
  final String name;
  final Icon icon;

  @override
  String toString() => name;
}

class StateModel {
  const StateModel(this.name, this.code);
  final String code;
  final String name;

  @override
  String toString() => name;
}

class ToppingModel {
  const ToppingModel(this.name, this.code);
  final String code;
  final String name;

  @override
  String toString() => name;
}

class ExampleModel {
  // Scroll/Radio Picker Model
  static const List<StateModel> usStates = <StateModel>[
    StateModel('Alabama', 'AL'),
    StateModel('Alaska', 'AK'),
    StateModel('Arizona', 'AZ'),
    StateModel('Arkansas', 'AR'),
    StateModel('California', 'CA'),
    StateModel('Colorado', 'CO'),
    StateModel('Connecticut', 'CT'),
    StateModel('Delaware', 'DE'),
    StateModel('Florida', 'FL'),
    StateModel('Georgia', 'GA'),
    StateModel('Hawaii', 'HW'),
    StateModel('Idaho', 'ID'),
    StateModel('Illinois', 'IL'),
    StateModel('Indiana', 'IN'),
    StateModel('Iowa', 'IO'),
    StateModel('Kansas', 'KA'),
    StateModel('Kentucky', 'KE'),
    StateModel('Louisiana', 'LO'),
    StateModel('Maine', 'MA'),
    StateModel('Maryland', 'ML'),
    StateModel('Massachusetts', 'MA'),
    StateModel('Michigan', 'MI'),
    StateModel('Minnesota', 'MN'),
    StateModel('Mississippi', 'MS'),
    StateModel('Missouri', 'MO'),
    StateModel('Montana', 'MO'),
    StateModel('Nebraska', 'NE'),
    StateModel('Nevada', 'NV'),
    StateModel('New Hampshire', 'NH'),
    StateModel('New Jersey', 'NJ'),
    StateModel('New Mexico', 'NM'),
    StateModel('New York', 'NY'),
    StateModel('North Carolina', 'NC'),
    StateModel('North Dakota', 'ND'),
    StateModel('Ohio', 'OH'),
    StateModel('Oklahoma', 'OK'),
    StateModel('Oregon', 'OR'),
    StateModel('Pennsylvania', 'PA'),
    StateModel('Rhode Island', 'RI'),
    StateModel('South Carolina', 'SC'),
    StateModel('South Dakota', 'SD'),
    StateModel('Tennessee', 'TN'),
    StateModel('Texas', 'TX'),
    StateModel('Utah', 'UT'),
    StateModel('Vermont', 'VT'),
    StateModel('Virginia', 'VA'),
    StateModel('Washington', 'WA'),
    StateModel('West Virginia', 'WV'),
    StateModel('Wisconsin', 'WI'),
    StateModel('Wyoming', 'WY'),
  ];
  StateModel selectedUsState = usStates[0];

  // Checkbox Picker Model
  static const List<ToppingModel> iceCreamToppings = <ToppingModel>[
    ToppingModel('Hot Fudge', 'FUDGE'),
    ToppingModel('Sprinkles', 'SPRINK'),
    ToppingModel('Caramel', 'CARM'),
    ToppingModel('Oreos', 'OREO'),
    ToppingModel('Peanut Butter', 'PB'),
    ToppingModel('Cookie Dough', 'COOKIE'),
    ToppingModel('Whipped Cream', 'WHIP'),
    ToppingModel('Marshmallow', 'MARSH'),
    ToppingModel('Nuts', 'NUTS'),
    ToppingModel('Heath Bar', 'HEATH'),
    ToppingModel('Butterscotch', 'SCOTCH'),
    ToppingModel("m&m's", 'MM'),
    ToppingModel('Gummy worms', 'GUMMY'),
    ToppingModel('Fruit', 'FRUIT'),
  ];
  List<ToppingModel> selectedIceCreamToppings = [
    iceCreamToppings[0],
    iceCreamToppings[5],
  ];

  // Selection Picker Model
  static const List<SpeedModel> speedOptions = <SpeedModel>[
    SpeedModel('Light', Icon(Icons.sort)),
    SpeedModel('Ridiculous', Icon(Icons.clear_all)),
    SpeedModel('Ludicrous', Icon(Icons.swap_calls)),
    SpeedModel('Plaid', Icon(Icons.select_all)),
  ];
  SpeedModel speed = speedOptions[2];

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
  PlatformFile file = PlatformFile(name: 'somefile.ext', size: 1024 * 1024 * 15, bytes: Uint8List(1024 * 1024 * 15));
}
