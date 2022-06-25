import 'package:fitness_app/data/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:preferences/preferences.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class _FormData {
  double chest;
  double abs;
  double thigh;
  int age;
}

class JacksonPollock3Widget extends StatefulWidget {
  //Currently this is only for males
  @override
  _JacksonPollock3WidgetState createState() => _JacksonPollock3WidgetState();
}

class _JacksonPollock3WidgetState extends State<JacksonPollock3Widget> {
  final _formKey = GlobalKey<FormState>();
  final _FormData _data = _FormData();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 20.0, right: 20.0, left: 20.0, bottom: 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter chest caliper value',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onSaved: (value) {
                _data.chest = double.parse(value);
              },
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter abs caliper value',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onSaved: (value) {
                _data.abs = double.parse(value);
              },
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter thigh caliper value',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onSaved: (value) {
                _data.thigh = double.parse(value);
              },
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your age',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onSaved: (value) {
                _data.age = int.parse(value);
              },
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // Process data.
                    _formKey.currentState.save();
                    showDialog<String>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              'Your body fat percentage is: ' +
                                  calculateBodyFatPercentage(_data).toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          );
                        });
                  }
                },
                child: const Text('Calculate'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateBodyFatPercentage(_FormData data) {
    final double sumOfSkinfolds = data.chest + data.abs + data.thigh;
    final double sumOfSkinfoldsSquared = sumOfSkinfolds * sumOfSkinfolds;
    final double bodyDensity = 1.10938 -
        (0.0008267 * sumOfSkinfolds) +
        (0.0000016 * sumOfSkinfoldsSquared) -
        (0.0002574 * data.age);
    return (495 / bodyDensity) - 450;
  }
}
