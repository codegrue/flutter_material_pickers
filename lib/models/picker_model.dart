import 'package:flutter/material.dart';

/// This model is used as the element data structure for each of the picker controls.
class PickerModel {
  const PickerModel(this.name, {this.code, this.icon});

  /// the name tha will appear to the user in the picker
  final String name;

  /// Optional identifier object that is returned when the item is selected
  final Object? code;

  /// An optional icon that will show to the left of the picker item
  final Icon? icon;

  @override
  String toString() => name;
}
