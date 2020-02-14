# Flutter Material Pickers

A flutter package containing commonly used material design picker dialogs. Some are new, some wrap existing or built in pickers with a common dialog and access function.

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/main_new_pickers.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/main_convenience_pickers.png" width="200">

It includes:

- **New Pickers**
  - _showMaterialScrollPicker:_
    - Allows selection of a string via a slot machine carousel
  - _showMaterialNumberPicker:_
    - Allows selection of a number via a slot machine carousel
  - _showMaterialRadioPicker:_
    - Allows selection of a single from a radio list
  - _showMaterialCheckboxPicker:_
    - Allows selection of many values from a checkbox list
  - _showMaterialSelectionPicker:_
    - Allows selection of a single value via an icon label list
- **Convenience Pickers**
  - _showMaterialDatePicker:_
    - Allows selection of a date (uses the core date picker)
  - _showMaterialTimePicker:_
    - Allows selection of a time (uses the core time picker)
  - _showMaterialColorPicker:_
    - Allows RGB selection of a color (uses the ColorPicker of flutter_colorpicker)
  - _showMaterialPalettePicker:_
    - Allows Material palette selection of a color (uses the MaterialPicker of flutter_colorpicker)
  - _showMaterialSwatchPicker:_
    - Allows selection of a color from swatches (uses the BlockPicker of flutter_colorpicker)
- **Dialog**
  - _showMaterialResponsiveDialog:_
    - Extends Dialog by making it responsive to screen orientation changes

All helpers implement an `onChange` handler to return picked option(s).

## Example Usage

### Empty Dialog Example

Although not a picker, per se, the _showMaterialEmptyPicker_ helper displays the universal material design dialog wrapper that the pickers appear in. Using this directly, however, allows any content to be injected into the content area by passing in a custon Widget as the child. This code shows the basic structure of all the helpers:

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_empty_picker-l.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_empty_picker-d.png" width="200">

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

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_scroll_picker-l.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_scroll_picker-d.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_scroll_picker-ll.png" height="200">

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

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_number_picker-l.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_number_picker-d.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_number_picker-ll.png" height="200">

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

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_checkbox_picker-l.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_checkbox_picker-d.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_checkbox_picker-ll.png" height="200">

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

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_radio_picker-l.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_radio_picker-d.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_radio_picker-ll.png" height="200">

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

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_selection_picker-l.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_selection_picker-d.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_selection_picker-ll.png" height="200">

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
  items: speedOptions,
  selectedItem: speed,
  icons: speedIcons,
  onChanged: (value) => setState(() => speed = value),
);
```

### Time Picker Example

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_time_picker-l.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_time_picker-d.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_time_picker-ll.png" height="200">

```dart
var time = TimeOfDay.now();

showMaterialTimePicker(
  context: context,
  selectedTime: time,
  onChanged: (value) => setState(() => time = value),
);
```

### Date Picker Example

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_date_picker-l.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_date_picker-d.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_date_picker-ll.png" height="200">

```dart
var date = DateTime.now();

showMaterialDatePicker(
  context: context,
  selectedDate: date,
  onChanged: (value) => setState(() => date = value),
);
```

### Color Picker Example

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_color_picker-l.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_color_picker-d.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_color_picker-ll.png" height="200">

```dart
Color color = Colors.red;

showMaterialColorPicker(
  context: context,
  selectedColor: color,
  onChanged: (value) => setState(() => color = value),
);
```

### Palette Picker Example

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_palette_picker-l.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_palette_picker-d.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_palette_picker-ll.png" height="200">

```dart
Color palette = Colors.green;

showMaterialPalettePicker(
  context: context,
  selectedColor: palette,
  onChanged: (value) => setState(() => palette = value),
);
```

### Swatch Picker Example

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_swatch_picker-l.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_swatch_picker-d.png" width="200"> <img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_swatch_picker-ll.png" height="200">

```dart
Color swatch = Colors.blue;

showMaterialSwatchPicker(
  context: context,
  selectedColor: swatch,
  onChanged: (value) => setState(() => swatch = value),
);
```

## Theming

Note: it is highly recommended you use Flutter's theme method to style the dialogs across your entire application in one place. The example app demonstrates switching between light and dark themes globally. The elements that control dialog color are:

- `Theme.of(context).primaryColor` controls the header background
- `Theme.of(context).backgroundColor` controls the dialog background
- `Theme.of(context).textTheme.button.decorationColor` controls the button text
- `Theme.of(context).primaryTextTheme.body1.color` controls the header text

However, if for some reason you want to change colors in an individual dialog, several parameters are exposed to allow this:

<img src="https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/images/show_checkbox_picker-custom.png" width="200">

```dart
showMaterialResponsiveDialog(
    context: context,
    headerColor: Colors.green, // background color of the header area
    backgroundColor: Colors.lightGreen, // background color of the entire dialog
    buttonTextColor: Colors.red, // text color of the action bar buttons
    child: Text("Custom dialog colors"),
);

```

## Dependencies

This widget set relies on these external third-party components:

- [flutter_colorpicker](https://pub.dartlang.org/packages/flutter_colorpicker)

## Changelog

Please see the [Changelog](https://raw.githubusercontent.com/codegrue/flutter_material_pickers/master/CHANGELOG.md) page to know what's recently changed.

## Authors

- Jeff Jorczak <jeff@jorczak.com>

## Contributions

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://raw.githubusercontent.com/codegrue/flutter_material_pickers/issues).

If you fixed a bug or implemented a new feature, please send a [pull request](https://raw.githubusercontent.com/codegrue/flutter_material_pickers/pulls).
