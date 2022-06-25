import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _FormData {
  double height;
  double weight;
}

class BodyMassIndexWidget extends StatefulWidget { //Currently this is only for males
  @override
  _BodyMassIndexWidgetState createState() => _BodyMassIndexWidgetState();
}

class _BodyMassIndexWidgetState extends State<BodyMassIndexWidget> {
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
                hintText: 'Enter your height in m',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onSaved: (value) {
                _data.height = double.parse(value);
              },
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter weight in kg',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onSaved: (value) {
                _data.weight = double.parse(value);
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
                              'Your BMI is: ' +
                                  calculateBMI(_data).toString(),
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

  double calculateBMI(_FormData data){
    // weight (kg) / height (m) * height (m)
    return data.weight / (data.height * data.height);
  }
}
