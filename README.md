# Flutter Material Pickers

A flutter package containing commonly used material design picker dialogs. Some are new, some wrap existing or built in pickers with a common dialog and access function.

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/main_new_pickers.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/main_convenience_pickers.png" width="200">

It includes:

- **New Pickers**
  - _showMaterialCheckboxPicker_ - Allows many selections from a checkbox list
  - _showMaterialScrollPicker_ - Shows a slot machine style picker for a single value
  - _showMaterialNumberPicker_ - Shows a slit machine style picker for a number
  - _showMaterialRadioPicker_ - Allows a single value selection from a radio list
  - _showMaterialSelectionPicker_ - Shows an icon and label list to pick a single value
- **Convenience Pickers**
  - _showMaterialColorPicker_ - Displays the color picker provided in the flutter_colorpicker library
  - _showMaterialDatePicker_ - Displays the core date picker
  - _showMaterialTimePicker_ - Displays the core time picker
- **Dialog**
  - _showMaterialResponsiveDialog_ - Picker list of arbitrary options

All show helpers implement an `onChange` handler to return picked option(s).

## Example Usage

### Empty Dialog Example

Although not a picker, per se, the _showMaterialEmptyPicker_ helper displays the universal material design dialog wrapper that the pickers appear in. Using this directly, however, allows any content to be injected into the content area by passing in a custon Widget as the child. This code shows the basic structure of all the helpers:

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_empty_picker-l.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_empty_picker-d.png" width="200">

```dart
showMaterialResponsiveDialog(
    context: context,
    child: Center(
        child: Container(
            padding: EdgeInsets.all(30.0),
            child: Text("Any content here."),
            style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
            ),
        ),
    ),
);
```

### Scroll Picker Example

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_scroll_picker-l.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_scroll_picker-d.png" width="200"><img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_scroll_picker-ll.png" height="200">

```dart
var selectedUsState = "Connecticut";

List<String> usStates = <String>[
  'Alabama',
  'Alaska',
  'Arizona',
  'Arkansas',
  'California',
  'Colorado',
  'Connecticut',
  ...
];

showMaterialScrollPicker(
    context: context,
    title: "Pick Your City",
    items: usStates,
    selectedItem: selectedUsState,
    onChanged: (value) => setState(() => selectedUsState = value),
);
```

### Number Picker Example

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_number_picker-l.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_number_picker-d.png" width="200">

```dart
var age = 25;

showMaterialNumberPicker(
  context: context,
  title: "Pick Your Age",
  maxNumber: 100,
  minNumber: 14,
  selectedNumber: age,
  onChanged: (value) => setState(() => age = value),
);
```

### Checkbox Picker Example

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_checkbox_picker-l.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_checkbox_picker-d.png" width="200">

```dart
List<String> iceCreamToppings = <String>[
  'Hot Fudge',
  'Sprinkles',
  'Caramel',
  'Oreos',
  ...
];
List<String> selectedIceCreamToppings = <String>[
  'Hot Fudge',
  'Sprinkles',
];

showMaterialCheckboxPicker(
  context: context,
  title: "Pick Your Toppings",
  items: iceCreamToppings,
  selectedItems: selectedIceCreamToppings,
  onChanged: (value) => setState(() => selectedIceCreamToppings = value),
);
```

### Radio Picker Example

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_radio_picker-l.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_radio_picker-d.png" width="200">

```dart
var selectedUsState = "Connecticut";

List<String> usStates = <String>[
  'Alabama',
  'Alaska',
  'Arizona',
  'Arkansas',
  'California',
  'Colorado',
  'Connecticut',
  ...
];

showMaterialRadioPicker(
  context: context,
  title: "Pick Your City",
  items: model.usStates,
  selectedItem: selectedUsState,
  onChanged: (value) => setState(() => selectedUsState = value),
);
```

### Selection Picker Example

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_selection_picker-l.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_selection_picker-d.png" width="200">

```dart
String speed = 'Ludicrous';

List<String> speedOptions = <String>[
  'Light',
  'Ridiculous',
  'Ludicrous',
  'Plaid',
];

List<Icon> speedIcons = <Icon>[
  Icon(Icons.sort),
  Icon(Icons.clear_all),
  Icon(Icons.swap_calls),
  Icon(Icons.select_all),
];

showMaterialSelectionPicker(
  context: context,
  title: "Starship Speed",
  items: model.speedOptions,
  selectedItem: model.speed,
  icons: model.speedIcons,
  onChanged: (value) => setState(() => model.speed = value),
);
```

### Time Picker Example

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_time_picker-l.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_time_picker-d.png" width="200">

```dart
var time = TimeOfDay.now();

showMaterialTimePicker(
  context: context,
  selectedTime: time,
  onChanged: (value) => setState(() => time = value),
);
```

### Date Picker Example

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_date_picker-l.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_date_picker-d.png" width="200">

```dart
var date = DateTime.now();

showMaterialDatePicker(
  context: context,
  selectedDate: model.date,
  onChanged: (value) => setState(() => model.date = value),
);
```

### Color Picker Example

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_color_picker-l.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_color_picker-d.png" width="200">

```dart
Color color = Colors.red;

showMaterialColorPicker(
  context: context,
  selectedColor: model.color,
  onChanged: (value) => setState(() => model.color = value),
);
```

### Palette Picker Example

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_palette_picker-l.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_palette_picker-d.png" width="200">

```dart
Color palette = Colors.green;

showMaterialPalettePicker(
  context: context,
  selectedColor: model.palette,
  onChanged: (value) => setState(() => model.palette = value),
);
```

### Swatch Picker Example

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_swatch_picker-l.png" width="200"> <img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_swatch_picker-d.png" width="200">

```dart
Color swatch = Colors.blue;

showMaterialSwatchPicker(
  context: context,
  selectedColor: swatch,
  onChanged: (value) => setState(() => swatch = value),
);
```

## Dependencies

This widget set relies on these external third-party components:

- [flutter_colorpicker](https://pub.dartlang.org/packages/flutter_colorpicker)

## Changelog

Please see the [Changelog](https://github.com/codegrue/flutter_material_pickers/blob/master/CHANGELOG.md) page to know what's recently changed.

## Authors

- Jeff Jorczak <jeff@jorczak.com>

## Contributions

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/codegrue/flutter_material_pickers/issues).

If you fixed a bug or implemented a new feature, please send a [pull request](https://github.com/codegrue/flutter_material_pickers/pulls).
