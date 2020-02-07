import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/block_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_colorpicker/material_picker.dart';

const double _kPickerHeaderPortraitHeight = 60.0;

enum ColorPickerType { colors, material, block }

void showMaterialColorPicker({
  BuildContext context,
  String title = "Pick a color",
  Color selectedColor,
  ColorPickerType pickerType = ColorPickerType.colors,
  ValueChanged<Color> onChanged,
}) {
  Widget _pickerControl;

  switch (pickerType) {
    case ColorPickerType.colors:
      _pickerControl = ColorPicker(
        pickerColor: selectedColor,
        onColorChanged: (color) => selectedColor = color,
        colorPickerWidth: 1000.0,
        pickerAreaHeightPercent: 0.3,
        enableAlpha: true,
        displayThumbColor: true,
        enableLabel: true,
        paletteType: PaletteType.hsv,
      );
      break;
    case ColorPickerType.material:
      _pickerControl = MaterialPicker(
        pickerColor: selectedColor,
        onColorChanged: (color) => selectedColor = color,
        enableLabel: true, // only on portrait mode
      );
      break;
    case ColorPickerType.block:
      _pickerControl = BlockPicker(
        pickerColor: selectedColor,
        onColorChanged: (color) => selectedColor = color,
      );
      break;
  }

  showDialog<Color>(
    context: context,
    builder: (BuildContext context) {
      return OrientationBuilder(builder: (context, orientation) {
        return AlertDialog(
          title: Container(
            color: Theme.of(context).primaryColor,
            height: _kPickerHeaderPortraitHeight,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            padding: EdgeInsets.all(20.0),
          ),
          titlePadding: const EdgeInsets.all(0.0),
          contentPadding: const EdgeInsets.all(0.0),
          content: SingleChildScrollView(child: _pickerControl),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop<Color>(selectedColor),
            ),
          ],
        );
      });
    },
  ).then((selection) {
    if (onChanged != null) onChanged(selection);
  });
}
