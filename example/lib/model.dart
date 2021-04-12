// example viewmodel for the form
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ExampleModel {
  // Scroll/Radio Picker Model
  String? selectedUsState = 'CT';
  List<String> usStates = <String>[
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'Florida',
    'Georgia',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Carolina',
    'North Dakota',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'Utah',
    'Vermont',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming',
  ];
  List<String> usStateCodes = <String>[
    'AL',
    'AK',
    'AZ',
    'AR',
    'CA',
    'CO',
    'CT',
    'DE',
    'FL',
    'GA',
    'HW',
    'ID',
    'IL',
    'IN',
    'IO',
    'KN',
    'KT',
    'LA',
    'MA',
    'ML',
    'MA',
    'MI',
    'MN',
    'MS',
    'MO',
    'MO',
    'NE',
    'NV',
    'NH',
    'NJ',
    'NM',
    'NY',
    'NC',
    'ND',
    'OH',
    'OK',
    'OR',
    'PA',
    'RI',
    'SC',
    'SD',
    'TN',
    'TX',
    'UT',
    'VT',
    'VA',
    'WA',
    'WV',
    'WI',
    'WY',
  ];

  // Checkbox Picker Model
  List<String> iceCreamToppings = <String>[
    'Hot Fudge',
    'Sprinkles',
    'Caramel',
    'Oreos',
    'Peanut Butter',
    'Cookie Dough',
    'Whipped Cream',
    'Marshmallow',
    'Nuts',
    'Heath Bar',
    'Butterscotch',
    "m&m's",
    "Gummy worms",
    "Fruit",
  ];
  List<String> toppingCodes = <String>[
    'FUDGE',
    'SPRINK',
    'CARM',
    'OREO',
    'PB',
    'COOKIE',
    'WHIP',
    'MARSH',
    'NUTS',
    'HEATH',
    'SCOTCH',
    "MM",
    "GUMMY",
    "FRUIT",
  ];
  List<String> selectedIceCreamToppings = <String>[
    'FUDGE',
    'CARM',
  ];

  // Selection Picker Model
  List<String> speedOptions = <String>[
    'Light',
    'Ridiculous',
    'Ludicrous',
    'Plaid',
  ];
  String speed = 'Ludicrous';
  List<Icon> speedIcons = <Icon>[
    Icon(Icons.sort),
    Icon(Icons.clear_all),
    Icon(Icons.swap_calls),
    Icon(Icons.select_all),
  ];

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
  PlatformFile file = PlatformFile(bytes: Uint8List(1024 * 1024 * 15));
}
