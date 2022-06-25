
// can create unittests for this...
class Schedule {
  List<List<String>> _split;
  List _equipment;
  
  Schedule(List<List<String>> split, List equipment) {
    _split = split; // number of arrays inside is the days. All exercises are in these arrays
    _equipment = equipment;
  }  

  void generateWorkout() {
    for (var day in _split) {
      // get exercises for the day from the db
      // only get some compound and some isolation.
      // check equipment requirements are met.
      // randomly pick the exercises from results returned once for isolation, once for compound .etc
    }
  }
}