import 'package:fitness_app/widgets/calculators/body_mass_index_widget.dart';
import 'package:fitness_app/widgets/calculators/jackson_pollock_3_widget.dart';
import 'package:fitness_app/widgets/calculators/jackson_pollock_4_widget.dart';
import 'package:flutter/material.dart';

class CalculatorFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget> [
            createCard(300, JacksonPollock3Widget(), 'Jackson-Pollock 3 Body Fat'),
            createCard(350, JacksonPollock4Widget(), 'Jackson-Pollock 4 Body Fat'),
            createCard(200, BodyMassIndexWidget(), 'Body Mass Index (BMI)')
        ]
    );
  }

  Card createCard(double height, Widget widget, String title){
    return Card(
      child: ExpansionTile(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              height: height,
              child: widget
            )
          ],
          title: Text(title),
      )
    );
  }
}