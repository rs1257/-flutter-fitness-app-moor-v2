import 'package:charts_flutter/flutter.dart' as charts;
import 'package:fitness_app/data/moor_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimpleTimeSeriesChart extends StatelessWidget {
  final String type;

  const SimpleTimeSeriesChart({this.type});

  @override
  Widget build(BuildContext context) {
    final dao = Provider.of<MeasurementDao>(context);
    return FutureBuilder(
        // can change to stream and it still works
        future: dao.getAllMeasurementsOfType(type),
        builder: (context, AsyncSnapshot<List<Measurement>> snapshot) {
          final measurements = snapshot.data ?? [];
          return charts.TimeSeriesChart(
            _loadData(measurements),
            animate: false,
            // Optionally pass in a [DateTimeFactory] used by the chart. The factory
            // should create the same type of [DateTime] as the data provided. If none
            // specified, the default creates local date time.
            dateTimeFactory: const charts.LocalDateTimeFactory(),
            defaultRenderer: charts.LineRendererConfig(includePoints: true),
            primaryMeasureAxis: const charts.NumericAxisSpec(
                tickProviderSpec:
                    charts.BasicNumericTickProviderSpec(zeroBound: false)),
            domainAxis: const charts.DateTimeAxisSpec(
              tickProviderSpec: charts.DayTickProviderSpec(increments: [2]),
              tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
                day: charts.TimeFormatterSpec(
                  format: 'dd',
                  transitionFormat: 'dd MMM',
                ),
              ),
            ),
          );
        });
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesMeasurements, DateTime>> _loadData(dynamic
      measurements) {
    final List<dynamic> data = <dynamic>[];
    /* to save the date I have stored
    measurements
        .forEach((Measurement m) => {print(m.date.toString() + ':' + m.value.toString())});*/
    measurements
        .forEach((Measurement m) => {data.add(TimeSeriesMeasurements(m))});
    return [
      charts.Series<TimeSeriesMeasurements, DateTime>(
        id: 'Measurement',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesMeasurements m, _) => m.time,
        measureFn: (TimeSeriesMeasurements m, _) => m.value,
        data: data.cast(),
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesMeasurements {
  DateTime time;
  double value;

  TimeSeriesMeasurements(Measurement m) {
    time = m.date;
    value = m.value;
  }
}
