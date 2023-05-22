# Releases

## [3.5.0] - 2023-05-22

- Implemented `dart fix` automated changes
- Added support for SDK 3.0.0

## [3.4.0] - 2023-05-22

- Upgraded `intl` to 0.18.0
- Upgraded `file_picker` to 5.3.0

## [3.3.0] - 2022-10-25

- Enabled `SelectionPicker` to have a null `selectedItem` property

## [3.2.0] - 2022-10-24

- Updated pubspec.yaml with file_picker v^5.2.1 to resolve version conflicts on other packages
- Added option to disable cancellation for most picker / dialog types (Issue: #42)
- Added an optional Select All / Deselect All option to the checkbox picker
- Added an optional "onSelectionChanged" to the checkbox dialog, which calls back each time a selection changes, but before submission.

## [3.1.4+1] - 2022-04-08

- formatting

## [3.1.4] - 2022-04-08

- added example back in
- improved documentation

## [3.1.3] - 2022-04-07

- Updated dependency versions

## [3.1.2] - 2021-09-29

- Updated `flutter_colorpicker` version
- replaces `theme.accentColor` with `theme.colorScheme.secondary`

## [3.1.1] - 2021-08-04

- Fixing `transformer` method not being called on `showMaterialScrollPicker`

## [3.1.0] - 2021-06-11

- provided a standard `PickerModel` that can be used with all picker type controls

## [3.0.0] - 2021-06-10

There are some **breaking changes** in 3.0.0 (from 2.1.1).

- Pickers accept generic types passed to pickers and helpers.
- There's no need to pass several lists (items, values, icons), just pass
  one list of generic type objects.
- A selected item of generic type is passed as `selectedItem` not
  `selectedValue` to match name of `items`.
- To convert an item to a string displayed to a user either override
  toString() in generic type class or pass transformer callback which
  accepts an item and returns a String. (see examples)
- To provide item's icon in SelectionPicker (and alikes), pass iconizer
  callback which accepts an item and returns an Icon. (see example)

## [2.1.1] - 2021-4-13

- Fixed item not showing on scroll picker [thanks elliotrtd]

## [2.1.0] - 2021-4-12

- Added an optional `values` list to `showMaterialSelectionPicker`, `showMaterialCheckboxPicker`, `showMaterialRadioPicker`, and `showMaterialScrollPicker`. This allows separate display names and returned values. Can be used for consistent localization scenarios. Note: This is a minor breakign change. The field `selectedItem` was changed to `selectedValue`.

## [2.0.1] - 2021-03-22

- allow null initial value for RadioPicker
- allow null initial value for CheckBoxPicker
- allow null initial value for NumberRicker
- upgraded to null save colorpicker

## [2.0.0] - 2021-03-12

- Bumped SDK restriction from 2.7.0 to 2.12.0 (new minimum).
- Removed the meta package dependency since the @required annotation has been replaced and is not needed for named parameters anymore.
- Added the required modifier to any required parameters in widgets and/or functions.
- Changed the types of any optional named parameters to be nullable (ex. from String to String?).
- Removed unnecessary not null asserts for required parameters as package users cannot send nullable values for these anymore.
- Replaced the DynamicTheme dependency with the actively maintained AdaptiveTheme in order to make sure the package supports sound null safety and is not in mixed mode (ie. depends on packages with no null safety).
- Replaced deprecated widget FlatButton with the replacement ElevatedButton where applicable (no changes to api surface of the package were made).
- changed the datePicker dialog to use the ResponsiveDialog so it behaves like the other widgets

## [1.9.2] - 2021-02-08

- added support for `intl` nullsafety.2

## [1.9.1] - 2021-01-11

- updated formatting to pass static analysis tests

## [1.9.0] - 2021-01-05

- implemented step feature on MaterialNumberPicker (thanks Enough7)
- upgraded to latest dependencies

## [1.8.1] - 2020-11-10

- updated file_picker to version 2.0.12
- Fix allowedExtensions on file picker [CoolONEOfficial]

## [1.8.0] - 2020-10-01

- Upgraded to 2.0 version of `file_picker`
- confirmed compatibility with Web and added web to the example

## [1.7.4] - 2020-08-27

- fixed null error in scrollpicker

## [1.7.3] - 2020-08-26

- updated 'showMaterialResponsiveDialog' to property capture 'maxShortSide' parameter.
- fixed null error in numberpicker

## [1.7.2] - 2020-07-27

- added `showDivider` option to hide the divider on the scroll picker

## [1.7.1] - 2020-07-21

- removed pub.dev issue in readme.md with email
- exposed FileType enum from file_picker

## [1.7.0] - 2020-07-20

- changed file picker from file_picker_cross to file_picker for better compatibility
- added `onConfirmed` event to all dialog helpers

## [1.6.0] - 2020-07-08

- added ability to customize `confirmText` and `cancelText`
- added `onCancelled` handler to all helpers
- updated dependencies

## [1.5.4] - 5/25/2020

- added `hideButtons` to `ResponsiveDialog`

## [1.5.3] - 5/24/2020

- added `showMaterialFilePicker` which wraps `file_picker_cross`

## [1.5.2] - 5/20/2020

- changed `ScrollPicker` to use `ListWheelScrollView` internally so it functions better.

## [1.5.1] - 5/15/2020

- fixed positioning bug in selection picker with only two items

## [1.5.0] - 5/15/2020

- constrained max sizes for dialogs so they don't go full screen
- verified correct functionality on flutter web

## [1.4.0] - 5/5/2020

- changed the theming elements to properly match Material design elements (see readme example);
- fixed centering issue on scroll picker

## [1.3.0] - 4/16/2020

- Upgraded dependency to latest `flutter_colorpicker`

## [1.2.0] - 2/13/2020

- Added `headerTextColor` parameter to each helper method

## [1.1.0] - 2/13/2020

- Added ability to control several colors to each show method

## [1.0.0] - 2/13/2020

- Initial Release
