import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _FormData {
  double tricep;
  double abs;
  double thigh;
  double suprailiac;
  int age;
}

class JacksonPollock4Widget extends StatefulWidget { //Currently this is only for males
  @override
  _JacksonPollock4WidgetState createState() => _JacksonPollock4WidgetState();
}

class _JacksonPollock4WidgetState extends State<JacksonPollock4Widget> {
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
                hintText: 'Enter tricep caliper value',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onSaved: (value) {
                _data.tricep = double.parse(value);
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
                hintText: 'Enter suprailiac caliper value',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onSaved: (value) {
                _data.suprailiac = double.parse(value);
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

  double calculateBodyFatPercentage(_FormData data){
    final double sumOfSkinfolds = data.tricep + data.abs + data.thigh + data.suprailiac;
    final double sumOfSkinfoldsSquared = sumOfSkinfolds * sumOfSkinfolds;
    return (0.29288 * sumOfSkinfolds) - (0.0005 * sumOfSkinfoldsSquared) + (0.15845 * data.age) - 5.76377;
  }
}
