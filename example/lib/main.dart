import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

import 'model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => ThemeData(
              primarySwatch: Colors.indigo,
              brightness: brightness,
            ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            title: 'Material Picker Examples',
            theme: theme,
            home: TestPage(),
          );
        });
  }
}

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var model = ExampleModel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text("Material Picker Examples"),
          actions: <Widget>[
            IconButton(
              icon: Theme.of(context).brightness == Brightness.dark
                  ? Icon(Icons.brightness_7)
                  : Icon(Icons.brightness_4),
              onPressed: () => DynamicTheme.of(context).setBrightness(
                  Theme.of(context).brightness == Brightness.dark
                      ? Brightness.light
                      : Brightness.dark),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(text: "New Pickers"),
              Tab(text: "Convenience Pickers"),
            ],
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(8.0),
          child: TabBarView(
            children: <Widget>[
              Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: ListView(
                    children: <Widget>[
                      buildEmptyRow(context),
                      Divider(),
                      buildScrollRow(context),
                      Divider(),
                      buildNumberRow(context),
                      Divider(),
                      buildCheckboxRow(context),
                      Divider(),
                      buildRadioRow(context),
                      Divider(),
                      buildSelectionRow(context),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: ListView(
                    children: <Widget>[
                      buildTimeRow(context),
                      Divider(),
                      buildDateRow(context),
                      Divider(),
                      buildColorRow(context),
                      Divider(),
                      buildPaletteRow(context),
                      Divider(),
                      buildSwatchRow(context)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildEmptyRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Empty Dialog"),
            onPressed: () => showMaterialResponsiveDialog(
              context: context,
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    "This is the base dialog widget for the pickers. Unlike the off-the-shelf Dialog widget, it handles landscape orientations. You may place any content here you desire.",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            "n/a",
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildScrollRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Scroll Picker"),
            onPressed: () => showMaterialScrollPicker(
              context: context,
              title: "Pick Your City",
              items: model.usStates,
              selectedItem: model.selectedUsState,
              onChanged: (value) =>
                  setState(() => model.selectedUsState = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            model.selectedUsState.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildNumberRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Number Picker"),
            onPressed: () => showMaterialNumberPicker(
              context: context,
              title: "Pick Your Age",
              maxNumber: 100,
              minNumber: 14,
              selectedNumber: model.age,
              onChanged: (value) => setState(() => model.age = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            model.age.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildCheckboxRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Checkbox Picker"),
            onPressed: () => showMaterialCheckboxPicker(
              context: context,
              title: "Pick Your Toppings",
              items: model.iceCreamToppings,
              selectedItems: model.selectedIceCreamToppings,
              onChanged: (value) =>
                  setState(() => model.selectedIceCreamToppings = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            model.selectedIceCreamToppings.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildRadioRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Radio Picker"),
            onPressed: () => showMaterialRadioPicker(
              context: context,
              title: "Pick Your City",
              items: model.usStates,
              selectedItem: model.selectedUsState,
              onChanged: (value) =>
                  setState(() => model.selectedUsState = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            model.selectedUsState.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildSelectionRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Selection Picker"),
            onPressed: () => showMaterialSelectionPicker(
              context: context,
              title: "Starship Speed",
              items: model.speedOptions,
              selectedItem: model.speed,
              icons: model.speedIcons,
              onChanged: (value) => setState(() => model.speed = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            model.speed,
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildTimeRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Time Picker"),
            onPressed: () => showMaterialTimePicker(
              context: context,
              selectedTime: model.time,
              onChanged: (value) => setState(() => model.time = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            model.time.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildDateRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Date Picker"),
            onPressed: () => showMaterialDatePicker(
              context: context,
              selectedDate: model.date,
              onChanged: (value) => setState(() => model.date = value),
            ),
          ),
        ),
        Expanded(
          child: Text(
            model.date.toString(),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Row buildColorRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Color Picker"),
            onPressed: () => showMaterialColorPicker(
              context: context,
              selectedColor: model.color,
              onChanged: (value) => setState(() => model.color = value),
            ),
          ),
        ),
        Expanded(child: Container()),
        Container(
          height: 20.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: model.color,
          ),
        ),
      ],
    );
  }

  Row buildPaletteRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Palette Picker"),
            onPressed: () => showMaterialPalettePicker(
              context: context,
              selectedColor: model.palette,
              onChanged: (value) => setState(() => model.palette = value),
            ),
          ),
        ),
        Expanded(child: Container()),
        Container(
          height: 20.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: model.palette,
          ),
        ),
      ],
    );
  }

  Row buildSwatchRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150.0,
          child: RaisedButton(
            child: Text("Palette Picker"),
            onPressed: () => showMaterialSwatchPicker(
              context: context,
              selectedColor: model.swatch,
              onChanged: (value) => setState(() => model.swatch = value),
            ),
          ),
        ),
        Expanded(child: Container()),
        Container(
          height: 20.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: model.swatch,
          ),
        ),
      ],
    );
  }
}
