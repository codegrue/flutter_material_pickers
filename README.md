# Flutter Material Pickers

A flutter package containing commonly used material design picker dialogs. Some are new, some wrap existing or built in pickers with a common dialog and access function.

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
  - _showMaterialEmptyPicker_ - Picker list of arbitrary options

All show helpers implement an `onChange` handler to return picked option(s).

## Empty Dialog Example

Although not a picker, per se, the _showMaterialEmptyPicker_ helper displays the universal material design dialog wrapper that the pickers appear in. Using this directly, however, allows any content to be injected into the content area by passing in a custon Widget as the child. This code shows the basic structure of all the helpers:

<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_empty_picker-l.png" width="200">
<img src="https://github.com/codegrue/flutter_material_pickers/blob/master/images/show_empty_picker-d.png" width="200">

```dart
showMaterialEmptyPicker(
    context: context,
    child: Center(
        child: Container(
            padding: EdgeInsets.all(30.0),
            child: Text(
            "This is the base dialog widget for the pickers. However, you can place any content here you desire.",
            style: TextStyle(
                fontSize: 20.0,
                fontStyle: FontStyle.italic,
            ),
            ),
        ),
    ),
);
```

## Scroll Picker Example

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
    items: model.usStates,
    selectedItem: model.selectedUsState,
    onChanged: (value) => setState(() => model.selectedUsState = value),
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
