// example viewmodel for the form
import 'package:flutter/material.dart';

class ExampleModel {
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

  List<String> iceCreamToppings = <String>[
    'Hot Fudge',
    'Sprinkles',
    'Caramel',
    'Oreos',
    'Peanut Butter',
    'Cookie Dough',
    'Whipped Cream',
    'Marshmallow',
    'Nuts'
  ];
  List<String> selectedIceCreamToppings = <String>[
    'Hot Fudge',
    'Caramel',
    'Whipped Cream',
    'Marshmallow',
  ];

  var age = 25;
  var time = TimeOfDay.now();
  var date = DateTime.now();
  Color color = Colors.red;
}
