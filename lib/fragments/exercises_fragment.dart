import 'package:flutter/material.dart';

const exerciseTypes = [
  'Traps',
  'Shoulders',
  'Chest',
  'Biceps',
  'Forearm',
  'Abs',
  'Quads',
  'Calves',
  'Triceps',
  'Back',
  'Glutes',
  'Hamstrings',
  //'Stretches',
  //'Yoga', Where do I put these 3?
  //'Cardio',
  // Do I want all exercises?
  // I used paint 3d to edit the images
];

class ExercisesFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: exerciseTypes
            .map<Widget>((String t) => Card(
                  child: Column(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: Center(child: Text(t, style: TextStyle(color: Colors.white, fontSize: 14),)),
                      color: Colors.blue,
                    ),
                    Container(child:
                    Image.asset('assets/icons/' + t.toLowerCase() + '.jpg'),
                    padding: const EdgeInsets.all(4),
                    height: 130
                    ),
                  ]),
                ))
            .toList());
  }
}
