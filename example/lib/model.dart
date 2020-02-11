// example viewmodel for the form
import 'package:flutter/material.dart';

class ExampleModel {
  // Scroll/Radio Picker Model
  var selectedUsState = "Connecticut";
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
    "Coconut",
    "Gummy worms",
    "Fruit",
  ];
  List<String> selectedIceCreamToppings = <String>[
    'Hot Fudge',
    'Sprinkles',
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
}
