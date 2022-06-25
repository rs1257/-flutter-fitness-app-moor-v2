import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Measurements extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  DateTimeColumn get date => dateTime()();
  RealColumn get value => real()();
  TextColumn get type => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Exercises extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  BlobColumn get icon => blob()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  TextColumn get equipment => text()();
  IntColumn get type => integer()(); // 0 for compound, 1 for isoloation, 2 for stretches, 3 for yoga, 4 for cardio
  TextColumn get primaryMuscles => text()();
  TextColumn get secondaryMuscles => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class ExerciseRecords extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();
  IntColumn get exercise => integer()(); // foreign key
  DateTimeColumn get date => dateTime()();
  IntColumn get sets => integer()();
  IntColumn get reps => integer()();
  RealColumn get weight => real()();
  IntColumn get rest => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(
    tables: [Measurements, Exercises, ExerciseRecords],
    daos: [MeasurementDao, ExerciseDao, ExerciseRecordDao])
// _$AppDatabase is the name of the generated class
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(flutterQueryExecutor());

  static FlutterQueryExecutor flutterQueryExecutor() {
    return FlutterQueryExecutor.inDatabaseFolder(
      path: 'FitnessApp.sqlite',
      logStatements: true,
    );
  }

  // Bump this when changing tables and columns.
  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [Measurements])
class MeasurementDao extends DatabaseAccessor<AppDatabase>
    with _$MeasurementDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  MeasurementDao(this.db) : super(db);

  // All tables have getters in the generated class - we can select the tasks table
  Future<List<Measurement>> getAllMeasurements() => select(measurements).get();

  // Moor supports Streams which emit elements when the watched data changes
  Stream<List<Measurement>> watchAllMeasurements() =>
      select(measurements).watch();

  Future insertMeasurement(Measurement m) => into(measurements).insert(m);

  // Updates a Task with a matching primary key
  Future updateMeasurement(Measurement m) => update(measurements).replace(m);

  Future deleteMeasurement(Measurement m) => delete(measurements).delete(m);

  Future<Measurement> getMeasurement(int id) {
    return (select(measurements)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<List<Measurement>> getAllMeasurementsOfType(String type) {
    return (select(measurements)..where((t) => t.type.equals(type))).get();
  }

  Future<List<Measurement>> getMeasurementsOfTypeInDateRange(String type, DateTime fromDate, DateTime toDate) {
    return (select(measurements)
        ..where((t) => t.type.equals(type))
        ..where((m) => m.date.isBiggerOrEqualValue(fromDate))
        ..where((m) => m.date.isSmallerThanValue(toDate))
      ).get();
  }
}

@UseDao(tables: [Exercises])
class ExerciseDao extends DatabaseAccessor<AppDatabase>
    with _$ExerciseDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ExerciseDao(this.db) : super(db);
}

@UseDao(tables: [ExerciseRecords])
class ExerciseRecordDao extends DatabaseAccessor<AppDatabase>
    with _$ExerciseRecordDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  ExerciseRecordDao(this.db) : super(db);
}
