import 'package:fitness_app/widgets/graph_widget.dart';
import 'package:fitness_app/widgets/measurement_widget.dart';
import 'package:flutter/material.dart';

class ReportsFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(8),
        children: measurementOptions
            .map<Widget>((String t) => Card(
                    child: ExpansionTile(
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(8),
                        height: 200,
                        child: SimpleTimeSeriesChart(type: t))
                  ],
                  title: Text(t + ' Graph'),
                )))
            .toList());
  }
}
