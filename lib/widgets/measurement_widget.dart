import 'package:fitness_app/data/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

var measurementOptions = [
  'Bodyweight',
  'Body Fat',
  'Leg',
  'Arm',
  'Waist',
  'Chest',
];

var measurementUnits = [
  'kg',
  '%',
  'mm'
]; // need to wire these up to the settings.

int getUnitsIndex(String currentValue) {
  if (currentValue == measurementOptions[0]) {
    return 0;
  } else if (currentValue == measurementOptions[1]) {
    return 1;
  } else {
    return 2;
  }
}

class _FormData {
  DateTime date;
  String type;
  double measurement;
}

class MeasurementWidget extends StatefulWidget {
  @override
  _MeasurementWidgetState createState() => _MeasurementWidgetState();
}

class _MeasurementWidgetState extends State<MeasurementWidget> {
  final format = DateFormat('dd-MM-yyyy');
  final _formKey = GlobalKey<FormState>();
  final _FormData _data = _FormData();
  String selected = measurementOptions[0];

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<MeasurementDao>(context);
    return Container(
      padding: const EdgeInsets.only(
          top: 20.0, right: 20.0, left: 20.0, bottom: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
                child:
                    Text('Add a measurement', style: TextStyle(fontSize: 25))),
            DateTimeField(
              initialValue: DateTime.now(),
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
              onSaved: (value) {
                _data.date = value;
              },
            ),
            DropdownButtonFormField<String>(
              value: selected,
              items: measurementOptions
                  .map((label) => DropdownMenuItem(
                        child: Text(label),
                        value: label,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() => {selected = value});
              },
              onSaved: (value) {
                _data.type = value;
              },
            ),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 9,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter measurement value',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a value';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _data.measurement = double.parse(value);
                    },
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(measurementUnits[getUnitsIndex(selected)]),
                )
              ],
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // Process data.
                    _formKey.currentState.save();
                    dao.insertMeasurement(Measurement(
                        date: _data.date,
                        value: _data.measurement,
                        type: _data.type));

                    showDialog<String>(
                        context: context,
                        builder: (context) {
                          Future.delayed(const Duration(milliseconds: 1500),
                              () {
                            Navigator.of(context).pop(true);
                          });
                          return AlertDialog(
                            content: SizedBox(
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      selected +
                                          ' measurement successfully submitted',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Icon(FontAwesomeIcons.checkCircle,
                                        color: Colors.green, size: 50.0),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
